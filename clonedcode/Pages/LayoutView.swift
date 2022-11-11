//
//  LayoutView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/10.
//

import SwiftUI



struct LayoutView: View {
    

    @State var selectedTab = "홈"

    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack {
                    HomePage()

                    VStack {
                        Spacer()
                        BottomTabMenu()
                            .padding(.bottom, g.safeAreaInsets.bottom)
                            .background(Color(UIColor.systemBackground))
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
    }
}
