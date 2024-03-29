//
//  MokVacancy.swift
//  JobSearchApp
//
//  Created by Reek i on 21.03.2024.
//

import Foundation

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
