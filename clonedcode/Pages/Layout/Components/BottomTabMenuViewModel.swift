//
//  BottomTabMenuViewModel.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/11.
//

import Foundation

struct TabMenu {
    let id: Int
    let icon: String
    let selectedIcon: String
    let title: String
}

class BottomTabMenuViewModel: ObservableObject {
    let tabs = [
        TabMenu(id: 0, icon: "house", selectedIcon: "house.fill", title: "홈"),
        TabMenu(id: 1, icon: "tag", selectedIcon: "tag.fill", title: "브랜드"),
        TabMenu(id: 2, icon: "newspaper", selectedIcon: "newspaper.fill", title: "뉴스"),
        TabMenu(id: 3, icon: "heart", selectedIcon: "heart.fill", title: "찜"),
        TabMenu(id: 4, icon: "person.circle", selectedIcon: "person.circle.fill", title: "나의 메뉴"),
    ]

    @Published var currentTabId = 0

    func onChange(tab: TabMenu) {
        currentTabId = tab.id
    }
}
