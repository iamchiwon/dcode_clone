//
//  LayoutView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/10.
//

import SwiftUI

struct TabMenu {
    let icon: String
    let title: String
}

struct LayoutView: View {
    let tabs = [
        TabMenu(icon: "house", title: "홈"),
        TabMenu(icon: "tag", title: "브랜드"),
        TabMenu(icon: "newspaper", title: "뉴스"),
        TabMenu(icon: "heart", title: "찜"),
        TabMenu(icon: "person.circle", title: "나의 메뉴"),
    ]

    @State var selectedTab = "홈"

    var body: some View {
        ZStack {
            HomePage()

            VStack {
                Spacer()
                HStack {
                    ForEach(tabs, id: \.title) { t in
                        HStack {
                            Spacer()
                            VStack {
                                let icon = t.icon + (t.title == selectedTab ? ".fill" : "")
                                Image(systemName: icon)
                                    .font(Font.system(size: 24))
                                Text(t.title)
                                    .font(Font.system(size: 12, weight: .light))
                                    .padding(.top, 4)
                            }.onTapGesture {
                                selectedTab = t.title
                            }
                            Spacer()
                        }
                    }
                }.padding(.vertical, 8)
                    .background(Color.white)
                    
            }
        }
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
