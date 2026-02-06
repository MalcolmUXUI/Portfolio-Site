Website in development, this is a placeholder.

## CSS Ordering SOP (plain CSS)

Goal: make CSS easy to scan, reduce accidental overrides, and keep cross-browser behavior predictable.

### 1) Property order inside a selector

1) Positioning & layout context
   - position, inset/top/right/bottom/left, z-index
   - display
   - float/clear
   - flex: flex, flex-*, justify-*, align-*, place-*, gap, order
   - grid: grid, grid-*, place-*, gap
   - container-type/name (if used)

2) Box model (size + spacing + borders)
   - box-sizing
   - width/height, min-*, max-*, aspect-ratio
   - margin, padding
   - border, border-*, border-radius
   - outline/outline-* (if not grouped with interaction)
   - logical props (`margin-inline`, `padding-block`, etc.) live here too

3) Overflow & scrolling
   - overflow, overflow-*
   - overscroll-behavior*
   - scroll-behavior, scroll-margin*, scroll-padding*, scroll-snap-*

4) Visual styling
   - background, background-*
   - color
   - opacity
   - box-shadow
   - filter, backdrop-filter (prefixed first)

5) Typography
   - font, font-*
   - line-height
   - text-align, text-transform, letter-spacing
   - white-space, word-break, overflow-wrap, hyphens
   - text-decoration*, text-rendering

6) Interaction
   - cursor, pointer-events, user-select (+ -webkit-)
   - appearance (+ -webkit-)
   - touch-action (if used)
   - outline (if kept here)

7) Motion & transforms
   - transform, transition, animation

8) Misc / perf
   - will-change, contain, content-visibility, isolation, mix-blend-mode

Notes: don’t alphabetize; keep related props near each other. Blank line between groups helps scanning.

### 2) Override rules that matter

- Vendor prefixes: prefixed first, then standard (e.g., `-webkit-backdrop-filter` then `backdrop-filter`).
- Shorthand vs longhand: shorthand first, then intentional longhand overrides. Avoid mixing unless needed.
- Fallback values: older/safer first, then progressive enhancement later (e.g., `background: #111;` then `background: linear-gradient(...)`).
- Duplicates: only when intentional fallbacks, and comment why.

### 3) Selector grouping order

Base → pseudo-classes (hover, focus, focus-visible, active, disabled) → state classes (`.is-*`) → modifiers (`--variant`). Keep them adjacent.

### 4) Responsive order

Prefer base + states, then nearby media-query overrides for the same selector. Avoid scattering the same selector across the file when possible.

### 5) @supports and fallbacks

- Fallback outside, upgrade inside @supports (e.g., `overflow-x: hidden; @supports (overflow: clip) { overflow-x: clip; }`).
- If nesting @media and @supports, keep the order consistent and comment when you invert it.

### 6) Minimal cross-browser helpers

- user-select: `-webkit-user-select` then `user-select`
- appearance: `-webkit-appearance` then `appearance`
- backdrop-filter: `-webkit-backdrop-filter` then `backdrop-filter`
- iOS text scale (only if needed): `-webkit-text-size-adjust`, `text-size-adjust`

### 7) Typography inheritance call-out

If you intentionally inherit font properties (e.g., highlights matching surrounding body/fine text), leave a short comment so it isn’t “fixed” later.

### 8) Quick template

```css
.selector {
  /* positioning + layout */

  /* box model */

  /* overflow/scroll */

  /* visuals */

  /* typography */

  /* interaction */

  /* motion */

  /* misc/perf */
}
```
