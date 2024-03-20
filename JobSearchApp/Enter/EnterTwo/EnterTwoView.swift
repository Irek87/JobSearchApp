//
//  EnterTwoView.swift
//  JobSearchApp
//
//  Created by Reek i on 17.03.2024.
//

import SwiftUI

struct EnterTwoView: View {
    enum InputField: Hashable {
        case first, second, third, fourth
    }

    @EnvironmentObject private var storage: Storage
    @StateObject private var viewModel: EnterTwoViewModel
    @FocusState var focusedField: InputField?

    init(email: String) {
        _viewModel = StateObject(wrappedValue: EnterTwoViewModel(email: email))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Отправили код на \(viewModel.email)")
                .jType(style: .title2, color: .jWhite)

            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .jType(style: .title3, color: .jWhite)

            inputFields

            JButton(title: "Подтвердить", style: .blueBig) {
                viewModel.logIn(storage)
            }
            .disabled(viewModel.isButtonDisabled)
        }
        .padding(.leading, 12)
        .padding(.trailing, 18)
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.dark)
        .onAppear { focusedField = .first }
    }

    private var inputFields: some View {
        HStack(spacing: 8) {
            ForEach($viewModel.digits) { $digit in
                TextField(value: $digit.value, format: .number) {
                    Text("*")
                        .jType(style: .title1, color: .jGrey4)
                }
                .focused($focusedField, equals: digit.inputId)
                .multilineTextAlignment(.center)
                .frame(width: 48, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.jGrey2)
                )
                .keyboardType(.numberPad)
                .onChange(of: digit.value) { _, newValue in
                    if let newValue, newValue > 9 {
                        digit.value = newValue / 10
                    }

                    if let newValue, String(newValue).count > 0 {
                        viewModel.focusNext(field: &focusedField)
                    }
                }
            }
        }
    }
}

#Preview {
    EnterTwoView(email: "example@mail.com")
        .environmentObject(Storage())
}
