//
//  VacancyPreviewModel.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

final class VacancyPreviewModel: ObservableObject {
    @Published var vacancy: Vacancy {
        didSet {
            if let index = storage.vacancies.firstIndex(where: { $0.id == vacancy.id }) {
                storage.vacancies[index] = vacancy
            }
        }
    }
    
    let storage: Storage
    var heartIcon: Image { vacancy.isFavorite ? Image(.heartFill) : Image(.heart) }

    init(vacancy: Vacancy, storage: Storage) {
        self.vacancy = vacancy
        self.storage = storage
    }

    func getPublishedDate() -> String {
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
