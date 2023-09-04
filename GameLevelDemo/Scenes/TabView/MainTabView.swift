//
//  MainTabView.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 04.09.2023.
//  Copyright © 2023 SKS. All rights reserved.
//

import SwiftUI

// MARK: - MainTabView

struct MainTabView: View {

    // MARK: - Private Properties

    private let store: LevelStore = LevelStore()

    @State private var selectedTab = 1
    @State private var color: Color = .green

    // MARK: - Body

    var body: some View {
        TabView(
            selection: $selectedTab.onUpdate { color = selectedTab == 1 ? .green : .purple }
        ) {
            LevelView(title: store.title(forLevel: .green),
                      dataSource: store.dataSource(forLevel: .green))
                .tabItem({
                    Label(store.title(forLevel: .green),
                          systemImage: "tree")
                })
                .tag(1)

            LevelView(title: store.title(forLevel: .purple),
                      dataSource: store.dataSource(forLevel: .purple))
                .tabItem({
                    Label(store.title(forLevel: .purple),
                          systemImage: "sparkles")
                })
                .tag(2)
        }
        .accentColor(color)
    }
}

// MARK: - PreviewProvider

struct MainTabView_Previews: PreviewProvider {

    static var previews: some View {
        MainTabView()
    }
}
