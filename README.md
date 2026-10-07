# clipgrab-dup

A fork of [ClipGrab 3.9.14](https://clipgrab.org/) (GPLv3) that adds **duplicate-download detection** and several **download-reliability fixes** for the bundled youtube-dlp engine.

## Why this fork

The user repeatedly downloaded the same video and ended up with pile-ups of `video (2).mp4`, `video (3).mp4`, ... files. This fork warns you before re-downloading something you already have (a file on disk or a video already queued) and lets you copy the target path instead of hunting for it.

It also fixes the "sometimes ClipGrab fails while another downloader works" class of problems:

1. **Real error messages** -- the actual youtube-dlp `ERROR: ...` line is now shown in the download list and the search info box instead of a generic "Failed".
2. **youtube-dlp update button** -- a "Update youtube-dlp now" button on the About tab runs `yt-dlp --update` and reports success/failure. The engine floor was raised from the ancient `2021.09.25` to `2026.01.01`.
3. **Browser cookies** -- new Settings > Network page: reuse the logged-in session of Firefox/Chrome/Chromium/Edge/Brave/Opera/Vivaldi (`--cookies-from-browser`) to get past age-restricted, private, and region-locked videos.
4. **Format fallback** -- the `-f` selector now falls back to the best available format (`bv*+ba/b`, `/b`, `/ba/b`) instead of failing when a picked format vanishes.

## Features (added vs. upstream)

- Duplicate detection on download start:
  - An existing file at the target path (works for the file picker and the default save path).
  - The same URL already in the queue.
  - Shows the existing/local path with a copyable text box and a "Duplication, Download again?" button instead of producing another `(2)`/`(3)` copy.
- When a confirmed duplicate finishes, the file path is shown in the status column (full path as tooltip).
- Context menu action **"Copy file path"**.

## Building

Root-free build on Debian/Ubuntu (downloads development Qt packages into `/tmp` and builds):

```
./build.sh
```

The finished binary is `./clipgrab`. Requires `apt-get download` access and `g++`. See `build.sh` for details.

## Packaging status

- `v3.9.14-dup.1` provides AppImage and `.deb` artifacts, plus this source repository.
- `VERSION` stays `3.9.14` in `clipgrab.pro`; the release tag marks the fork.

## License

GPLv3, same as upstream. ClipGrab is written by Thiesion and the ClipGrab team; this fork is not affiliated with the upstream project.