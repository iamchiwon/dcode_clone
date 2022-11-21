//
//  BannerService.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/21.
//

import Combine
import Foundation

protocol BannerServiceProtocol {
    var topBanner: AnyPublisher<TextBanner?, Never> { get }
    func stopBannerTimer()
}

class BannerService: BannerServiceProtocol {
    var topBanner: AnyPublisher<TextBanner?, Never>

    init() {
        topBanner = topBannerSubject.eraseToAnyPublisher()
        
        initTopBanners()
    }

    // MARK: - TOP BANNER

    let topBannerSubject = PassthroughSubject<TextBanner?, Never>()

    private var topBannerTimerCancellable: Cancellable?
    private var topBanners: [TextBanner] = []
    private var topBannerIndex = 0

    private func initTopBanners() {
        Task {
            topBanners = await fetchBanners()
            startBannerTimer()
        }
    }

    private func fetchBanners() async -> [TextBanner] {
        // simulate server fetch
        try? await Task.sleep(nanoseconds: 1500000000) // 1.5sec
        return [
            TextBanner(
                banner: TextBanner.ColoredText(text: "하얏트 호텔 50만원 상품권 모음", foregroundColor: 0xFFFFFF, backgroundColor: 0x000000),
                highlight: TextBanner.ColoredText(text: "-11/30", foregroundColor: 0xFFFFFF, backgroundColor: 0xA066C0),
                link: "/select/detail/2536"
            ),
            TextBanner(
                banner: TextBanner.ColoredText(text: "카세트백/5AC백 0원 응모", foregroundColor: 0xFFFFFF, backgroundColor: 0x000000),
                highlight: TextBanner.ColoredText(text: "-10/31", foregroundColor: 0xFFFFFF, backgroundColor: 0xBD0017),
                link: "/select/detail/2498"
            ),
            TextBanner(
                banner: TextBanner.ColoredText(text: "[룰렛 쿠폰] 90% 할인 쿠폰 당첨자는?", foregroundColor: 0xFFFFFF, backgroundColor: 0x434979),
                highlight: TextBanner.ColoredText(text: "-9/13", foregroundColor: 0x000000, backgroundColor: 0xE4E440),
                link: "/select/detail/2498"
            ),
        ]
    }

    private func startBannerTimer() {
        guard !topBanners.isEmpty else {
            topBannerSubject.send(nil)
            return
        }

        topBannerIndex = 0
        topBannerSubject.send(topBanners[topBannerIndex])

        topBannerTimerCancellable = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else {
                    self?.stopBannerTimer()
                    return
                }

                guard !self.topBanners.isEmpty else { return }
                self.topBannerIndex = (self.topBannerIndex + 1) % self.topBanners.count
                self.topBannerSubject.send(self.topBanners[self.topBannerIndex])
            }
    }

    func stopBannerTimer() {
        topBannerTimerCancellable?.cancel()
        topBannerTimerCancellable = nil
        topBannerSubject.send(nil)
    }
}
