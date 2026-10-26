#set document(title: "exp-cover-letter Manual")
#set page(paper: "us-letter", margin: 1in)
#set text(font: "New Computer Modern", size: 10pt)
#set heading(numbering: "1.")

#let pkg = "exp-cover-letter"
#let version = "0.1.0"

= Introduction

#pkg is a one-page cover letter in the same type as `@preview/exp-resume`.
It uses the same font, size, and link color. The sender is one line per
field. It does not import that package, and it has no resume sections.

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
  font: "New Computer Modern",
  font-size: 12pt,
  paper: "us-letter",
  gap: 20pt,
  date: "October 26, 2026",
  closing: "Yours sincerely,",
)

#sender(
  author: "John Doe",
  email: "john.doe@example.com",
)

#recipient(
  recipient-name: "Ada Lovelace",
  recipient-title: "Hiring Manager",
  company: "Example Corporation",
  company-address: "1 Compiler Way, Byteburg, CA",
)

First paragraph.

Second paragraph.

Third paragraph.
```

`letter.with` is the page, the date, the closing, and the gap. `#sender` is
the name and contact lines. `#recipient` is the company and the greeting.
The document body is the letter, one paragraph per block. A field left out,
or set to an empty string, is omitted. If every line in a block is omitted,
that block and the gap above it are omitted too. A letter with no paragraphs
omits the paragraph block. The greeting is `Dear {recipient-name},` when
`recipient-name` is set. Otherwise it is `Dear {recipient-title},`.

= Parameters

Contact fields match `resume.with` in exp-resume.

#table(
  columns: (1.4fr, 2.2fr),
  inset: 4pt,
  [*Parameter*], [*Role*],
  [`font`], [`letter.with`. Default `New Computer Modern`],
  [`paper`], [`letter.with`. Default `us-letter`],
  [`font-size`], [`letter.with`. Default `12pt`],
  [`gap`], [`letter.with`. Space between blocks. Default `20pt`],
  [`accent-color`], [`letter.with`. Link color. Default `#000000`],
  [`date`], [`letter.with`. Its own block, under the sender lines],
  [`closing`], [`letter.with`. Its own block. The starter uses `Yours sincerely,`],
  [`author`], [`#sender`. First line of the sender block, and the name under the closing],
  [`pronouns`], [`#sender`. Optional line in the sender block],
  [`location`], [`#sender`. Address line],
  [`email`], [`#sender`. `mailto:` target],
  [`email-text`], [`#sender`. Visible label when it should differ from `email`],
  [`phone`], [`#sender`. Shown as text. The `tel:` link is not underlined],
  [`linkedin`], [`#sender`. Handle or path, prefixed with `https://`],
  [`linkedin-text`], [`#sender`. Visible label],
  [`github`], [`#sender`. Handle or path, prefixed with `https://`],
  [`github-text`], [`#sender`. Visible label],
  [`personal-site`], [`#sender`. Host or path, prefixed with `https://`],
  [`personal-site-text`], [`#sender`. Visible label],
  [`company`], [`#recipient`. First line of the company block],
  [`company-address`], [`#recipient`. Second line. Omitted when empty],
  [`recipient-name`], [`#recipient`. Greeting is `Dear {recipient-name},` when this is set],
  [`recipient-title`], [`#recipient`. Greeting when `recipient-name` is empty],
  [`greeting`], [`#recipient`. Replaces the generated Dear line when set],
)

= Spacing

Lines inside a block use a leading of 0.55em. `gap` is the space between blocks:
the sender lines, the date, the company, the greeting, each paragraph, the
closing, and the name. The default is 20pt, which measures 36px between blocks at 144ppi. An empty
field is skipped and does not leave a gap. Links use the accent color and are not underlined, so a stacked address
line does not collide with the line under it.

```typst
#show: letter.with(
  font-size: 12pt,
  gap: 20pt,
)
```
