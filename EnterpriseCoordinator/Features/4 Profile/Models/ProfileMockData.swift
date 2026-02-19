//
//  ProfileMockData.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import Foundation

struct NewsItem: Identifiable, Hashable {
    let id: String
    let title: String
    let summary: String
    let date: Date
    let details: String
}

struct CodeItem: Identifiable, Hashable {
    let id: String
    let number: String
    let title: String
    let updatedAt: Date
    let document: String
}

enum ProfileMockData {
    static let news: [NewsItem] = [
        NewsItem(
            id: "news-001",
            title: "Обновление мобильного приложения",
            summary: "Новый профиль и улучшенная навигация по разделам.",
            date: Date(timeIntervalSince1970: 1_738_000_000),
            details: "В новой версии обновили вкладку профиля, улучшили скорость переходов между экранами и добавили больше информационных разделов."
        ),
        NewsItem(
            id: "news-002",
            title: "Новый раздел кодексов",
            summary: "Теперь нормативные документы доступны прямо в приложении.",
            date: Date(timeIntervalSince1970: 1_739_000_000),
            details: "Раздел кодексов содержит структурированный список документов. Документы открываются внутри приложения и доступны для чтения в любое время."
        ),
        NewsItem(
            id: "news-003",
            title: "Плановые технические работы",
            summary: "Кратковременные ограничения доступа в выходные.",
            date: Date(timeIntervalSince1970: 1_740_000_000),
            details: "В ближайшие выходные будут проводиться технические работы. Возможны краткие перерывы в работе отдельных сервисов."
        )
    ]

    static let codes: [CodeItem] = [
        CodeItem(
            id: "code-001",
            number: "КД-101",
            title: "Кодекс документооборота",
            updatedAt: Date(timeIntervalSince1970: 1_735_000_000),
            document: "Раздел 1. Общие положения\n\nДокумент определяет единые правила регистрации, хранения и согласования документов внутри организации.\n\nРаздел 2. Ответственность\n\nКаждый участник процесса обязан соблюдать сроки и регламент обработки."
        ),
        CodeItem(
            id: "code-002",
            number: "КД-205",
            title: "Кодекс внутренней коммуникации",
            updatedAt: Date(timeIntervalSince1970: 1_736_000_000),
            document: "Раздел 1. Каналы связи\n\nДля рабочих вопросов используются только утвержденные каналы и корпоративные сервисы.\n\nРаздел 2. Деловой стиль\n\nКоммуникация должна быть точной, уважительной и ориентированной на решение задачи."
        ),
        CodeItem(
            id: "code-003",
            number: "КД-309",
            title: "Кодекс информационной безопасности",
            updatedAt: Date(timeIntervalSince1970: 1_737_000_000),
            document: "Раздел 1. Доступы\n\nПрава доступа выдаются по принципу минимальной достаточности.\n\nРаздел 2. Работа с данными\n\nПередача конфиденциальной информации в незащищенных каналах запрещена."
        )
    ]
}
