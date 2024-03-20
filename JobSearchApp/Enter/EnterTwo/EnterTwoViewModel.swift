//
//  EnterTwoViewModel.swift
//  JobSearchApp
//
//  Created by Reek i on 18.03.2024.
//

import SwiftUI

final class EnterTwoViewModel: ObservableObject {
    @Published var digits: [JDigit] = [
        JDigit(inputId: .first, value: nil),
        JDigit(inputId: .second, value: nil),
        JDigit(inputId: .third, value: nil),
        JDigit(inputId: .fourth, value: nil)
    ]

    let email: String
    var isButtonDisabled: Bool {
        digits.compactMap { $0.value }.count != digits.count
    }

    init(email: String) {
        self.email = email
    }

    func focusNext( field: inout EnterTwoView.InputField?) {
        switch field {
        case .first:
            field = .second
        case .second:
            field = .third
        case .third:
            field = .fourth
        case .fourth:
            field = nil
        case nil:
            break
        }
    }

    func logIn(_ storage: Storage) {
        storage.isLoggedIn = true
    }
}

struct JDigit: Identifiable {
    let id: UUID = UUID()
    let inputId: EnterTwoView.InputField
    var value: Int?
}
