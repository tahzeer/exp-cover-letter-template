# Architecture

This repository is the `exp-cover-letter` package.

- New Computer Modern, 12pt body. The sender's name is bold at that size
- Links use `accent-color`
- US Letter, 0.5in margin
- `gap` of 20pt between blocks, set on `letter.with`. That measures 36px at 144ppi
- `font-size` is set on `letter.with`. Default 12pt
- Lines inside a block stay on `leading`. An empty field is skipped

`letter.with` sets the page, the font size, the gap, the date, and the closing. `#sender`
prints the contact lines. `#recipient` prints the company lines and the
greeting. The greeting uses `recipient-name` when it is set, and
`recipient-title` otherwise. The body is the paragraphs. The name is printed
again under the closing.

## Layout

```
src/lib.typ        public exports
src/letter.typ     page shell
src/helpers.typ    linked-text
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
