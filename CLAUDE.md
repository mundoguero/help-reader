# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build, run, test

This is an iOS app built with Xcode. The project file path contains a space and must be quoted:

- Open in Xcode: `open "help reader.xcodeproj"`
- Build (CLI): `xcodebuild -project "help reader.xcodeproj" -scheme "help reader" -destination 'platform=iOS Simulator,name=iPhone 15' build`
- Run all tests: `xcodebuild -project "help reader.xcodeproj" -scheme "help reader" -destination 'platform=iOS Simulator,name=iPhone 15' test`
- Run a single test: append `-only-testing:"help readerTests/help_readerTests/testPostDataBeginsWithContent"` to the `test` command.

Build settings: Swift 5.0, iOS deployment target 16.0 (app) / 17.0 (test target), universal device family (iPhone + iPad), bundle id `co.jonatas.help-reader`.

Dependencies are managed via Swift Package Manager inside the Xcode project. The only third-party package is `lottie-ios` (airbnb/lottie-ios).

## Current repo state to be aware of

`help reader/Views/MainViewModel.swift` contains unresolved git merge conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) and will not compile until resolved. The conflicting branch (`Stashed changes`) references an undeclared `requestHeaders` symbol; the `Updated upstream` side uses a local `headers` dictionary and is the version that actually compiled previously. Resolve before building.

## Architecture

SwiftUI app, MVVM. Entry point `help_readerApp.swift` launches `MainView`.

**Primary user flow (Acquire → bionic reading):**

1. `MainView` (Views/MainView.swift) — home screen with three tiles (Acquire, Personal Books, School Material) using Lottie animations. Gates the Acquire button on `DataScannerViewController.isSupported && .isAvailable`.
2. `CameraScanner` → `CameraScannerViewController` (Views/CameraScanner*.swift) — `UIViewControllerRepresentable` wrapping VisionKit's `DataScannerViewController` for OCR; recognized text is written back through a `@Binding`.
3. `ScanResultView` (Views/ScanResultView.swift) — shows recognized text, then on Convert calls `MainViewModel.makePOSTRequest()`.
4. `MainViewModel.makePOSTRequest` (Views/MainViewModel.swift) — POSTs the scanned text to the RapidAPI **bionic-reading1** endpoint (`https://bionic-reading1.p.rapidapi.com/convert`) with form params (`content`, `response_type=html`, `fixation`, `saccade`), then appends an inline `<style>` block to the returned HTML and publishes it as `webContent`. **Note:** the RapidAPI key is currently hard-coded in this file.
5. `ConvertedTextView` + `HTMLView` (Views/ConvertedText*.swift, Views/HTMLView.swift) — `HTMLView` is a `WKWebView` `UIViewRepresentable` that renders the returned HTML string. `ConvertedTextViewModel.render()` uses SwiftUI's `ImageRenderer` to produce a PDF under `URL.documentsDirectory/output.pdf` exposed via `ShareLink`.
6. `CongratsView` — terminal screen, dismisses back to `MainView`.

**Secondary flow (School Material):** `MainView` → `ModalView` sheet → category destinations (`EnglishView`, `HistoryView`, `ScienceView`, `AddMore`). Several of these category files live at the package root (`help reader/AddMore.swift`) rather than under `Views/`.

**State ownership note:** Several screens (`MainView`, `CameraScanner`, `ScanResultView`) each instantiate their own `@StateObject MainViewModel`. The shared piece passed between them is the `scanResult: String` `@Binding`, not the view model itself — when modifying flow state, prefer extending the binding contract over assuming the view models are the same instance.

## Localization

Strings are looked up via `Text(LocalizedStringKey("..."))`. Localizable tables live in three places:

- `help reader/en.lproj/Localizable.strings` (English, at the target root)
- `help reader/Localization/it.lproj/Localizable.strings` (Italian)
- `help reader/Localization/pt-BR.lproj/Localizable.strings` (Portuguese - Brazil)

When adding a new user-facing string, add the key to **all three** files. The English table currently doubles as the canonical key list.

## Assets

- Lottie JSON animations live in `help reader/Utilities/Animations/` and are loaded by name through `LottieView(animationName:)` in `Utilities/LottieAnimations.swift`. The string passed to `LottieView` must match a file in that directory (e.g. `acquire`, `applauso`, `personal-books`, `school-material-animabile`).
- The bundled font `SF-Pro-Rounded-Bold.otf` is referenced as `.font(.custom("SF Pro Rounded", size: …))` throughout the UI.
- Named colors (`Yellow`, `Blue`, `Green`, `BackgroundColor`, `FontColor`, `FontBlackWhite`, `Light Blu`, `Blu`, `Brown`) come from `Assets.xcassets` color sets.

## Tests

XCTest target `help readerTests` at `help readerTests/help_readerTests.swift`. Tests import the app module with `@testable import help_reader` and currently cover `MainViewModel.generatePostData()`. There is also an empty `HelpReaderTests/` directory at the repo root that is not part of the Xcode project — new tests should go under `help readerTests/`.
