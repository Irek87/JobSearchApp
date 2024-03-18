//
//  MainViewModel.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var searchText: String = .init()
    @Published var vacancies: [Vacancy] = .init()

    func getVacancies() async {
        vacancies = await NetworkManager.shared.getVacancies()
    }
}
