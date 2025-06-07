# macOS対応 TODO

## 概要
dotfilesリポジトリをmacOSに対応させる。プラットフォームごとに分岐して実行できるようにし、macOSで必要なアプリケーションのインストールや設定、defaultsの設定などを実施する。

## 現在の状況
- **ステータス**: 基本実装完了
- **最終更新**: 2025-01-07
- **次のアクション**: サービス管理の抽象化（優先度低）

## 実装方針

### 1. プラットフォーム検出機能の実装
- [x] `lib/platform.sh`を新規作成
  - [x] `uname -s`でDarwin/Linuxを判定
  - [x] PLATFORM変数の設定（linux/darwin）
  - [x] プラットフォーム固有のパスや定数を定義

### 2. パッケージ管理の抽象化
- [x] ~~`lib/package_manager.sh`を作成し、統一インターフェースを提供~~ → `lib/recipe_helpers.sh`で実装
  - [x] Linux: pacman/yay を使用
  - [x] macOS: Homebrew を使用
  - [x] `package()`関数を拡張してプラットフォームに応じた処理を実行
  - [x] `brew_cask()`関数を追加（macOSアプリ用）

### 3. プラットフォーム判定ヘルパーの実装
- [x] `lib/recipe_helpers.sh`に以下のヘルパー関数を追加：
```bash
platform_is() {
    [[ "$PLATFORM" == "$1" ]]
}
```

使用例：
```bash
if platform_is linux; then
    package hyprland
    package waybar
    dotfile config/hypr/hyprland.conf .config/hypr/hyprland.conf
fi

if platform_is darwin; then
    brew_cask rectangle
    brew_cask alfred
    defaults write com.apple.dock autohide -bool true
fi
```

### 4. 既存レシピの条件分岐追加
共通で使えるレシピに条件分岐を追加：
- [x] ~~000-base~~ → 数字付きレシピは使用していない
- [x] shell（共通）
- [x] vim（共通）
- [x] git（共通）
- [x] tmux（共通）
- [x] 開発言語環境（共通）
- [x] その他の共通レシピ

### 5. macOS固有機能の実装
- [x] Homebrewのインストールレシピ作成
- [x] macOS defaults設定レシピ作成
  - [x] Dock設定
  - [x] Finder設定
  - [x] トラックパッド設定
  - [x] キーボード設定
- [x] macOSアプリケーションレシピ作成
  - [x] 開発ツール（VSCode, iTerm2等）
  - [x] ユーティリティ（Rectangle, Alfred等）
  - [x] ブラウザ

### 6. Linux固有レシピの分離
以下のレシピをLinux専用として条件分岐：
- [x] Hyprland/Waylandコンポジター
- [x] yay（AURヘルパー）
- [x] update（pacman/yay）
- [x] dhclient/netctl
- [x] PulseAudio
- [x] udev rules（waylandレシピ内）
- [x] Linux固有のデスクトップアプリケーション

### 7. サービス管理の抽象化
- [ ] systemd（Linux）とlaunchd（macOS）の抽象化層を作成
- [ ] `service_enable()`、`service_start()`等のヘルパー関数

### 8. テストとドキュメント
- [ ] macOSでの動作テスト
- [x] README.mdにmacOS対応について追記
- [x] CLAUDE.mdにmacOS関連の情報を追加
- [ ] CI/CDでの両プラットフォームテスト検討

## 実装優先順位
1. プラットフォーム検出（lib/platform.sh）
2. プラットフォーム判定ヘルパー（platform_is）
3. パッケージ管理抽象化
4. 共通レシピへの条件分岐追加
5. macOS固有レシピの作成
6. Linux固有レシピの分離
7. テストとドキュメント整備

## 実装の具体的な手順

### フェーズ1: 基盤構築
1. `lib/platform.sh`を作成し、`lib/provision.sh`でsource
2. `platform_is()`を`lib/recipe_helpers.sh`に追加
3. 既存の`package()`関数を修正してプラットフォーム対応

### フェーズ2: 既存レシピの修正
1. まずは`000-base`レシピから着手
2. Linux固有のパッケージを`if platform_is linux`で囲む
3. 動作確認後、他のレシピも同様に修正

### フェーズ3: macOS対応
1. Homebrewインストールレシピを新規作成
2. macOS用の基本パッケージレシピを作成
3. defaults設定用レシピを作成

## 注意事項
- 既存のLinux環境を壊さないよう注意
- dry-runモードでの十分なテスト
- プラットフォーム間でのパスの違いに注意（例：設定ファイルの場所）