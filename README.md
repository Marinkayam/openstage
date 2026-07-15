# OpenStage

**A zero-install, single-file video & image projection tool for live shows.**
Run a rundown of clips to an audience on a big screen, while you keep a private control view — like professional playout software (ProPresenter / vMix), but a single HTML file that runs from a folder, works offline, and has no dependencies.

> Born out of a real acrobatics show: teams and classes needed their videos projected in a precise, easy-to-reorder order, with a clean audience output and quick control for the operator. OpenStage is that tool, white-labeled.

![License: MIT](https://img.shields.io/badge/license-MIT-blue) ![Dependencies: none](https://img.shields.io/badge/dependencies-0-brightgreen) ![Vanilla JS](https://img.shields.io/badge/vanilla-JS-yellow)

> **Bilingual:** ships with **Hebrew (RTL)** and **English (LTR)** — switch anytime in **Settings (⚙)**. (A few dialogs are still Hebrew-only; completing coverage is a welcome contribution.)

---

## Why

A media player or slideshow can't do all of this at once: a **clean output for the audience**, a **separate control view for the operator**, **fast last-minute reordering**, and **standby logos / transition music** between acts. The professional tools that can are heavy, paid, and need installing. OpenStage gives you the same idea — free, tiny, and offline.

## Features

**Content**
- Multiple playlists (add / rename / delete, custom icons)
- **Videos and images** (title cards, credits)
- Drag-and-drop from anywhere in the window · reorder by drag or arrows · **duplicate an item into another list** · rename items

**Live projection — two views**
- A clean **audience window** (fullscreen, content only)
- A private **control view**: live preview, "now / next up", countdown timer, clock
- Play modes: stop-after-each / continuous auto-advance
- Per-clip duration and **total runtime** of a list (computed automatically)

**Between-act tools & audio**
- Instant **cut to black** (press `B`)
- **Standby logo** screen (video *or* image), looping and clean
- **Sound / jingle** with play–stop, auto-stops when a clip starts
- Fade transitions · volume · loop

**Fits any screen**
- Smart **blurred-fill** background (canvas-based, works on every GPU) so 16:9 content fills ultra-wide screens with no black bars and no cropping — plus black-bars and cover modes

**Reliability**
- **Remembers everything between sessions** (files, lists, settings)
- Built-in **system check** that verifies storage, sound and files
- No-cache server + on-screen version stamp
- Keyboard shortcuts · audio unlock safety net

## Quick start

**Option A — macOS (easiest)**
Double-click **`start.command`**. It starts the local server and opens the app in Chrome. Keep the Terminal window open while presenting.

**Option B — any OS**
```bash
python3 serve.py
# then open http://localhost:4321/index.html in Chrome or Edge
```
(On Windows you can also double-click **`start.bat`**.)

**Option C — no server at all**
Open `index.html` directly in Chrome/Edge, or host the folder on any static host (e.g. GitHub Pages) and open the URL. A local server is only recommended so refreshes always load the newest version.

> **Use Chrome or Edge** so the app can remember your files between sessions. Other browsers work but you'll re-add files each time.

## Dual-window model (how it works)

The control and audience views are **two instances of the same file** — the second opens with `?view=output`. They talk over the browser's **BroadcastChannel**, and video/image files are passed between them as blobs. No server round-trips, no framework.

```
┌──────────────────┐   BroadcastChannel + file blob   ┌──────────────────┐
│  Control window  │ ───────────────────────────────▶ │  Output window   │
│  (operator)      │   load / play / black / fit …     │  (audience)      │
└──────────────────┘                                   └──────────────────┘
```

## Customize / white-label

**No code needed for the basics.** Open **Settings (⚙)** in the app and change the **product name, tagline, accent colors, and language** — with a live preview. Changes are saved in the browser.

For deeper changes, edit **`index.html`**:

| What | Where |
|------|-------|
| **Full color palette** | The `:root { … }` CSS block near the top (backgrounds, text, semantic colors) |
| **Default lists** (fresh installs) | The `state = load() || { … lists:[ … ] }` object in the script |
| **Built-in sound** | Set `CONFIG.builtInSound` (near the top of the script) to a filename placed next to `index.html`, e.g. `'sound.mp3'`. Leave `''` to let users pick their own. |
| **Initial output window size** | The `window.open(..., 'width=1280,height=720')` call |

## Tech

Vanilla JavaScript, no build step, no dependencies. Uses **BroadcastChannel**, **File System Access API** + **IndexedDB** (persistence), **Canvas 2D** (blurred fill), **CSS `mask-image`** (edge feather), the **Fullscreen API**, and standard media elements. Served by a ~20-line Python static server.

## Browser support

| | Persistence | Blurred fill | Dual window |
|---|---|---|---|
| **Chrome / Edge** | ✅ full | ✅ | ✅ |
| Others | ⚠️ re-add files per session | ✅ | ✅ |

## Roadmap

- Complete i18n coverage (a few dialogs & messages are still Hebrew-only)
- More languages
- Real video thumbnails in the list
- Export / import a show (all lists + order) to a file
- Per-image display duration

## Contributing

Issues and pull requests are welcome — especially **i18n / an English UI**. It's a single file; edit `index.html`, open it in Chrome, and test.

## License

[MIT](LICENSE) © 2026 Marina Kaplan
