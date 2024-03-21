//
//  JobSearchAppApp.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

final class Storage: ObservableObject {
    @Published var isNotLoggedIn: Bool = true
    @Published var vacancies: [Vacancy] = .init()
}

@main
struct JobSearchAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
