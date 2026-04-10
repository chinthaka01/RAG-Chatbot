# RAG-Chatbot iOS App

An iOS application built with **SwiftUI** that integrates a **Retrieval-Augmented Generation (RAG) Chatbot** via a locally hosted web interface. The chatbot is embedded seamlessly into the native app using a floating action button and full-screen WebView overlay.

---

## 📱 Features

- **Floating Chat Button** — A persistent `message.circle.fill` button anchored to the bottom-trailing corner of the screen for quick chatbot access
- **Full-Screen Chatbot UI** — Opens the RAG Chatbot in a full-screen cover using a `WKWebView` embedded via `UIViewRepresentable`
- **Native Navigation** — Wrapped in a `NavigationStack` with an inline title and a "Close" toolbar button for smooth dismissal
- **RAG-Powered AI** — Connects to a locally running RAG Chatbot demo server for intelligent, context-aware responses

---

## 🏗️ Project Structure

```
RAG-Chatbot/
├── RAG-Chatbot/
│   ├── ContentView.swift       # Main view with floating chat button & sheet presentation
│   └── ChatbotWebView.swift    # WKWebView wrapper using UIViewRepresentable
├── RAG-ChatbotTests/           # Unit tests
├── RAG-ChatbotUITests/         # UI tests
└── RAG-Chatbot.xcodeproj       # Xcode project file
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI Framework | SwiftUI |
| Web Rendering | WebKit / WKWebView |
| AI Backend | RAG Chatbot (Gradio / local server) |
| Minimum Target | iOS 16+ |

---

## ⚙️ Prerequisites

### iOS App
- Xcode 15+
- iOS 16+ deployment target
- Swift 5.9+

### RAG Chatbot Backend
The chatbot backend must be running locally before launching the app. The app connects to:

```
http://127.0.0.1:7860
```

> **Note:** This is typically a [Gradio](https://gradio.app)-based RAG demo server. Make sure it is running before opening the chatbot in the app.

---

## 🚀 Getting Started

### 1. Start the RAG Chatbot Backend

Run your RAG chatbot server locally. If using a Python/Gradio-based implementation:

```bash
# Example — adjust based on your RAG implementation
pip install -r requirements.txt
python app.py
```

Confirm the server is accessible at `http://127.0.0.1:7860` in your browser before proceeding.

### 2. Configure App Transport Security (ATS)

Since the backend runs over `http` (not `https`), you must allow local network connections in `Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsLocalNetworking</key>
    <true/>
    <key>NSExceptionDomains</key>
    <dict>
        <key>localhost</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
        </dict>
    </dict>
</dict>
```

### 3. Build and Run the iOS App

```bash
# Open the project in Xcode
open RAG-Chatbot.xcodeproj
```

- Select your target simulator or physical device
- Press `⌘ + R` to build and run
- Tap the **blue chat bubble** button in the bottom-right corner to open the chatbot

---

## 🔑 Key Components

### `ContentView.swift`
The root view of the app. It renders a `ZStack` with the main app content and a floating action button. Tapping the button sets `isChatbotPresented = true`, triggering a `.fullScreenCover` that presents the chatbot.

### `ChatbotWebView.swift`
A `UIViewRepresentable` wrapper around `WKWebView`. On creation, it loads the RAG chatbot URL (`http://127.0.0.1:7860`) and renders the full Gradio web UI natively inside the iOS app.

---

## 👤 Author

**Chinthaka Perera** — Created April 2026//
//  README.md
//  RAG-Chatbot
//
//  Created by Chinthaka Perera on 4/10/26.
//

