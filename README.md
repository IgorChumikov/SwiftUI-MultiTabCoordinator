# SwiftUI Multi-Tab Coordinator

Демонстрационное iOS-приложение, построенное на **новом data-driven подходе к навигации SwiftUI, доступном с iOS 16**. Вместо устаревшего `NavigationView` проект использует `NavigationStack`, `NavigationPath` и `navigationDestination(for:)`, позволяя описывать навигацию как состояние.

Проект показывает, как применить этот API в масштабируемой Coordinator-архитектуре: разделить навигационное состояние, построение экранов и зависимости фич в приложении с несколькими табами.

Внутри — четыре раздела: **Главное**, **Избранное**, **История** и **Профиль**. У каждого таба свой `NavigationStack`, свой координатор и независимая история переходов.

## Что показывает проект

- современную навигацию SwiftUI из iOS 16+: `NavigationStack`, `NavigationPath` и `navigationDestination`;
- управление навигацией через данные и состояние, а не через прямое связывание экранов;
- независимые стеки навигации для каждого таба;
- type-safe маршруты на базе `Hashable`-enum;
- разделение `Coordinator` и `Router`: первый хранит состояние, второй собирает экраны;
- локальные модалки внутри таба и глобальные модалки уровня всего приложения;
- deep links с выбором нужного таба и перестроением его стека;
- dependency injection через composition root и узкие `*Dependencies`-протоколы;
- аналитика фактических навигационных событий, включая системный back-swipe;
- встраивание UIKit-экранов в SwiftUI-навигацию;
- независимое состояние каждого окна при multi-window на iPadOS.

## Архитектура

```text
EnterpriseCoordinatorApp
├── AppContainer                 # сервисы на время жизни процесса
└── AppCoordinatorView
    └── AppComposition           # граф одной сцены / окна
        ├── TabBarCoordinator     # выбранный таб и глобальные модалки
        │   ├── NavigationCoordinator<HomeRoute>
        │   ├── NavigationCoordinator<FavoritesRoute>
        │   ├── NavigationCoordinator<HistoryRoute>
        │   └── NavigationCoordinator<ProfileRoute>
        ├── HomeRouter
        ├── FavoritesRouter
        ├── HistoryRouter
        ├── ProfileRouter
        └── GlobalModalRouter
```

`NavigationCoordinator<RouteType>` — обобщённое хранилище `NavigationPath`, локальных sheet/cover и навигационных событий. Роутер каждой фичи превращает её route-enum в SwiftUI- или UIKit-экран и получает только нужные фиче зависимости.

`AppComposition` создаётся через `@StateObject` для каждой сцены. Поэтому два окна на iPad не зеркалят выбранный таб, стеки и модалки. При этом `AppContainer` с сервисами остаётся общим для процесса.

## Структура проекта

```text
EnterpriseCoordinator/
├── App/                     # точка входа
├── Features/                # экраны, ViewModel, Router и Route по фичам
├── Navigation/
│   ├── Coordinators/        # состояние и команды навигации
│   ├── DeepLink/            # парсинг URL
│   ├── Presentation/        # локальные и глобальные модалки
│   ├── Routing/             # базовые протоколы
│   └── TabBar/              # модель табов
└── Shared/
    ├── DI/                   # контейнер, composition root и stub-сервисы
    └── UIKit/                # адаптеры UIKit → SwiftUI
```

## Запуск

1. Клонируйте репозиторий.
2. Откройте `EnterpriseCoordinator.xcodeproj` в Xcode.
3. Выберите scheme `EnterpriseCoordinator` и iOS Simulator.
4. Запустите проект через **Run** (`⌘R`).

Внешние зависимости не требуются. Используемая модель навигации появилась в **iOS 16**, а текущая deployment target самого демо-проекта — **iOS 26.1**.

## Deep links

После запуска приложения в загруженном симуляторе deep links можно проверить из Terminal:

```bash
# Профиль → О приложении
xcrun simctl openurl booted "enterprise://profile/about"

# Короткая форма того же маршрута
xcrun simctl openurl booted "enterprise://about"

# Профиль → Настройки
xcrun simctl openurl booted "enterprise://profile/settings"
```

Обработчик выбирает таб `Profile`, сбрасывает его стек до корня и открывает целевой экран.

## Как добавить маршрут

На примере фичи `Home`:

1. Добавьте case в `HomeRoute`.
2. Опишите целевой экран в `HomeRouter.view(for:)`.
3. Вызовите `navigator.push(...)` из ViewModel или UIKit-модуля.
4. При необходимости задайте имя события для аналитики.

Экраны не должны знать о `NavigationPath` или создании следующего экрана — они только передают навигационное намерение.

## Стек

- Swift
- SwiftUI
- UIKit
- Combine
- `NavigationStack` / `NavigationPath`

## Статус

Проект учебный: сетевые и доменные сервисы заменены stub-реализациями. Основной акцент сделан на архитектуре навигации и границах ответственности между компонентами.
