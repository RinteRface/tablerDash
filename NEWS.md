# tablerDash 0.1.5

- Fixed few CRAN NOTES.

## Documentation
- Upgrade pkgdown setup.
- Add shinylive support.

## Bug Fix
- Resizing a `tablerCard()` triggers the shown javascript event, telling shiny to 
update the size of the contained object.
- Fix overflow issue in `tablerCard()`. It is now correctly applied to the card
body, so the header is always visible when scrolling.

# tablerDash 0.1.0
- first release
