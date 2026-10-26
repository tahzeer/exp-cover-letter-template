#set document(title: "exp-cover-letter Manual")
#set page(paper: "us-letter", margin: 1in)
#set text(font: "New Computer Modern", size: 10pt)
#set heading(numbering: "1.")

#let pkg = "exp-cover-letter"
#let version = "0.1.0"

= Introduction

#pkg is a one-page cover letter whose header matches `@preview/exp-resume`.
It uses the same font, sizes, contact row, and link rules. It does not import
that package, and it has no resume sections.

Personal letters stay outside the repository.

= What to write

The starter is three paragraphs. That length comes from the University of
Michigan career center and from the Harvard Extension School resume guide.
Both say the same thing.

+ Name the role and one reason you want that employer. A referral belongs in
  the first sentence if you have one.
+ Give one or two examples with a result. Tell the story the resume only
  lists. Do not paste bullets, and do not walk through every job.
+ Close with the ask and a thank-you.

Keep the letter to one page. Use the same name, contacts, font, and accent as
the resume so the two pages read as a pair. Address a person when you can
find one. If you must explain a gap or a move, add that as its own short
paragraph. Do not apologize for a skill the posting asked for and you lack.

= Installation

```sh
typst init @preview/#pkg:#version
```

A document beside this clone can import the sources directly:

```typst
#import "exp-cover-letter-template/src/lib.typ": *
```

= Quick start

```typst
#import "@preview/#pkg:#version": *

#show: letter.with(
  author: "John Doe",
  email: "john.doe@example.com",
  accent-color: "#000000",
  date: "October 26, 2026",
  recipient-name: "Ada Lovelace",
  recipient-title: "Hiring Manager",
  company: "Example Corporation",
  subject: "Re: Software Engineer",
  greeting: "Dear Ada Lovelace,",
  closing: "Sincerely,",
)

First paragraph.

Second paragraph.

Third paragraph.
```

The document body is the letter. `#letter` prints the date, the recipient,
the subject, the greeting, that body, then the closing and the name again.
An empty string omits that line.

= Parameters

Contact fields match `resume.with` in exp-resume.

#table(
  columns: (1.4fr, 2.2fr),
  inset: 4pt,
  [*Parameter*], [*Role*],
  [`author`], [Name, also used as the typed signature],
  [`author-position`], [`left` by default, `center` in the starter],
  [`personal-info-position`], [Alignment of the contact row],
  [`pronouns`], [Optional, printed first in the contact row],
  [`phone`], [Shown as text. The `tel:` link is not underlined],
  [`location`], [Plain text in the contact row],
  [`email`], [`mailto:` target],
  [`email-text`], [Visible label when it should differ from `email`],
  [`linkedin`], [Handle or path, prefixed with `https://`],
  [`linkedin-text`], [Visible label],
  [`github`], [Handle or path, prefixed with `https://`],
  [`github-text`], [Visible label],
  [`personal-site`], [Host or path, prefixed with `https://`],
  [`personal-site-text`], [Visible label],
  [`accent-color`], [Link text and link underline. Default `#000000`],
  [`font`], [Default `New Computer Modern`],
  [`paper`], [Default `us-letter`],
  [`author-font-size`], [Default `20pt`],
  [`font-size`], [Default `10pt`],
  [`spacing`], [Merged onto `default-spacing`],
  [`date`], [Left-aligned line under the header],
  [`recipient-name`], [Omitted when empty],
  [`recipient-title`], [Omitted when empty],
  [`company`], [Omitted when empty],
  [`company-address`], [One line. Omitted when empty],
  [`subject`], [Whole line, for example `Re: Software Engineer`],
  [`greeting`], [For example `Dear Ada Lovelace,`],
  [`closing`], [For example `Sincerely,`. The name is printed under it],
)

= Spacing

`default-spacing` uses the same numbers as exp-resume. `leading` is the line
rhythm. `gap` is the space above the date, the recipient, the subject, the
greeting, each body paragraph, and the closing. `link-offset` is the
underline offset. Link underlines use `rule-stroke.thickness` and the accent
color. Section rules are not drawn.

```typst
#show: letter.with(
  author: "John Doe",
  spacing: default-spacing + (leading: 0.5em),
)
```
