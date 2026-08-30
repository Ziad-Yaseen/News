<div align="center">

# 📰 News Cloud

**A clean, category-based news reader built with Flutter**

Live headlines from around the world, organized by category, wrapped in a fast and minimal UI.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%5E3.12.2-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![NewsAPI](https://img.shields.io/badge/API-NewsAPI.org-orange)](https://newsapi.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](#-license)

</div>

---

## 📖 Overview

**News Cloud** is a simple, single-purpose Flutter application that lets users browse the latest news headlines by category — Business, Entertainment, General, Health, Science, Sports, and Technology. It's built as a clean example of a feature-first Flutter architecture: a typed data layer, a dedicated networking service, declarative routing, and stateful UI that gracefully handles loading, success, and error states.

The app talks to the [NewsAPI.org](https://newsapi.org) `top-headlines` endpoint through [Dio](https://pub.dev/packages/dio), parses the response into strongly-typed models, and renders it with [go_router](https://pub.dev/packages/go_router) handling navigation between the home feed and category-specific views.

---

## 📱 Screenshots

<!--
  Drop your screenshots into a folder named `screenshots/` at the repo root
  (e.g. screenshots/home.png, screenshots/category.png, screenshots/error.png)
  then update the paths below. Table layout keeps them aligned side by side.
-->

<div align="center">

| Home Feed | Category View Business | Category View Entertainment | Category View Sports | Category View Technology | 
|:---:|:---:|:---:|
| <img src="screenshots/home.png" width="230"/> | <img src="screenshots/business.png" width="230"/> | <img src="screenshots/entertainment.png" width="230"/> | <img src="screenshots/sports.png" width="230"/> | <img src="screenshots/technology.png" width="230"/> |

</div>

---

## ✨ Features

- 🗂️ **Category browsing** — Business, Entertainment, General, Health, Science, Sports, and Technology, each with its own cover image.
- 📰 **Live headlines** — Fetches real-time top headlines per category from NewsAPI.org.
- 🖼️ **Resilient images** — Article thumbnails fall back to a placeholder image automatically if the source URL is broken or missing.
- ⚡ **Smooth navigation** — Fade-transition page routes powered by `go_router`, with typed route names instead of magic strings.
- 🧠 **Graceful state handling** — Distinct UI for loading, populated, and error states (with separate messaging for network errors vs. generic failures).
- 🔁 **Retry on failure** — A one-tap "Try Again" action re-fires the request without restarting the app.
- 🛡️ **Null-safe parsing** — Every model field falls back to a sensible default if the API response is missing data, so a partial payload never crashes the UI.
- 🔑 **Secrets kept out of git** — The NewsAPI key lives in a local, git-ignored file, never committed to the repo.

---

## 🧱 Tech Stack

| Layer | Choice |
|---|---|
| Framework | Flutter (Dart SDK `^3.12.2`) |
| Networking | [`dio`](https://pub.dev/packages/dio) `^5.11.0` |
| Routing | [`go_router`](https://pub.dev/packages/go_router) `^18.0.0` |
| Icons | `cupertino_icons` `^1.0.8` |
| Linting | `flutter_lints` `^6.0.0` |
| Data Source | [NewsAPI.org](https://newsapi.org) — `top-headlines` endpoint |

---

## 🏗️ Architecture

The project follows a **feature-first** structure: shared, cross-cutting code lives in `core/`, while each screen/flow lives in its own folder under `features/`.

```
lib/
├── main.dart                          # App entry point
├── app.dart                           # Root widget, MaterialApp.router setup
│
├── core/                              # Shared, cross-feature code
│   ├── constants/
│   │   └── app_assets.dart            # Centralized asset path constants
│   ├── models/
│   │   ├── article_model.dart         # Article DTO (parsed from NewsAPI JSON)
│   │   ├── category_model.dart        # Category UI model (name, image, id)
│   │   └── source_model.dart          # Article source DTO (id, name)
│   ├── routing/
│   │   ├── app_routes.dart            # GoRouter configuration & page transitions
│   │   └── route_names.dart           # Centralized route name constants
│   └── services/
│       └── news_service.dart          # Dio-based NewsAPI client
│
└── features/
    ├── home/
    │   ├── screens/
    │   │   └── home.dart              # Home screen (categories + headlines feed)
    │   └── widgets/
    │       ├── app_bar_title.dart     # "News Cloud" rich-text app bar title
    │       ├── categories_list_view.dart  # Horizontal scrollable category chips
    │       ├── category_card.dart     # Single tappable category card
    │       ├── news_list_view.dart    # Sliver list rendering article tiles
    │       ├── news_list_view_builder.dart # FutureBuilder: loading/data/error states
    │       └── news_tile.dart         # Single article card (image, title, description)
    │
    └── category/
        └── screens/
            └── category_view.dart     # Headlines filtered by a chosen category
```

**Data flow, end to end:**

1. `NewsListViewBuilder` (a `StatefulWidget`) kicks off a `NewsService().getTopHeadlines(category: ...)` call in `initState`.
2. `NewsService` fires a GET request via `Dio` to `https://newsapi.org/v2/top-headlines`, passing the API key and category as query parameters.
3. The raw JSON array is mapped into a `List<ArticleModel>`, with `ArticleModel.fromJson` (and the nested `SourceModel.fromJson`) defensively defaulting any missing field.
4. A `FutureBuilder` renders one of three states: a spinner while loading, a `NewsListView` (a `SliverList`) once data arrives, or a dedicated error view (with a distinct message for connectivity issues) that offers a retry button.
5. Tapping a category card on the home screen navigates to `CategoryView` via `go_router`, passing the category id/title through route `extra`, which mounts a second `NewsListViewBuilder` scoped to that category.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (compatible with Dart `^3.12.2`)
- A free API key from [newsapi.org](https://newsapi.org/register)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ziad-Yaseen/News.git
   cd News
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your NewsAPI key**

   The app expects a git-ignored file at `lib/core/constants/api_key.dart`. Create it with the following content:
   ```dart
   class ApiKey {
     static const String apiKey = 'YOUR_NEWSAPI_KEY_HERE';
   }
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

> ⚠️ **Note:** NewsAPI's free developer tier only allows requests from `localhost` and blocks calls from mobile/production IPs after a short trial. For real-device testing beyond that window, you may need a paid plan or a small backend proxy in front of the API.

---

## 🗺️ Roadmap

- [ ] Article detail screen with full content / in-app browser
- [ ] Search functionality
- [ ] Pull-to-refresh on the headlines list
- [ ] Pagination / infinite scroll
- [ ] Bookmarks / saved articles (local persistence)
- [ ] Dark mode support
- [ ] State management layer (Bloc/Cubit or Riverpod) as the app grows
- [ ] Unit & widget test coverage for services and models

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome. Feel free to check the [issues page](https://github.com/Ziad-Yaseen/News/issues) or open a pull request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is available under the MIT License. See the `LICENSE` file for more details.

---

## 👤 Author

**Ziad Yaseen**

- GitHub: [@Ziad-Yaseen](https://github.com/Ziad-Yaseen)

<div align="center">

Made with 💙 and Flutter

</div>