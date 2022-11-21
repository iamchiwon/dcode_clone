//
//  BottomTabMenu.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/11.
//

import SwiftUI

struct BottomTabMenu: View {
    @EnvironmentObject var viewModel: LayoutViewModel

    var body: some View {
        HStack {
            ForEach(LayoutViewModel.tabs, id: \.id) { t in
                HStack {
                    Spacer()
                    TabItemView(
                        item: t,
                        selected: viewModel.selectedTab.id == t.id
                    )
                    Spacer()
                }.onTapGesture {
                    viewModel.selectedTab = t
                }
            }
        }
        .padding(.vertical, 8)
        .background(Color(UIColor.systemBackground))
    }
}

struct TabItemView: View {
    var item: TabMenu
    var selected: Bool

    var body: some View {
        VStack {
            Image(systemName: selected ? item.selectedIcon : item.icon)
                .font(Font.system(size: 24))
            Text(item.title)
                .font(Font.system(size: 14, weight: .light))
                .padding(.top, 4)
        }
    }
}

struct BottomTabMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabMenu()
    }
}
