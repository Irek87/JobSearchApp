//
//  IndividualAccountLoginViewModel.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

final class IndividualAccountLoginViewModel: ObservableObject {
    @Published var email: String = .init() {
        didSet { isWrongFormat = false }
    }
    @Published var isWrongFormat: Bool = false
    @Published var isCorrectFormat: Bool = false

    var buttonIsDisabled: Bool { email.isEmpty }
    var strokeColor: Color { isWrongFormat ? Color.jRed : Color.clear }

    func clearText() {
        email = .init()
    }

    func validateEmail() {
        if validate(email) {
            isWrongFormat = false
            isCorrectFormat = true
        } else {
            isWrongFormat = true
            isCorrectFormat = false
        }
    }

    private func validate(_ emailAddress: String) -> Bool {
        let REGEX: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: emailAddress)
    }
}
