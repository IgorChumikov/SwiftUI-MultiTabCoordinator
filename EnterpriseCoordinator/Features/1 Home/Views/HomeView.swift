//
//  HomeView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator: NavigationCoordinator<HomeRoute>

    private let backgroundColor = Color(red: 240 / 255, green: 240 / 255, blue: 242 / 255)
    private let headerColor = Color(red: 238 / 255, green: 235 / 255, blue: 244 / 255)
    private let accentColor = Color(red: 128 / 255, green: 108 / 255, blue: 187 / 255)

    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()

            VStack(spacing: 0) {
                header

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        newsSection
                        documentsSection(kind: .codes, items: HomeMockData.codesPreview)
                        documentsSection(kind: .reference, items: HomeMockData.referencePreview)
                        documentsSection(kind: .reviews, items: HomeMockData.reviewsPreview)
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 28)
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .tint(accentColor)
    }

    private var header: some View {
        VStack(spacing: 22) {
            HStack(alignment: .center, spacing: 14) {
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.orange, lineWidth: 2)
                            )
                            .frame(width: 24, height: 24)

                        Image(systemName: "graduationcap.fill")
                            .font(.system(size: 21, weight: .bold))
                            .foregroundStyle(Color.black.opacity(0.85))
                    }

                    Text("КонсультантПлюс")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.orange)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer(minLength: 8)

                Button(action: {}) {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 27, weight: .medium))
                        .foregroundStyle(accentColor.opacity(0.75))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 30)
            .padding(.top, 18)

            HStack(spacing: 14) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.gray.opacity(0.85))

                Text("Поиск по документам")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.gray.opacity(0.9))

                Spacer(minLength: 0)
            }
            .padding(.horizontal, 30)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color.white.opacity(0.58))
                    .overlay(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .stroke(Color.black.opacity(0.06), lineWidth: 1)
                    )
            )
            .padding(.horizontal, 30)
            .padding(.bottom, 18)
        }
        .background(headerColor)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: 24,
                bottomTrailingRadius: 24,
                topTrailingRadius: 0,
                style: .continuous
            )
        )
    }

    private var newsSection: some View {
        VStack(spacing: 0) {
            sectionHeader(kind: .news)

            ForEach(Array(HomeMockData.newsPreview.enumerated()), id: \.element.id) { index, item in
                Button {
                    coordinator.push(.newsList)
                } label: {
                    VStack(alignment: .leading, spacing: 12) {
                        if let eyebrow = item.eyebrow {
                            Text(eyebrow)
                                .font(.system(size: 20, weight: .regular))
                                .foregroundStyle(Color.gray)
                        }

                        if let badge = item.badge {
                            Text(badge)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(Color.black.opacity(0.9))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                                        .fill(Color(red: 245 / 255, green: 217 / 255, blue: 161 / 255))
                                )
                        }

                        Text(item.title)
                            .font(.system(size: 21, weight: .regular))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 34)
                    .padding(.vertical, 26)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                if index < HomeMockData.newsPreview.count - 1 {
                    divider
                        .padding(.horizontal, 34)
                }
            }
        }
        .cardStyle()
    }

    private func documentsSection(kind: HomeSectionKind, items: [HomeDocumentPreviewItem]) -> some View {
        VStack(spacing: 0) {
            sectionHeader(kind: kind)

            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                Button {
                    openSection(kind)
                } label: {
                    Text(item.title)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 34)
                        .padding(.vertical, 26)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                if index < items.count - 1 {
                    divider
                        .padding(.horizontal, 34)
                }
            }
        }
        .cardStyle()
    }

    private func sectionHeader(kind: HomeSectionKind) -> some View {
        HStack(spacing: 14) {
            Button {
                openSection(kind)
            } label: {
                HStack(spacing: 14) {
                    Image(systemName: kind.iconName)
                        .font(.system(size: 26, weight: .medium))
                        .foregroundStyle(accentColor)

                    Text(kind.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.black)
                }
            }
            .buttonStyle(.plain)

            Spacer()

            Button(kind.actionTitle) {
                openSection(kind)
            }
            .font(.system(size: 17, weight: .medium))
            .foregroundStyle(Color(red: 46 / 255, green: 42 / 255, blue: 207 / 255))
        }
        .padding(.horizontal, 34)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }

    private var divider: some View {
        Rectangle()
            .fill(Color.black.opacity(0.11))
            .frame(height: 1)
    }

    private func openSection(_ kind: HomeSectionKind) {
        switch kind {
        case .news:
            coordinator.push(.newsList)
        case .codes:
            coordinator.push(.codesList)
        case .reference:
            coordinator.push(.referenceList)
        case .reviews:
            coordinator.push(.reviewsList)
        }
    }
}

private extension View {
    func cardStyle() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(Color(red: 248 / 255, green: 248 / 255, blue: 249 / 255))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(Color.black.opacity(0.03), lineWidth: 1)
            )
    }
}

#Preview {
    NavigationStack {
        HomeView(coordinator: NavigationCoordinator<HomeRoute>())
    }
}
