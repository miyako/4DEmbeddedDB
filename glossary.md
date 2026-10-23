# 用語集 / Glossary

Keep terminology consistent across `src/<target>.md` and `figures/*.<target>.txt`.
Change an entry here first, then search and replace in both places.

Style (ja): です・ます調. Half-width alphanumerics, no space between Japanese and Latin text (e.g. `4D.Vector型`).
Full-width `（）` and `：` in prose. First occurrence of a technical term: 日本語（English）.

## 4D terms (from the official 4D Japanese documentation)

| English | 日本語 | Notes |
|---|---|---|
| entity / entity selection | エンティティ / エンティティセレクション | |
| datastore | データストア | |
| dataclass | データクラス | |
| attribute | 属性 | |
| computed attribute | 計算属性 | |
| collection | コレクション | |
| object | オブジェクト | |
| method | メソッド | |
| project method | プロジェクトメソッド | |
| function | 関数 | |
| class | クラス | |
| parameter | 引数 | |
| form | フォーム | |
| form object | フォームオブジェクト | |
| list box | リストボックス | |
| web area | Webエリア | |
| 4D Web Server | 4D Webサーバー | |
| worker | ワーカー | |
| process | プロセス | |
| query | クエリ | |
| formula | フォーミュラ | |
| component | コンポーネント | |

## Document-specific terms

| English | 日本語 | Notes |
|---|---|---|
| Technical Note | テクニカルノート | |
| built / merged application | ビルドしたアプリケーション / 組み込みアプリケーション | 公式ドキュメントの「組み込みアプリケーション」 |
| Build Application (menu item) | アプリケーションビルド... | 「デザイン」メニュー |
| Build Wizard / build window | アプリケーションビルドダイアログ / アプリケーションビルドウィンドウ | |
| Build XML file | ビルド設定ファイル（XML） | buildApp.4DSettings |
| Destination Folder | 保存先フォルダー | |
| Compiled structure (tab) / Build compiled structure | 「コンパイル版」タブ / コンパイルされたストラクチャーをビルド | 画面表示に合わせる（公式ドキュメントは「コンパイル済みストラクチャー」） |
| Client/Server (tab) | 「クライアント/サーバー」タブ | |
| Build server application / Build client application | サーバーアプリケーションをビルド / クライアントアプリケーションをビルド | |
| 4D Server location / 4D Volume Desktop location | 4D Serverの場所 / 4D Volume Desktopの場所 | |
| Data linking mode based upon / Application path | データリンクモードの基準 / アプリケーションパス | |
| Save settings / Build (buttons) | 設定保存 / ビルド | |
| User Settings... / User Settings for Data file... | ユーザー設定... / データファイル用のユーザー設定... | 4D Server：「ファイル」（macOS）／「編集」（Windows）＞「設定」 |
| Client-server (settings page) / Network options (tab) | 「C/S」ページ / 「ネットワークオプション」タブ | 画面表示に合わせる |
| Port Number | ポート番号 | |
| On Startup Database method | On Startupデータベースメソッド | |
| structure / compiled structure | ストラクチャー / コンパイル済みストラクチャー | |
| interpreted mode / compiled mode | インタープリターモード / コンパイルモード | |
| standalone (database, mode) | スタンドアロン（データベース、モード） | |
| single-user | シングルユーザー | |
| embedded database | 埋め込みデータベース | 「Embedded Database Feature」＝データベース埋め込み機能 |
| 4D Remote Client | 4Dリモートクライアント | 初出：4Dリモートクライアント（4D Remote Client）。要確認 |
| remote client | リモートクライアント | |
| client-server | クライアント/サーバー | 設定ページ名は「C/S」 |
| deployment | 運用（形態）/ 展開 | 「4D Deployment Options」＝4Dの運用形態 |
| primary server / failover server | プライマリサーバー / フェイルオーバーサーバー | |
| automatic failover | 自動フェイルオーバー | |
| proof of concept | 概念実証 | 初出に（proof of concept） |
| data file | データファイル | |
| 4D access file (.4dlink) | 4Dアクセスファイル（.4DLink） | 一般名は「.4DLinkファイル」、実ファイル名は demo に合わせ「1.4Dlink」 |
| directory | フォルダー | |
| show package contents | パッケージの内容を表示 | macOS |

## Proper nouns in examples

| English | 日本語 | Notes |
|---|---|---|
| Demo_EmbeddedDB | 4DEmbeddedDB | デモの実フォルダー名に合わせる |
| Demo_CS | CS | デモの実フォルダー名に合わせる |
| Demo (folder) | demo | |
| \Demo\templates\ | 4DEmbeddedDB/Resources/Servers/ | テンプレートの実際の場所 |
| “Server” directory (Step 19) | 「Servers」フォルダー | findServer のコードに合わせる |
| Tai Bui | Tai Bui | 著者名は英字のまま |
| 4D Internet Commands | 4D Internet Commands | プラグイン名は英字のまま |

## Corrections to the original (applied in ja only)

- Image 6, 7 → 図5, 6 (there is no Image 5); Step 15–22 → 手順14–21, the second Step 22 → 手順22.
- CS `Startup` checks `4D Remote mode`, not `4D Volume desktop` (the text now matches the code).

## Demo UI strings (demo/*/Resources/*.lproj)

| English | 日本語 | Notes |
|---|---|---|
| Portal (window title) | ポータル | `DemoPortal_WindowTitle` |
| Design Mode (button) | デザインモード | `DemoPortal_BtnDesign` |
| Demo Structure for Embedded Database | 埋め込みデータベースのデモストラクチャー | |
| Demo Structure for Client Server Database | クライアント/サーバーデータベースのデモストラクチャー | |
| Design > Build Application... | 「デザイン」＞「アプリケーションビルド...」 | |

## Changes to the demo projects

- `server_database_name` in `Resources/Servers/1.4Dlink`, `2.4Dlink` and the default link in `findServer`: `Demo_CS` → `CS`.
- `Startup` (4DEmbeddedDB) compares the structure name with `4DEmbeddedDB@` instead of `Demo_EmbeddedDB@`.
- All alerts and form texts are in XLIFF (`en`, `ja`); the English texts use the actual names (4DEmbeddedDB, CS).
- `Demo_Window` uses the non-blocking startup pattern (`CALL WORKER` + `DIALOG(…; *)`), replacing `New process` + `CLOSE WINDOW`.
- CS `DemoPortal`: the text area is 60 px taller to fit the Japanese text.
