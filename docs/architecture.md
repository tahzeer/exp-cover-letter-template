# Architecture

This repository is the `exp-cover-letter` package. Real letters stay outside
it. The only letter in git is the John Doe starter in `template/`.

The header is copied from `exp-resume`, not imported. A letter release can
ship without waiting on a resume version. Keep these in step with that
package when the shared header changes:

- New Computer Modern, 20pt name at weight 600, 10pt body
- Contact items joined by `" | "`, phone link not underlined
- Link text and link underline both use `accent-color`
- US Letter, 0.5in margin
- `default-spacing` in `src/spacing.typ`

`src/letter.typ` prints the name, the contact row, then the date, recipient,
subject, greeting, body, closing, and typed name. Empty strings are skipped.
There is no section rule.

## Layout

```
src/lib.typ        public exports
src/letter.typ     page shell
src/helpers.typ    linked-text
src/spacing.typ    default-spacing
template/main.typ  John Doe starter for `typst init`
docs/manual.typ    manual, compiled to docs/manual.pdf at release
tests/snapshot/    pixel test, Typst 0.15
```

`typst init` copies `template/`. The starter imports
`@preview/exp-cover-letter:0.1.0`.

## Release

`scripts/package.sh` reads `.typstignore`. `typst.toml` `exclude` keeps the
manual and `example-letter.png` out of the download archive. Both stay in
the package tree because the README links them.

A tag `vX.Y.Z` must match `typst.toml`. The release workflow pushes
`packages/preview/exp-cover-letter/<version>` to `tahzeer/typst-packages`.
That fork stays public. `./scripts/bump.sh` updates the version pins and
prepends a changelog section from commits since the previous tag.

## References

- [Typst Packages README](https://github.com/typst/packages#readme)
- [Package Manifest](https://github.com/typst/packages/blob/main/docs/manifest.md)
- [Package Submission Guidelines](https://github.com/typst/packages/blob/main/docs/README.md)
