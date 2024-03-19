//
//  VacancyView.swift
//  JobSearchApp
//
//  Created by Reek i on 19.03.2024.
//

import SwiftUI

struct VacancyView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: VacancyViewModel

    init(vacancy: Vacancy) {
        _viewModel = StateObject(wrappedValue: VacancyViewModel(vacancy: vacancy))
    }

    var body: some View {
        ScrollView {
            getContent()
        }
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
                viewModel.vacancy.isFavorite.toggle()
            } label: {
                viewModel.heartIcon
            }
        }
    }

    var topTexts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.vacancy.title)
                .jType(style: .title1, color: .jWhite)
            Text(viewModel.vacancy.salary.full)
                .jType(style: .text1, color: .jWhite)

            VStack(alignment: .leading, spacing: 16) {
                Text("Требуемый \(viewModel.vacancy.experience.previewText.lowercased())")
                    .jType(style: .text1, color: .jWhite)
                Text(viewModel.getSchedules())
                    .jType(style: .text1, color: .jWhite)
            }
        }
    }

    var viewsAndApplications: some View {
        HStack {
            if let appliedNumber = viewModel.vacancy.appliedNumber {
                HStack(alignment: .top) {
                    Text("\(appliedNumber) уже человек откликнулось")
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

            if let lookingNumber = viewModel.vacancy.lookingNumber {
                HStack(alignment: .top) {
                    Text("\(lookingNumber) человека сейчас смотрят")
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
                Text(viewModel.vacancy.company)
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

            Text(viewModel.address)
                .jType(style: .text1, color: .jWhite)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
    }

    @ViewBuilder
    func getCompanyDescription() -> some View {
        if let description = viewModel.vacancy.description {
            Text(description)
                .jType(style: .text1, color: .jWhite)
        }
    }

    var responsibilities: some View {
        Text(viewModel.vacancy.responsibilities)
            .jType(style: .text1, color: .jWhite)
    }

    var questions: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(viewModel.vacancy.questions, id: \.self) { question in
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
}

// TODO: remove mok
let mokVacancy = Vacancy(
    id: "e29dc698bb50",
    lookingNumber: 2,
    title: "UI/UX дизайнер",
    address: Address(
        town: "Минск",
        street: "лица Бирюзова",
        house: "4/5"
    ),
    company: "Мобирикс",
    experience: Experience(
        previewText: "Опыт от 1 до 3 леt",
        text: "1–3 годa"
    ),
    publishedDate: "2024-02-20",
    isFavorite: false,
    salary: Salary(
        short: nil,
        full: "Уровень дохода не указан"
    ),
    schedules: [
        "полная занятость",
        "полный день"
      ],
    appliedNumber: 147,
    description: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании",
    responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
    questions: [
        "Где располагается место работы?",
        "Какой график работы?",
        "Вакансия открыта?",
        "Какая оплата труда?"
      ]
)

#Preview {
    NavigationStack {
        VacancyView(vacancy: mokVacancy)
    }
}
