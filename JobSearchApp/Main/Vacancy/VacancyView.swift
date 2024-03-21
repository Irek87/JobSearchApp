//
//  VacancyView.swift
//  JobSearchApp
//
//  Created by Reek i on 19.03.2024.
//

import SwiftUI

struct VacancyView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var storage: Storage

    let vacancy: Vacancy
    private var heartIcon: Image { vacancy.isFavorite ? Image(.heartFill) : Image(.heart) }
    private var address: String { "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)" }

    var body: some View {
        ScrollView {
            getContent()
        }
        .scrollIndicators(.hidden)
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.leftArrow)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.jWhite)
                }
            }

            ToolbarItemGroup(placement: .topBarTrailing) {
                toolbarGroup
            }
        }
    }
}

private extension VacancyView {
    func getContent() -> some View {
        VStack(alignment: .leading) {
            topTexts
                .padding(.bottom, 29)

            viewsAndApplications
                .padding(.bottom, 19)

            companyInfo
                .padding(.bottom, 16)

            getCompanyDescription()
                .padding(.bottom, 16)

            Text("Ваши задачи")
                .jType(style: .title2, color: .jWhite)
                .padding(.bottom, 8)

            responsibilities
                .padding(.bottom, 32)

            Text("Задайте вопрос работодателю")
                .jType(style: .title4, color: .jWhite)
                .padding(.bottom, 8)

            Text("Он получит его с откликом на вакансию")
                .jType(style: .title4, color: .jGrey3)
                .padding(.bottom, 16)

            questions
                .padding(.bottom, 16)

            JButton(title: "Откликнуться", style: .greenBig) {}
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 26)
        .padding(.horizontal)
    }

    var toolbarGroup: some View {
        HStack(spacing: 16) {
            Button {

            } label: {
                Image(.eye)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.jWhite)
            }

            Button {

            } label: {
                Image(.share)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.jWhite)
            }

            Button {
                updateVacancy()
            } label: {
                heartIcon
            }
        }
    }

    var topTexts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(vacancy.title)
                .jType(style: .title1, color: .jWhite)
            Text(vacancy.salary.full)
                .jType(style: .text1, color: .jWhite)

            VStack(alignment: .leading, spacing: 16) {
                Text("Требуемый \(vacancy.experience.previewText.lowercased())")
                    .jType(style: .text1, color: .jWhite)
                Text(getSchedules())
                    .jType(style: .text1, color: .jWhite)
            }
        }
    }

    var viewsAndApplications: some View {
        HStack {
            if let appliedNumber = vacancy.appliedNumber {
                HStack(alignment: .top) {
                    Text("\(appliedNumber.people()) уже откликнулось")
                        .jType(style: .text1, color: .jWhite)
                    
                    Spacer()
                    
                    Image(.personGreen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .frame(maxWidth: 160)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.jDarkGreen)
                )
            }

            if let lookingNumber = vacancy.lookingNumber {
                HStack(alignment: .top) {
                    Text("\(lookingNumber.people()) сейчас смотрят")
                        .jType(style: .text1, color: .jWhite)

                    Spacer()
                    
                    Image(.eyeGreen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .frame(maxWidth: 160)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.jDarkGreen)
                )
            }
        }
    }

    var companyInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(vacancy.company)
                    .jType(style: .title3, color: .jWhite)

                Image(.checkMark)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color.jGrey3)
            }

            Image(.map)
                .resizable()
                .scaledToFit()

            Text(address)
                .jType(style: .text1, color: .jWhite)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
    }

    var responsibilities: some View {
        Text(vacancy.responsibilities)
            .jType(style: .text1, color: .jWhite)
    }

    var questions: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(vacancy.questions, id: \.self) { question in
                Text(question)
                    .jType(style: .title4, color: .jWhite)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.jGrey2)
                    )
            }
        }
    }

    @ViewBuilder
    func getCompanyDescription() -> some View {
        if let description = vacancy.description {
            Text(description)
                .jType(style: .text1, color: .jWhite)
        }
    }

    func updateVacancy() {
        if let index = storage.vacancies.firstIndex(of: vacancy) {
            storage.vacancies[index].isFavorite.toggle()
        }
    }

    func getSchedules() -> String {
        let resultString = vacancy.schedules.map { $0 }.joined(separator: ", ")
        return resultString.prefix(1).capitalized + resultString.dropFirst()
    }
}

#Preview {
    NavigationStack {
        VacancyView(vacancy: mokVacancy)
    }
}
