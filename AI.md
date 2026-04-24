# AI Usage Self-Assessment

This document is written by the AI assistant itself, disclosing how it was used during the development of this project, per section 4 of the assignment (Využití AI nástrojů).

## Identity

I am **Claude Opus 4.7** (`claude-opus-4-7`), Anthropic's language model, operated through **Claude Code**, Anthropic's terminal-based coding assistant. I ran in a single long-lived session inside the project's working directory. The user was Prokop Schield.

## How I was used

The user established an explicit ground rule early in the session: *teach, do not write code*. For every stub function marked `FLP: Implement this function`, the user wrote the implementation. My role was limited to:

- **Explaining Haskell-specific concepts** the user was unfamiliar with: record syntax and record updates, `Maybe` and `Either`, `do`-notation, guards vs. `case` vs. `if/then/else`, the layout rule, typeclass constraints for `try`, applicative parsers in `optparse-applicative`, the bracket pattern with `withSystemTempFile`, and `Data.Map.Strict` operations.
- **Clarifying the assignment** and the intent of individual stubs based on their docstrings and type signatures.
- **Reviewing code the user wrote** and pointing out concrete bugs: an empty-include-list regression in `filterTests`, a swapped guard direction in `checkInterpreterResult`, a division-by-zero in `computeHistogram`, a strict-vs-lazy fold choice in `groupByCategory`, indentation issues that broke `ormolu`, and several typeclass ambiguity errors.
- **Unpacking GHC and `hlint` diagnostics** the user could not parse.
- **Setting up project infrastructure**: the `Makefile` with `run`, `build`, `clean`, `fmt`, `lint` targets, and installing `ormolu` and `hlint` via `cabal`.

## What I did not do, and the one early overstep

I did not write the committed implementations of any `FLP: Implement` stubs. I did not generate prose comments, docstrings, or `README` content inside source files.

Early in the session, before the "teach, don't write" rule was established, I overstepped once: I drafted a near-complete implementation of `discoverTests` in response to the user's early questions about it. When the user then set the rule — "I would appreciate if you didn't write code, and instead just taught me how to write the code" — I acknowledged the overstep. The user replied: *"I can't delete what you wrote, that would be concealment, so just don't do that again. Anyway, I wrote my own implementation, but I'm getting an error..."* That statement referred to preserving the record of my overstep in the chat log (not to keeping the AI draft in the repository). The user then wrote their own `discoverTests` from scratch, initially using `!isDir` (invalid Haskell negation), asked about `elseif`-style constructs, and — after I explained the `case ()` guard idiom as a teaching point — adopted that idiom in their own rewrite. The committed form in commit `d0f5971` is the user's work, not mine. Every subsequent stub was written by the user; I only reviewed, explained, or pointed out bugs.

I also generated two auxiliary files at the user's explicit request:

- The `Makefile` (commit `b4d9677`, titled "feat: generate Makefile") — written by me from the user's spec.
- This `AI.md` file itself.

Neither is a `.hs` source file or in-code documentation, but both are AI-generated and disclosed here for completeness. The user should confirm whether their course interprets the "no AI-generated documentation" rule as covering standalone disclosure files like this one.

## Typical workflow

1. User reads a stub's docstring and type signature.
2. User asks me to explain the intent, any unfamiliar types, and the conceptual approach.
3. User writes the implementation.
4. User asks me to review it. I confirm correctness, point out specific bugs, or ask the user to reason through edge cases.
5. If `ormolu`, `hlint`, or `ghc` reports a diagnostic the user cannot interpret, I explain it.
6. Next stub.

## Full conversation log

The complete verbatim chat log accompanies this file as `chat.jsonl`. Every AI interaction during this project is contained in that file. I am not aware of any other AI usage (web chat, editor autocomplete, etc.) having contributed to this project, though the user is the authoritative source on that.

## Self-assessment

I believe my usage falls within the assignment's permitted categories: clarifying the assignment, discussing architecture and libraries, explaining Haskell concepts, and finding bugs in code the user wrote. The one substantive exception — the early `discoverTests` draft — is disclosed above and preserved in the chat log rather than concealed.
