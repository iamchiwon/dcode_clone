//
//  LayoutView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/10.
//

import SwiftUI

struct LayoutView: View {
    @EnvironmentObject var viewModel: LayoutViewModel

    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack {
                    switch viewModel.selectedTab.id {
                    case 0: HomePage()
                    case 1: BrandPage()
                    case 2: NewsPage()
                    case 3: WishPage()
                    case 4: MyPage()
                    default: EmptyView()
                    }

                    VStack {
                        Spacer()
                        BottomTabMenu()
                            .padding(.bottom, g.safeAreaInsets.bottom)
                            .background(Color(UIColor.systemBackground))
                            .environmentObject(viewModel)
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
            .environmentObject(LayoutViewModel())
    }
}
