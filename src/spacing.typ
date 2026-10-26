// Soft-recommendation spacing defaults. Override via letter.with(spacing: (...)).
// Values match exp-resume so a resume and a letter share one rhythm.

#let default-spacing = (
  leading: 0.55em,
  gap: 0.9em,
  row: 0.7em,

  after-header: 0.25em,
  after-section-title: -10pt,
  after-section-rule: -2pt,

  rule-stroke: 0.8pt + luma(35%),
  link-offset: 4pt,
)

#let spacing-state = state("exp-cover-letter-spacing", default-spacing)
