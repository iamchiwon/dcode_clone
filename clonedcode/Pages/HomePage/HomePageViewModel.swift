//
//  HomePageViewModel.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/15.
//

import Combine
import Foundation

enum HomeTabs: String, CaseIterable {
    case HOME, SELECT, PREORDER = "PRE-ORDER", DIRECT, WOMEN, MEN
}

class HomePageViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let bannerService: BannerServiceProtocol

    @Published var topBanner: TextBanner? = nil
    @Published var selectedHomeTab = HomeTabs.HOME

    init(bannerService: BannerServiceProtocol) {
        self.bannerService = bannerService

        bannerService.topBanner.receive(on: RunLoop.main).sink { [weak self] in
            self?.topBanner = $0
        }.store(in: &cancellables)
    }

    func closeTopBanner() {
        bannerService.stopBannerTimer()
    }
}
