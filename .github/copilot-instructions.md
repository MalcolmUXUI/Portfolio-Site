# Copilot Instructions: Mark Malcolm Portfolio Site

## Project Overview
This is a **single-file HTML portfolio** for a UX consultant (Mark Malcolm). No build tools, dependencies, or backend—just semantic HTML, CSS variables, and vanilla JS. The site is designed to be editable by non-technical stakeholders while maintaining layout integrity.

## Architecture & Key Constraints

### Single-Page Structure
- **One `index.html` file** contains everything: HTML, embedded CSS (`<style>`), and inline JS.
- **No external dependencies**—all fonts use system-ui stack; no JS frameworks.
- **Design tokens in `:root`**—colors, spacing, shadow, radius are CSS variables; changing them updates the whole site globally.

### Section IDs and Navigation
The site uses anchor links for navigation. **Never remove section IDs** (`id="work"`, `id="help"`, `id="contact"`, `id="about"`, `id="approach"`, `id="top"`):
- Sticky nav links point to these IDs.
- Removing them breaks internal navigation.
- Always preserve IDs when refactoring content.

### Layout Grid System
- **`.grid` (work section)**: 12-column CSS Grid; cards span 4 columns on desktop (3 columns), 12 on mobile (1 column).
- **`.cols` (services section)**: 1 column mobile, 3 columns on desktop (set at `@media (min-width: 840px)`).
- Keep media queries at 840px breakpoint; changing widths will break responsive layout.

## Editing Patterns (for Content Updates)

### Adding a Case Study (Work Section)
Duplicate the `.card` block inside `<section id="work">`:
```html
<article class="card">
  <h3>Project Name</h3>
  <p class="meta">One-line description of the work.</p>
  <div class="pillrow">
    <span class="pill">Tag 1</span>
    <span class="pill">Tag 2</span>
    <span class="pill">Tag 3</span>
  </div>
  <p class="win">The win: Brief highlight of the outcome.</p>
</article>
```
- **Limit to 3 `.pill` tags** for visual balance.
- Keep `.meta` and `.win` to 1–2 lines; longer text breaks card alignment.

### Adding a Service (Help Section)
Duplicate a `.callout` inside `<section id="help">`:
```html
<div class="callout">
  <h3>Service Title</h3>
  <p>2–4 lines describing the service.</p>
</div>
```
- Keep copy scannable; avoid walls of text.
- The `.cols` grid handles layout automatically.

### Updating Contact Info
Edit the email and Calendly links inside `<section id="contact">`. The structure is:
```html
Email: <a href="mailto:mark@we3.design" style="color:var(--accent); text-decoration:underline;">mark@we3.design</a><br />
```
- Links use inline `style` to keep accent color from CSS variables.
- Always keep `<br />` for line breaks in contact section.

### Updating Colors & Design Tokens
Edit `:root` variables at the top of `<style>`:
```css
:root {
  --bg:#fbfaf7;        /* page background */
  --card:#ffffff;      /* card/callout backgrounds */
  --text:#111418;      /* body text */
  --muted:#4a5568;     /* secondary text */
  --accent:#1f6feb;    /* primary action/link color */
  --accent2:#0f766e;   /* secondary accent (gradient) */
  --border:#e7e2d8;    /* card borders */
  --shadow: 0 10px 30px rgba(17,20,24,.08);
  --radius: 16px;
  --max: 1100px;       /* max content width */
}
```
- All colors are hex; all use full 6-digit format for consistency.
- Changing these propagates everywhere they're used (buttons, cards, gradients, etc.).

## Critical Safety Rules

### Never Remove or Rename
- Section `id` attributes (breaks nav).
- CSS class names (breaks styling).
- HTML heading levels inside sections (`.section-title` = `h2`, card titles = `h3`).
- `.grid` and `.cols` structure (breaks layout).

### Preserve These Patterns
- **Sticky nav**: `position: sticky; top: 0` keeps the brand and CTA in view while scrolling.
- **Soft gradients in `<body>` background**: Two `radial-gradient()` layers add warmth; don't remove them.
- **Focus outlines on links**: `outline: 3px solid rgba(31,111,235,.35)` ensures keyboard accessibility.

### Mobile-First Approach
- Default CSS is mobile-first; desktop overrides are in `@media (min-width: 840px)`.
- If adding new components, apply desktop styles in the media query, not base CSS.

## Common Tasks & Examples

| Task | Where | How |
|------|-------|-----|
| Change brand name | Sticky nav + header kicker | Search "Mark Malcolm" and update both occurrences |
| Update headline | `<header>` > `<h1>` | Keep under 60 characters for responsiveness |
| Change accent colors | `:root` variables | Use hex format; affects buttons, links, gradients |
| Add case study | Duplicate `.card` in `<section id="work">` | Keep tags to 3; copy to 2–3 lines |
| Adjust card spacing | `:root` `--radius`, `:root` `gap: 16px` in `.grid` | Change px value to adjust padding/gaps |

## Development Notes

### No Build Tool
- Changes to `index.html` are live immediately when saved.
- No bundling, minification, or deployment step needed.
- Open the file in a browser to preview (or use a local server for smooth scrolling).

### Accessibility & Performance
- Site uses semantic HTML (`<header>`, `<section>`, `<article>`, `<footer>`).
- Focus outlines enabled for keyboard navigation.
- CSS-only animations (no heavy JS); only auto-updating year in footer uses JavaScript.

### File Comments
The HTML includes `<!-- QUICK EDIT MAP -->` and CSS includes `/* Why / Who / What */` comments. Use this format when adding new sections to help future editors understand intent and safe edit zones.

## When to Ask for Help
- Changing layout structure or adding new sections → test on mobile/desktop.
- Adjusting breakpoints or media queries → verify grid behavior.
- Adding external fonts or dependencies → reconsider (defeats single-file goal).
- SEO or meta tag updates → preserve `<meta name="description">` accuracy.
