/*
 * Package entrypoint; re-exports the public API.
 * The page shell lives in `letter.typ`. Spacing defaults live in `spacing.typ`.
 * The header rules match exp-resume. This package does not import it.
 */

#import "spacing.typ": default-spacing
#import "helpers.typ": linked-text
#import "letter.typ": letter
