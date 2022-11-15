//
//  HomeLogoHeaderView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/15.
//

import SwiftUI

struct HomeLogoHeaderView: View {
    var body: some View {
        HStack {
            Text("d.code")
                .font(.system(size: 30, weight: .bold))
            Spacer()
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                Image(systemName: "cart")
            }
            .foregroundColor(Color(UIColor.darkGray))
            .font(.system(size: 24))
        }.frame(height: 60)
            .padding(.horizontal)
    }
}

struct HomeLogoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLogoHeaderView()
    }
}
