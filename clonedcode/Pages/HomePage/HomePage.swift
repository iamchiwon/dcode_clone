//
//  ContentView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/10.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var viewModel: HomePageViewModel

    var body: some View {
        VStack(spacing: 0) {
            TopBannerView(banner: viewModel.topBanner) {
                viewModel.closeTopBanner()
            }
            HomeLogoHeaderView()
            HomeTabView(tabs: HomeTabs.allCases, selectedTab: viewModel.selectedHomeTab) {
                viewModel.selectedHomeTab = $0
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 500)

                    Text("D.CURATION")
                        .font(Font.system(size: 30, weight: .regular))
                        .padding(.leading)
                        .padding(.top, 40)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 150)

                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 150)

                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 150)
                        }
                        .padding(.horizontal, 30)
                    }

                    Text("JUST ARRIVED")
                        .font(Font.system(size: 30, weight: .regular))
                        .padding(.leading)
                        .padding(.top, 40)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 200, height: 300)

                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 200, height: 300)

                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 200, height: 300)
                        }
                        .padding(.horizontal, 30)
                    }

                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 500)
                }
                .padding(.bottom, 30)
            }
        }
        .animation(.spring())
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    init() {
        Container.setup()
    }

    static var previews: some View {
        let homePageViewModel = Container.shared.resolve(HomePageViewModel.self)!

        HomePage()
            .environmentObject(homePageViewModel)
    }
}
