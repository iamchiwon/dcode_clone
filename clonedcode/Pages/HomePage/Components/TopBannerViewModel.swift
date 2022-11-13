//
//  TopBannerViewModel.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/11.
//

import Foundation
import Combine

class TopBannerViewModel : ObservableObject {
    
    private var banners: [BannerItem] = []
    private var showingIndex = 0
    
    init() {
        Task {
            banners = await fetchBanners()
            startTimer()
        }
    }
    
    private func fetchBanners() async -> [BannerItem] {
        try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5sec
        return [
            BannerItem(
                banner: ColoredText(text: "하얏트 호텔 50만원 상품권 모음", foregroundColor: 0xFFFFFF, backgroundColor: 0x000000),
                highlight: ColoredText(text: "-11/30", foregroundColor: 0xFFFFFF, backgroundColor: 0xA066C0),
                link: "/select/detail/2536"
            ),
            BannerItem(
                banner: ColoredText(text: "카세트백/5AC백 0원 응모", foregroundColor: 0xFFFFFF, backgroundColor: 0x000000),
                highlight: ColoredText(text: "-10/31", foregroundColor: 0xFFFFFF, backgroundColor: 0xBD0017),
                link: "/select/detail/2498"
            ),
            BannerItem(
                banner: ColoredText(text: "[룰렛 쿠폰] 90% 할인 쿠폰 당첨자는?", foregroundColor: 0xFFFFFF, backgroundColor: 0x434979),
                highlight: ColoredText(text: "-9/13", foregroundColor: 0x000000, backgroundColor: 0xE4E440),
                link: "/select/detail/2498"
            )
        ]
    }
    
    private var cancelTimer: Cancellable? = nil
    
    private func startTimer() {
        guard !self.banners.isEmpty else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.showingIndex = 0
            self.banner = self.banners[self.showingIndex]
        }
        
        cancelTimer = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink() { [weak self] _ in
                guard let self = self else { return }
                guard !self.banners.isEmpty else { return }
                self.showingIndex = (self.showingIndex + 1) % self.banners.count
                self.banner = self.banners[self.showingIndex]
            }
    }
    
    private func stopTimer() {
        cancelTimer?.cancel()
        cancelTimer = nil
    }
    
    // MARK: - Model
    
    struct BannerItem {
        let banner: ColoredText
        let highlight: ColoredText
        let link: String
    }
    
    struct ColoredText {
        let text: String
        let foregroundColor: UInt
        let backgroundColor: UInt
    }
    
    // MARK: - UI Outlet
    
    @Published var banner: BannerItem?
    
    // MARK: - UI Action
    
    func onClose() {
        banner = nil
        stopTimer()
    }
}
