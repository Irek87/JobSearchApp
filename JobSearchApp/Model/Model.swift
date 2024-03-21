//
//  Vacancy.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import Foundation

struct MokResult: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]
}

struct Offer: Codable {
    let id: String?
    let title: String
    let link: String
    let button: MokButton?
}

struct MokButton: Codable {
    let text: String
}

struct Vacancy: Codable, Equatable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address: Codable, Equatable {
    let town, street, house: String
}

struct Experience: Codable, Equatable {
    let previewText, text: String
}

struct Salary: Codable, Equatable {
    let short: String?
    let full: String
}
