//
//  HomeMainMenuView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/15.
//

import SwiftUI

struct HomeTabView: View {
    let tabs: [HomeMenu]
    let selectedTab: HomeMenu
    let onChangeTab: (HomeMenu) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(tabs, id: \.self) { tab in
                    VStack {
                        Text(tab.rawValue)
                            .font(Font.system(size: 20, weight: .regular))
                            .padding(.bottom, -4)
                        Spacer()
                        if tab == selectedTab {
                            Rectangle().fill(Color(UIColor.label)).frame(height: 3)
                        }
                    }.frame(height: 30)
                        .onTapGesture { onChangeTab(tab) }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HomeMainMenuView_Previews: PreviewProvider {
    @State static var selected = HomeMenu.HOME

    static var previews: some View {
        HomeTabView(tabs: HomeMenu.allCases,
                    selectedTab: selected) {
            selected = $0
        }
    }
}
