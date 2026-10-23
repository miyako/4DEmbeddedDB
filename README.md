# ビルドしたリモートクライアントへのデータベースストラクチャーの埋め込み

Embedded Database Structures with Built Remote Clients (4D Technical Note 25-03): Japanese edition.

このテクニカルノートでは、スタンドアロンの4Dデータベースをビルドした4Dリモートクライアントに埋め込み、4D Server に接続する前から開発者のコードを実行できるようにする手順を解説します。実装例として、リモートクライアントが `Resources/Servers/` フォルダーの .4DLink ファイルを順に確認し、稼働中のプライマリサーバーまたはフェイルオーバーサーバーに自動的に接続する仕組みを紹介します。デモは、埋め込み用のスタンドアロンデータベース（4DEmbeddedDB）とクライアント/サーバーデータベース（CS）の2つのプロジェクトで構成されています。

This technical note explains how to embed a standalone 4D database in a built 4D remote client so that developer code runs before the client connects to 4D Server. The example checks the .4DLink files in `Resources/Servers/` and automatically connects to a primary or failover server. The demo consists of two projects: the embedded standalone database (4DEmbeddedDB) and the client/server database (CS).

## Download

| | |
|---|---|
| PDF (Japanese) | [25-03_4DEmbeddedDB_ja.pdf](https://github.com/miyako/4DEmbeddedDB/releases/latest/download/25-03_4DEmbeddedDB_ja.pdf) |
| 4D demo (embedded database) | [4DEmbeddedDB.zip](https://github.com/miyako/4DEmbeddedDB/releases/latest/download/4DEmbeddedDB.zip) |
| 4D demo (client/server) | [CS.zip](https://github.com/miyako/4DEmbeddedDB/releases/latest/download/CS.zip) |
| Original (English) | `document/25-03_4DEmbeddedDB.pdf` |

## Demo

- 4D version: 4D 20 R6 or later.
- Open `demo/4DEmbeddedDB/Project/4DEmbeddedDB.4DProject` (the database to embed in the client) and `demo/CS/Project/CS.4DProject` (the client/server database).
- Languages: English and Japanese. The UI follows the system language; the XLIFF files are in `Resources/<lang>.lproj/`.
- The 4D Internet Commands plugin is not included. Add the version that matches your 4D to `Plugins/` of 4DEmbeddedDB and of the built client (see the PDF).
- When a project is opened in 4D, `Startup` shows an alert and then the description window (non-blocking, opened in the application process).

## Differences from the original

- Figure and step numbering is continuous (the original has no Image 5 and no Step 14, and uses Step 22 twice): Image 6–7 → 図5–6, Step 15–22 → 手順14–21, the second Step 22 → 手順22.
- Folder and project names match the demo: `Demo_EmbeddedDB` → `4DEmbeddedDB`, `Demo_CS` → `CS`, `Demo` → `demo`. The .4DLink templates are in `4DEmbeddedDB/Resources/Servers/`, and the folder to create is named `Servers`, as in the code.
- The text describing the CS `Startup` method matches the code (it checks `4D Remote mode`).
- The screenshots were replaced with ones from the Japanese 4D, and menu and option names follow the Japanese UI.
- Demo: all alerts and form texts are localised with XLIFF (en, ja), `server_database_name` in the .4DLink files is `CS`, the startup window uses the non-blocking `CALL WORKER` + `DIALOG(…; *)` pattern, and the CS description area is taller to fit the Japanese text.

## Editing and rebuilding

The PDF is generated from plain-text sources. Edit them and run `make`.

| File | What |
|---|---|
| `src/ja.md` | Translated body text. **Don't touch code blocks** (`make check` verifies them). |
| `figures/layout/fig-NN.json` | `"replace"` uses the Japanese screenshot `fig-NN-ja.png`; `"replace_width_pt"` sets its width |
| `glossary.md` | Terminology, and the list of corrections to the original and to the demo |

```sh
make            # check → figures → build/25-03_4DEmbeddedDB_ja.pdf
make check      # code blocks unchanged, figure references complete
make review     # contact sheets of the figures (build/contact-N.png)
make release-assets
```

Requirements: Python 3, Google Chrome, CJK fonts, and Tesseract (only needed for re-extraction).
See the [localisation template](https://github.com/miyako/4d-technote-localisation-template) for the full workflow.

## Credits

- Original: Tai Bui, Technical Services Engineer, 4D Inc. (Technical Note 25-03)
- Produced with [4d-technote-localisation-template](https://github.com/miyako/4d-technote-localisation-template) and GitHub Copilot.
