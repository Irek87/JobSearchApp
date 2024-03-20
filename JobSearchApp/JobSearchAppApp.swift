//
//  JobSearchAppApp.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

final class Storage: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var vacancies: [Vacancy] = .init() {
        didSet { print("Storage changed") }
    }
}

@main
struct JobSearchAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
