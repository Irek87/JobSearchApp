//
//  NetworkManager.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import Foundation

final class NetworkManager {
    static var shared = NetworkManager()

    private init() {}

    func getVacancies() async -> [Vacancy] {
        var vacancies = [Vacancy]()

        guard let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else { return vacancies }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(MokResult.self, from: data) {
                vacancies = decodedResponse.vacancies
            }
        } catch {
            print("Invalid data")
        }

        return vacancies
    }
}
