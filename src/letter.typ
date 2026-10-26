#import "helpers.typ": linked-text
#import "spacing.typ": default-spacing, spacing-state

#let letter(
  author: "",
  author-position: left,
  personal-info-position: left,
  pronouns: "",
  location: "",
  email: "",
  email-text: "",
  github: "",
  github-text: "",
  linkedin: "",
  linkedin-text: "",
  phone: "",
  personal-site: "",
  personal-site-text: "",
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-font-size: 20pt,
  font-size: 10pt,
  spacing: (:),
  lang: "en",
  date: "",
  recipient-name: "",
  recipient-title: "",
  company: "",
  company-address: "",
  subject: "",
  greeting: "",
  closing: "",
  body,
) = {
  let s = default-spacing + spacing

  set document(author: author, title: author)

  set text(
    font: font,
    size: font-size,
    lang: lang,
    ligatures: false,
  )

  set page(
    margin: (0.5in),
    paper: paper,
  )

  show link: it => {
    if type(it.dest) == str and it.dest.starts-with("tel:") {
      it
    } else {
      underline(
        offset: s.link-offset,
        stroke: s.rule-stroke.thickness + rgb(accent-color),
        it,
      )
    }
  }

  show heading: set text(
    fill: rgb(accent-color),
  )

  show link: set text(
    fill: rgb(accent-color),
  )

  show heading.where(level: 1): it => [
    #set align(author-position)
    #set text(
      weight: 600,
      size: author-font-size,
    )
    #pad(it.body)
  ]

  spacing-state.update(s)

  [= #(author)]

  pad(
    top: 0em,
    bottom: s.after-header,
    align(personal-info-position)[
      #{
        let items = (
          linked-text(pronouns),
          linked-text(phone, link-prefix: "tel:"),
          linked-text(location),
          linked-text(email, link-prefix: "mailto:", text: email-text),
          linked-text(linkedin, link-prefix: "https://", text: linkedin-text),
          linked-text(github, link-prefix: "https://", text: github-text),
          linked-text(personal-site, link-prefix: "https://", text: personal-site-text),
        )
        items.filter(x => x != none).join(" | ")
      }
    ],
  )

  set par(leading: s.leading, spacing: s.gap, justify: false)

  let kept-block(lines) = {
    let kept = lines.filter(line => line != "")
    if kept.len() > 0 {
      block(width: 100%, above: s.gap, below: 0pt)[
        #for (i, line) in kept.enumerate() {
          if i > 0 { linebreak() }
          line
        }
      ]
    }
  }

  if date != "" {
    block(width: 100%, above: s.gap, below: 0pt)[#date]
  }
  kept-block((recipient-name, recipient-title, company, company-address))
  if subject != "" {
    block(width: 100%, above: s.gap, below: 0pt)[#subject]
  }
  if greeting != "" {
    block(width: 100%, above: s.gap, below: 0pt)[#greeting]
  }

  set par(justify: true)
  block(width: 100%, above: s.gap, below: 0pt, body)

  if closing != "" {
    set par(justify: false)
    block(width: 100%, above: s.gap, below: 0pt)[
      #closing
      #v(s.gap)
      #author
    ]
  }
}
