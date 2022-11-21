//
//  TextBanner.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/21.
//

import Foundation

struct TextBanner {
    struct ColoredText {
        let text: String
        let foregroundColor: UInt
        let backgroundColor: UInt
    }
    
    let banner: ColoredText
    let highlight: ColoredText
    let link: String
}
