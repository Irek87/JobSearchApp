//
//  IndividualAccountLoginView.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

struct IndividualAccountLoginView: View {
    @StateObject private var viewModel = IndividualAccountLoginViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            title
            textField
            buttons
        }
        .padding(.horizontal)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
        .preferredColorScheme(.dark)
    }
}

private extension IndividualAccountLoginView {
    var title: some View {
        Text("Поиск работы")
            .jType(style: .title3, color: .jWhite)
    }

    var textField: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                if viewModel.email.isEmpty {
                    Image(.envelope)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.jGrey4)
                }

                TextField(text: $viewModel.email) {
                    Text("Электронная почта или телефон")
                        .jType(style: .text1, color: .jGrey4)
                }
                .jType(style: .text1, color: .jWhite)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .frame(height: 28) // to avoid jerking the text field

                if !viewModel.email.isEmpty {
                    Button {
                        viewModel.clearText()
                    } label: {
                        Image(.xMark)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.jGrey5)
                    }
                }
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.jGrey2)
                    .shadow(color: .shadows, radius: 10, y: 10)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(viewModel.strokeColor, lineWidth: 1)
            }

            if viewModel.isWrongFormat {
                Text("Вы ввели неверный e-mail")
                    .jType(style: .text1, color: .jRed)
            }
        }
    }

    var buttons: some View {
            HStack(spacing: 24) {
                NavigationLink {
                    EnterTwoView(email: viewModel.email)
                } label: {
                    JButton(title: "Продолжить", style: .blueSmall) {
                        viewModel.validateEmail()
                    }
                    .disabled(viewModel.buttonIsDisabled)
                }

                Button {

                } label: {
                    Text("Войти с паролем")
                        .jType(style: .buttonText2, color: .jBlue)
                }
            }
    }
}

#Preview {
    IndividualAccountLoginView()
}
