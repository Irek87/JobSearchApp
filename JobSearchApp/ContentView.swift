//
//  ContentView.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
//            Text("Main View")
            EnterOneView()
                .tabItem {
                    Label(
                        title: { Text("Поиск") },
                        icon: { Image(.magnifyingGlass).renderingMode(.template) }
                    )
                }

            Text("Избранное")
                .tabItem {
                    Label(
                        title: { Text("Избранное") },
                        icon: { Image(.heart).renderingMode(.template) }
                    )
                }

            Text("Отклики")
                .tabItem {
                    Label(
                        title: { Text("Отклики") },
                        icon: { Image(.envelope).renderingMode(.template) }
                    )
                }

            Text("Сообщения")
                .tabItem {
                    Label(
                        title: { Text("Сообщения") },
                        icon: { Image(.message).renderingMode(.template) }
                    )
                }

            Text("Профиль")
                .tabItem {
                    Label(
                        title: { Text("Профиль") },
                        icon: { Image(.person).renderingMode(.template) }
                    )
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
