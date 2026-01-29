# Handoff Notes (Plain-English Code Comments)

Goal: Make this file safe for juniors to edit without breaking layout or intent.

## Where to Edit
1) Brand name: search "Mark Malcolm" in `index.html`.
2) Headline + subhead: inside `<header>`.
3) Case studies: inside `<section id="work">` (cards).
4) Services: inside `<section id="help">` (callouts).
5) Contact info: inside `<section id="contact">`.
6) Visual style: edit `:root` tokens in `<style>` (colors, spacing, shadow).

## Commenting Standard (use this format)
- **Why** the code exists (intent).
- **Who** can safely edit it (scope).
- **What** happens if changed (impact).

Example (CSS):
/*
  BUTTONS
  Why: Keeps primary/secondary actions consistent across the site.
  Who: Safe to edit colors, padding, radius.
  Impact: Changes affect all buttons site-wide.
*/

Example (HTML):
<!--
  Case study card template:
  - Duplicate this block to add a new project.
  - Keep 2–3 lines of copy to avoid tall cards.
-->

## Safe Edit Rules (keep layout stable)
- Keep section titles as <h2> and card titles as <h3>.
- Keep `.grid` as 12 columns and cards as `grid-column: span 4` on desktop.
- Keep CTA buttons as `<a class="btn">` to preserve styling.
- Avoid removing IDs (e.g., `id="work"`) or nav links will break.

## If You Need a Change
- Add new projects by duplicating one `.card`.
- Add new services by duplicating one `.callout`.
- Adjust colors by editing the token values in `:root`.
- Ask for help if changing layout structure or media queries.

