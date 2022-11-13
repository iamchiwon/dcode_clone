//
//  BottomTabMenu.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/11.
//

import SwiftUI

struct BottomTabMenu: View {
    @StateObject var viewModel = BottomTabMenuViewModel()

    var body: some View {
        HStack {
            ForEach(viewModel.tabs, id: \.id) { t in
                HStack {
                    Spacer()
                    TabItemView(
                        item: t,
                        selected: viewModel.currentTabId == t.id
                    )
                    Spacer()
                }.onTapGesture {
                    viewModel.onChange(tab: t)
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
