//
//  RecommendationsView.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

struct RecommendationsView: View {
    let recommendations: [Recommendation] = [
        Recommendation(icon: Image(.location), title: "Вакансии рядом с вами"),
        Recommendation(icon: Image(.star), title: "Поднять резюме в поиске", subtitle: "Поднять"),
        Recommendation(icon: Image(.list), title: "Временная работа и подработка")
    ]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(recommendations) { recommendation in
                    getRecommendationView(for: recommendation)
                }
            }
            .padding(.horizontal, 9)
        }
        .scrollIndicators(.hidden)
    }
}

private extension RecommendationsView {
    func getRecommendationView(for recommendation: Recommendation) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            recommendation.icon
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            getTitleSegment(with: recommendation.title, and: recommendation.subtitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 10)
        .padding(.leading, 8)
        .frame(width: 132, height: 120)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
    }

    func getTitleSegment(with title: String, and subtitle: String?) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .jType(style: .title4, color: .jWhite)
            if let subtitle {
                Text(subtitle)
                    .jType(style: .text1, color: .jGreen)
            }
        }
    }
}

struct Recommendation: Identifiable {
    let id: UUID
    let icon: Image
    let title: String
    let subtitle: String?

    init(
        icon: Image,
        title: String,
        subtitle: String? = nil
    ) {
        self.id = .init()
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
}

#Preview {
    RecommendationsView()
}
