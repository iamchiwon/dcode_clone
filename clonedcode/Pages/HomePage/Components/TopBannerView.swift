//
//  TopBannerView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/11.
//

import SwiftUI

struct TopBannerView: View {
    @StateObject var viewModel = TopBannerViewModel()

    var body: some View {
        if let banner = viewModel.banner {
            ZStack {
                HStack {
                    Spacer()

                    Text(banner.highlight.text)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .foregroundColor(Color(hex: banner.highlight.foregroundColor))
                        .background(Color(hex: banner.highlight.backgroundColor))
                        .cornerRadius(16)

                    Text(banner.banner.text)
                        .foregroundColor(Color(hex: banner.banner.foregroundColor))

                    Spacer()
                }.frame(height: 50)
                    .padding(.trailing)
                    .background(Color(hex: banner.banner.backgroundColor))

                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 24))
                        .foregroundColor(Color.white)
                        .onTapGesture { viewModel.onClose() }
                }.padding(.trailing)
            }
        }
    }
}

struct TopBannerView_Previews: PreviewProvider {
    static var previews: some View {
        TopBannerView()
    }
}
