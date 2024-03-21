//
//  VacancyPreview.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

struct VacancyPreview: View {
    @EnvironmentObject private var storage: Storage

    let vacancy: Vacancy
    let isLink: Bool
    private var heartIcon: Image { vacancy.isFavorite ? Image(.heartFill) : Image(.heart) }

    init(vacancy: Vacancy, isLink: Bool = false) {
        self.vacancy = vacancy
        self.isLink = isLink
    }

    var body: some View {
        VStack {
            getMainSection()

            JButton(title: "Откликнуться", style: .greenSmall) {}
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
    }

    @ViewBuilder
    func getMainSection() -> some View {
        if isLink {
            NavigationLink {
                VacancyView(vacancy: vacancy)
            } label: {
                HStack(alignment: .top) {
                    texts
                    Spacer()
                    heartButton
                }
            }
        } else {
            HStack(alignment: .top) {
                texts
                Spacer()
                heartButton
            }
        }
    }
}

private extension VacancyPreview {
    var texts: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let lookingNumber = vacancy.lookingNumber {
                Text("Сейчас просматривает \(lookingNumber) человек")
                    .jType(style: .text1, color: .jGreen)
            }

            Text(vacancy.title)
                .jType(style: .title3, color: .jWhite)

            VStack(alignment: .leading, spacing: 4) {
                Text(vacancy.address.town)
                    .jType(style: .text1, color: .jWhite)

                HStack(spacing: 8) {
                    Text(vacancy.company)
                        .jType(style: .text1, color: .jGreen)

                    Image(.checkMark)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.jGrey3)
                }
            }

            HStack(spacing: 8) {
                Image(.briefcase)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color.jWhite)

                Text(vacancy.experience.previewText)
                    .jType(style: .text1, color: .jWhite)
            }

            Text("Опубликовано \(getPublishedDate())")
                .jType(style: .text1, color: .jGrey3)
        }
    }

    var heartButton: some View {
        Button {
            updateVacancy()
        } label: {
            heartIcon
        }
    }

    private func updateVacancy() {
        if let index = storage.vacancies.firstIndex(of: vacancy) {
            storage.vacancies[index].isFavorite.toggle()
        }
    }

    private func getPublishedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: vacancy.publishedDate) {
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "dd MMMM"
            let frenchDate = dateFormatter.string(from: date)
            return frenchDate
        } else {
            return "дата неизвестна"
        }
    }
}

#Preview {
    VacancyPreview(vacancy: mokVacancy)
}
