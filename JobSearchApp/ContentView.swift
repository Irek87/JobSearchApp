//
//  ContentView.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var storage = Storage()
    @State private var isLoggedIn: Bool = false

    var body: some View {
        Group {
            if !storage.isLoggedIn {
                EnterOneView()
            } else {
                TabView {
                    MainView()
                        .tabItem {
                            Label(
                                title: { Text("Поиск") },
                                icon: { Image(.magnifyingGlass).renderingMode(.template) }
                            )
                        }

                    FavoritesView()
                        .tabItem {
                            Label(
                                title: { Text("Избранное") },
                                icon: { Image(.heart).renderingMode(.template) }
                            )
                        }
                        .badge(storage.vacancies.filter{$0.isFavorite}.count)

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
                .task {
                    storage.vacancies = await NetworkManager.shared.getVacancies()
                }
                .preferredColorScheme(.dark)
            }
        }
        .environmentObject(storage)
    }
}

#Preview {
    ContentView()
        .environmentObject(Storage())
}
