# SwiftUI Multi-Tab Coordinator

## English

An example of the modern data-driven navigation API introduced in **SwiftUI with iOS 16**. The project uses `NavigationStack`, `NavigationPath`, and `navigationDestination(for:)` instead of the legacy `NavigationView`.

It demonstrates how to build scalable Coordinator-based navigation for an application with multiple tabs. Each tab has its own navigation stack, routes, and history.

### Features

- independent navigation stacks for four tabs;
- type-safe routes based on `Hashable` enums;
- separate Coordinator and Router responsibilities;
- local and app-wide sheets and full-screen covers;
- deep links that select a tab and rebuild its stack;
- dependency injection through a composition root;
- navigation analytics, including system back gestures;
- UIKit screens embedded in SwiftUI navigation;
- independent navigation state for each iPad window.

### Architecture

```text
AppCoordinatorView
└── AppComposition
    ├── TabBarCoordinator
    │   └── NavigationCoordinator<Route> × 4
    ├── Feature Routers
    └── GlobalModalRouter
```

The Coordinator owns navigation state. The Router converts routes into SwiftUI or UIKit screens. `AppComposition` assembles the navigation graph separately for each scene, while `AppContainer` provides shared services.

### Run

Open `EnterpriseCoordinator.xcodeproj`, select the `EnterpriseCoordinator` scheme and run it in an iOS Simulator. No external dependencies are required.

### Deep links

```bash
xcrun simctl openurl booted "enterprise://profile/about"
xcrun simctl openurl booted "enterprise://profile/settings"
```

---

## Русский

Пример современного data-driven API навигации, появившегося в **SwiftUI начиная с iOS 16**. Вместо устаревшего `NavigationView` проект использует `NavigationStack`, `NavigationPath` и `navigationDestination(for:)`.

Проект показывает, как построить масштабируемую навигацию на базе Coordinator для приложения с несколькими табами. У каждого таба свой стек, маршруты и история переходов.

### Возможности

- независимые стеки навигации для четырёх табов;
- type-safe маршруты на базе `Hashable`-enum;
- разделение ответственности Coordinator и Router;
- локальные и глобальные sheet и full-screen cover;
- deep links с выбором таба и перестроением стека;
- dependency injection через composition root;
- аналитика навигации, включая системный back-swipe;
- UIKit-экраны внутри SwiftUI-навигации;
- независимое навигационное состояние каждого окна на iPad.

### Архитектура

```text
AppCoordinatorView
└── AppComposition
    ├── TabBarCoordinator
    │   └── NavigationCoordinator<Route> × 4
    ├── Feature Routers
    └── GlobalModalRouter
```

Coordinator хранит состояние навигации. Router превращает маршруты в SwiftUI- или UIKit-экраны. `AppComposition` отдельно собирает граф навигации для каждой сцены, а `AppContainer` предоставляет общие сервисы.

### Запуск

Откройте `EnterpriseCoordinator.xcodeproj`, выберите scheme `EnterpriseCoordinator` и запустите проект в iOS Simulator. Внешние зависимости не требуются.

### Deep links

```bash
xcrun simctl openurl booted "enterprise://profile/about"
xcrun simctl openurl booted "enterprise://profile/settings"
```
