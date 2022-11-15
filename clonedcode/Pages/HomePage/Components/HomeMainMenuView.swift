//
//  HomeMainMenuView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/15.
//

import SwiftUI

struct HomeMainMenuView: View {
    @EnvironmentObject var viewModel: HomePageViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(HomeMenus.allCases, id: \.self) { menu in
                    VStack {
                        Text(menu.rawValue)
                            .font(Font.system(size: 20, weight: .regular))
                            .padding(.bottom, -4)
                        Spacer()
                        if menu == viewModel.selectedMenu {
                            Rectangle().fill(Color(UIColor.label)).frame(height: 3)
                        }
                    }.frame(height: 30)
                        .onTapGesture {
                            viewModel.selectedMenu = menu
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HomeMainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainMenuView()
    }
}
