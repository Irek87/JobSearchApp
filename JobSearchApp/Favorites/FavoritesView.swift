//
//  FavoritesView.swift
//  JobSearchApp
//
//  Created by Reek i on 19.03.2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var storage: Storage

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                title
                vacanciesBlock
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 32)
            .padding(.horizontal)
        }
        .preferredColorScheme(.dark)
    }
}

private extension FavoritesView {
    var title: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Избранное")
                .jType(style: .title2, color: .jWhite)

            Text("\(storage.vacancies.filter{$0.isFavorite}.count) вакансий")
                .jType(style: .text1, color: .jGrey3)
        }
    }

    var vacanciesBlock: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(storage.vacancies, id: \.id) { vacancy in
                if vacancy.isFavorite {
                    VacancyPreview(vacancy: vacancy, storage: storage)
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(Storage())
}
