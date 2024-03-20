//
//  VacancyPreview.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

struct VacancyPreview: View {
    @StateObject private var viewModel: VacancyPreviewModel

    init(vacancy: Vacancy, storage: Storage) {
        _viewModel = StateObject(wrappedValue: VacancyPreviewModel(vacancy: vacancy, storage: storage))
    }

    var body: some View {
        VStack {
//            NavigationLink {
//                VacancyView(vacancy: viewModel.vacancy)
//            } label: {
                HStack(alignment: .top) {
                    texts
                    Spacer()
                    heartButton
                }
//            }

            JButton(title: "Откликнуться", style: .greenSmall) {}
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
    }
}

private extension VacancyPreview {
    var texts: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let lookingNumber = viewModel.vacancy.lookingNumber {
                Text("Сейчас просматривает \(lookingNumber) человек")
                    .jType(style: .text1, color: .jGreen)
            }

            Text(viewModel.vacancy.title)
                .jType(style: .title3, color: .jWhite)

            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.vacancy.address.town)
                    .jType(style: .text1, color: .jWhite)

                HStack(spacing: 8) {
                    Text(viewModel.vacancy.company)
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

                Text(viewModel.vacancy.experience.previewText)
                    .jType(style: .text1, color: .jWhite)
            }

            Text("Опубликовано \(viewModel.getPublishedDate())")
                .jType(style: .text1, color: .jGrey3)
        }
    }

    var heartButton: some View {
        Button {
            viewModel.vacancy.isFavorite.toggle()
        } label: {
            viewModel.heartIcon
        }
    }
}

//#Preview {
//    VacancyView()
//}
