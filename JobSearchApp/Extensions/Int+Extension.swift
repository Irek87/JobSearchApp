//
//  Int+Extension.swift
//  JobSearchApp
//
//  Created by Reek i on 21.03.2024.
//

import Foundation

extension Int {
    func vacancies() -> String {
        var vacanciesString: String = .init()

        if "1".contains("\(self % 10)") {
            vacanciesString = "вакансия"
        }
        if "234".contains("\(self % 10)") {
            vacanciesString = "вакансии"
        }
        if "567890".contains("\(self % 10)") {
            vacanciesString = "вакансий"
        }
        if 11...14 ~= self % 100 {
            vacanciesString = "вакансий"
        }

        return "\(self) \(vacanciesString)"
    }

    func people() -> String {
        var peopleString: String = .init()

        if "1".contains("\(self % 10)") {
            peopleString = "человек"
        }
        if "234".contains("\(self % 10)") {
            peopleString = "человека"
        }
        if "567890".contains("\(self % 10)") {
            peopleString = "человек"
        }
        if 11...14 ~= self % 100 {
            peopleString = "человек"
        }

        return "\(self) \(peopleString)"
    }
}
