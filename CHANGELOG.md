# Changelog

## v3.9.14-dup.1 (2026)

Fork of ClipGrab 3.9.14.

### Duplicate-download detection

- Warn before starting a download when the target file already exists on disk, or when the same URL is already in the download queue.
- The file path is shown in a copyable info box (`Qt::TextSelectableByMouse`) so it can be pasted into a terminal.
- The confirm dialog uses a "Duplication, Download again?" button so the intent of re-downloading is explicit.
- When a confirmed duplicate finishes, its final path is shown in the download list status column, with the full path as a tooltip.
- New context-menu action: **Copy file path**.

### Download reliability

- **Show real errors**: youtube-dlp's `ERROR: ...` output is captured (`video::getLastError()`) and displayed in the download list ("Failed: ...") and in the search info box, instead of a generic failure. Conversion errors are captured as well.
- **youtube-dlp updates**: new "Update youtube-dlp now" button on the About tab runs `yt-dlp --update` and shows a success/failure dialog with the engine output. The minimum required youtube-dlp version was raised from `2021.09.25` to `2026.01.01`.
- **Browser cookies**: new Settings > Network page lets you reuse a browser's logged-in session (`--cookies-from-browser`) to download age-restricted, private, or region-locked videos. Browsers: Firefox, Google Chrome, Chromium, Microsoft Edge, Brave, Opera, Vivaldi.
- **Format fallback**: download format selectors fall back to the best available format (`.../bv*+ba/b`, `.../b`, `.../ba/b`) when a previously picked format is no longer available, instead of failing hard.

### Not changed

- `VERSION = 3.9.14` stays as-is.
- Existing translations are shipped unchanged; the new UI strings fall back to English.