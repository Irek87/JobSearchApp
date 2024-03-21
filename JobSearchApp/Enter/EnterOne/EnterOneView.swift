//
//  EnterOneView.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

struct EnterOneView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 18) {
                Text("Вход в личный кабинет")
                    .jType(style: .title2, color: .jWhite)

                Spacer()

                IndividualAccountLoginView()
                EmployerAccountLoginView()

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 32)
            .padding(.horizontal)
            .background(.clear)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    EnterOneView()
//        .environmentObject(Storage())
}
