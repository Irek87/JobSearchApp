//
//  EmployerAccountLoginView.swift
//  JobSearchApp
//
//  Created by Reek i on 16.03.2024.
//

import SwiftUI

struct EmployerAccountLoginView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Поиск сотрудников")
                    .jType(style: .title3, color: .jWhite)
                    .shadow(color: .shadows, radius: 5, y: 5)
                Text("Размещение вакансий и доступ к базе резюме")
                    .jType(style: .text1, color: .jWhite)
            }

            JButton(title: "Я ищу сотрудников", style: .greenSmall) {

            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.jGrey1)
        )
        .preferredColorScheme(.dark)
    }
}

#Preview {
    EmployerAccountLoginView()
}
