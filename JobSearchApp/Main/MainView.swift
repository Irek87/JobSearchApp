//
//  MainView.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                topBlock
                vacancies
            }
        }
        .task {
            await viewModel.getVacancies()
        }
        .preferredColorScheme(.dark)
    }
}

private extension MainView {
    var topBlock: some View {
        VStack(spacing: 33) {
            header
            RecommendationsView()
        }
    }

    var header: some View {
        HStack(spacing: 7) {
            searchBar
            filterButton
        }
        .padding()
    }

    var searchBar: some View {
        HStack(spacing: 8) {
            Image(.magnifyingGlass)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.jGrey4)
            TextField(text: $viewModel.searchText) {
                Text("Должность, ключевые слова")
                    .jType(style: .text1, color: .jGrey4)
            }
            .jType(style: .text1, color: .jWhite)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
        }
        .padding(8)
        .frame(height: 40)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey2)
                .shadow(color: .shadows, radius: 10, y: 10)
        }
    }

    var filterButton: some View {
        Button {} label: {
            Image(.filter)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.jWhite)
        }
        .frame(width: 40, height: 40)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.jGrey2)
        )
    }

    var recommendations: some View {
        HStack(spacing: 8) {
            Text("Placeholder")
            Text("Placeholder")
            Text("Placeholder")
        }
    }

    var vacancies: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Вакансии для вас")
                .jType(style: .title2, color: .jWhite)

            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<3) { index in
                        if index < viewModel.vacancies.count {
                            VacancyView(vacancy: viewModel.vacancies[index])
                        }
                    }
                }

                JButton(title: "Ещё \(viewModel.vacancies.count) вакансий", style: .blueBig) {}
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    MainView()
}
