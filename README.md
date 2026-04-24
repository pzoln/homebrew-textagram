# homebrew-textagram

Homebrew tap for `tg`.

## What is `tg`?

`tg` is a terminal editor for plain-text diagrams.

It gives you WYSIWYG-style editing with text:

- no DSL
- no hidden metadata
- no custom format
- just text in, text out

## Install

```bash
brew tap pzoln/textagram
brew install pzoln/textagram/tg
```

## Run

```bash
tg
```

## Upgrade

```bash
brew update
brew upgrade pzoln/textagram/tg
```

## Formula layout

- `Formula/tg.rb`

## Notes

- Current supported release assets:
  - macOS arm64
  - Linux x86_64
- Intel macOS is not published yet, so the tap does not provide that variant.
