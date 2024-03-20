//
//  VacancyViewModel.swift
//  JobSearchApp
//
//  Created by Reek i on 19.03.2024.
//

import SwiftUI

final class VacancyViewModel: ObservableObject {
    @Published var vacancy: Vacancy //{
//        didSet {
//            if let index = storage.vacancies.firstIndex(where: { $0.id == vacancy.id }) {
//                storage.vacancies[index] = vacancy
//            }
//        }
//    }
    
    var heartIcon: Image { vacancy.isFavorite ? Image(.heartFill) : Image(.heart) }
    var address: String { "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)" }

    init(vacancy: Vacancy) {
        self.vacancy = vacancy
    }

    func getSchedules() -> String {
        let resultString = vacancy.schedules.map { $0 }.joined(separator: ", ")
        return resultString.prefix(1).capitalized + resultString.dropFirst()
    }
}
