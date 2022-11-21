//
//  clonedcodeApp.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/10.
//

import SwiftUI

@main
struct clonedcodeApp: App {
    init() {
        Container.setup()
    }

    var body: some Scene {
        WindowGroup {
            LayoutView()
                .environmentObject(Container.shared.resolve(LayoutViewModel.self)!)
                .environmentObject(Container.shared.resolve(HomePageViewModel.self)!)
        }
    }
}

extension Container {
    static func setup() {
        // Services
        Container.shared.regist(BannerServiceProtocol.self) { _ in BannerService() }
        
        // ViewModels
        Container.shared.regist(LayoutViewModel.self) { _ in LayoutViewModel() }
        Container.shared.regist(HomePageViewModel.self) { con in HomePageViewModel(bannerService: con.resolve(BannerServiceProtocol.self)!) }
    }
}
