//
//  TopBannerView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/11.
//

import SwiftUI

struct TopBannerView: View {
    var banner: TextBanner? = nil
    var onClose: (() -> Void)? = nil

    var body: some View {
        if let banner = banner {
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
                        .onTapGesture { onClose?() }
                }.padding(.trailing)
            }
        }
    }
}

struct TopBannerView_Previews: PreviewProvider {
    static var previews: some View {
        TopBannerView(
            banner: TextBanner(
                banner: TextBanner.ColoredText(text: "[룰렛 쿠폰] 90% 할인 쿠폰 당첨자는?", foregroundColor: 0xFFFFFF, backgroundColor: 0x434979),
                highlight: TextBanner.ColoredText(text: "-9/13", foregroundColor: 0x000000, backgroundColor: 0xE4E440),
                link: "/select/detail/2498"
            )
        )
    }
}
