//
//  HomeMockData.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import Foundation

enum HomeSectionKind: String, CaseIterable, Hashable {
    case news
    case codes
    case reference
    case reviews

    var title: String {
        switch self {
        case .news:
            return "Новости"
        case .codes:
            return "Кодексы"
        case .reference:
            return "Справочная информация"
        case .reviews:
            return "Обзоры"
        }
    }

    var actionTitle: String {
        switch self {
        case .reference:
            return "ВСЯ"
        default:
            return "ВСЕ"
        }
    }

    var iconName: String {
        switch self {
        case .news:
            return "megaphone"
        case .codes:
            return "building.columns"
        case .reference:
            return "questionmark.circle"
        case .reviews:
            return "doc.on.doc"
        }
    }
}

struct HomeNewsPreviewItem: Identifiable, Hashable {
    let id: String
    let eyebrow: String?
    let badge: String?
    let title: String
}

struct HomeDocumentPreviewItem: Identifiable, Hashable {
    let id: String
    let title: String
}

struct HomeNewsArticle: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let dateText: String
    let body: String
    let relatedIDs: [String]
}

struct HomeDocumentItem: Identifiable, Hashable {
    let id: String
    let title: String
    let content: String
    let relatedIDs: [String]
}

enum HomeMockData {
    static let newsPreview: [HomeNewsPreviewItem] = [
        HomeNewsPreviewItem(
            id: "news-001",
            eyebrow: "Сегодня",
            badge: nil,
            title: "Увеличение цены иска после повышения госпошлин: ВС РФ напомнил судам, как рассчитать платеж"
        ),
        HomeNewsPreviewItem(
            id: "news-002",
            eyebrow: nil,
            badge: "Не пропустите",
            title: "Самые важные новости для юриста за февраль"
        ),
        HomeNewsPreviewItem(
            id: "news-003",
            eyebrow: "Сегодня",
            badge: nil,
            title: "Декларация по налогу на прибыль за 2025 год: важные изменения для бухгалтера"
        )
    ]

    static let newsArticles: [HomeNewsArticle] = [
        HomeNewsArticle(
            id: "news-001",
            title: "Увеличение цены иска после повышения госпошлин",
            subtitle: "ВС РФ напомнил судам, как рассчитать платеж",
            dateText: "3 марта 2026",
            body: "Суды продолжают уточнять порядок расчета госпошлины при изменении цены иска. В материале собраны ключевые выводы и примеры применения на практике.",
            relatedIDs: ["news-002"]
        ),
        HomeNewsArticle(
            id: "news-002",
            title: "Самые важные новости для юриста за февраль",
            subtitle: "Подборка документов и обзоров, на которые стоит обратить внимание",
            dateText: "1 марта 2026",
            body: "В итоговую подборку вошли изменения по судебной практике, обзоры ведомств и несколько заметных законопроектов. Материал можно использовать как короткий ежемесячный дайджест.",
            relatedIDs: ["news-003"]
        ),
        HomeNewsArticle(
            id: "news-003",
            title: "Декларация по налогу на прибыль за 2025 год",
            subtitle: "Что важно проверить бухгалтеру до сдачи отчетности",
            dateText: "28 февраля 2026",
            body: "Изменения коснулись состава приложений, порядка отражения отдельных расходов и контрольных соотношений. Ниже приведены ссылки на связанные материалы и документы.",
            relatedIDs: ["news-004"]
        ),
        HomeNewsArticle(
            id: "news-004",
            title: "Новые правила работы с электронными документами",
            subtitle: "Краткий обзор изменений для компаний",
            dateText: "25 февраля 2026",
            body: "Подготовили обзор нововведений по обмену документами и хранению электронных архивов. Материал полезен для юристов и бухгалтеров, сопровождающих договорную работу.",
            relatedIDs: []
        )
    ]

    static let codes: [HomeDocumentItem] = [
        HomeDocumentItem(id: "code-001", title: "Налоговый кодекс (часть 1)", content: "Статический текст документа для демонстрации UIKit-навигации по кодексам.", relatedIDs: ["code-002"]),
        HomeDocumentItem(id: "code-002", title: "Налоговый кодекс (часть 2)", content: "Продолжение документа. Следующий документ открывается обычным push внутри UIKit.", relatedIDs: ["code-003"]),
        HomeDocumentItem(id: "code-003", title: "Гражданский кодекс (часть 1)", content: "Пример карточки документа с вложенностью не менее трех уровней.", relatedIDs: ["code-004"]),
        HomeDocumentItem(id: "code-004", title: "Гражданский кодекс (часть 2)", content: "Следующий уровень документа.", relatedIDs: ["code-005"]),
        HomeDocumentItem(id: "code-005", title: "Гражданский кодекс (часть 3)", content: "Еще один статический документ.", relatedIDs: ["code-006"]),
        HomeDocumentItem(id: "code-006", title: "Гражданский кодекс (часть 4)", content: "Завершающий пример документа.", relatedIDs: []),
        HomeDocumentItem(id: "code-007", title: "Трудовой кодекс", content: "Статический контент раздела.", relatedIDs: []),
        HomeDocumentItem(id: "code-008", title: "Кодекс об административных правонарушениях", content: "Статический контент раздела.", relatedIDs: [])
    ]

    static let reference: [HomeDocumentItem] = [
        HomeDocumentItem(id: "reference-001", title: "Производственный календарь", content: "Справочный материал с демонстрационным наполнением.", relatedIDs: ["reference-002"]),
        HomeDocumentItem(id: "reference-002", title: "Календарь бухгалтера", content: "Следующий документ в справочном разделе.", relatedIDs: ["reference-003"]),
        HomeDocumentItem(id: "reference-003", title: "Ключевая ставка и ставка рефинансирования", content: "Третий уровень вложенности в справочном разделе.", relatedIDs: [])
    ]

    static let reviews: [HomeDocumentItem] = [
        HomeDocumentItem(id: "review-001", title: "Новое в законодательстве", content: "Краткий обзор изменений законодательства.", relatedIDs: ["review-002"]),
        HomeDocumentItem(id: "review-002", title: "Перечень документов, измененных за неделю в системе КонсультантПлюс", content: "Следующий обзор по связанной теме.", relatedIDs: ["review-003"]),
        HomeDocumentItem(id: "review-003", title: "Обзор судебной практики за месяц", content: "Третий уровень навигации для обзоров.", relatedIDs: [])
    ]

    static let codesPreview = Array(codes.prefix(8)).map { HomeDocumentPreviewItem(id: $0.id, title: $0.title) }
    static let referencePreview = reference.map { HomeDocumentPreviewItem(id: $0.id, title: $0.title) }
    static let reviewsPreview = Array(reviews.prefix(2)).map { HomeDocumentPreviewItem(id: $0.id, title: $0.title) }

    static func documents(for section: HomeSectionKind) -> [HomeDocumentItem] {
        switch section {
        case .news:
            return []
        case .codes:
            return codes
        case .reference:
            return reference
        case .reviews:
            return reviews
        }
    }
}
