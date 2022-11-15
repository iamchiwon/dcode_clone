//
//  HomePageViewModel.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/15.
//

import Foundation

enum HomeMenus: String, CaseIterable {
    case HOME, SELECT, PREORDER = "PRE-ORDER", DIRECT, WOMEN, MEN
}

class HomePageViewModel: ObservableObject {
    

    @Published var selectedMenu = HomeMenus.HOME
}
