//
//  ContentView.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/10.
//

import SwiftUI

struct HomePage: View {
    let menu = ["HOME", "SELECT", "PRE-ORDER", "DIRECT", "WOMEN", "MEN"]
    @State var selectedMenu = "HOME"

    var body: some View {
        VStack {
            topBanner
            header
            mainMenu
            
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 500)
                    
                    Text("D.CURATION")
                        .font(Font.system(size: 30, weight: .regular))
                        .padding(.leading)
                        .padding(.top, 40)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 150)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 150)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 150)
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    
                    Text("JUST ARRIVED")
                        .font(Font.system(size: 30, weight: .regular))
                        .padding(.leading)
                        .padding(.top, 40)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 200, height: 300)
                            
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 200, height: 300)
                            
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 200, height: 300)
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 500)
                }
                .padding(.bottom, 30)
            }
        }
    }

    var topBanner: some View {
        ZStack {
            HStack {
                Spacer()

                Text("~11/30")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(16)

                Text("하얏트 호텔 50만원 상품권 모음")
                    .foregroundColor(Color.white)

                Spacer()
            }.frame(height: 50)
                .padding(.trailing)
                .background(Color.black)

            HStack {
                Spacer()
                Image(systemName: "xmark.circle")
                    .font(.system(size: 24))
                    .foregroundColor(Color.white)
            }.padding(.trailing)
        }
    }

    var header: some View {
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
    
    var mainMenu: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(menu, id: \.self) { title in
                    VStack {
                        Text(title)
                            .font(Font.system(size: 20, weight: .regular))
                            .padding(.bottom, -4)
                        Spacer()
                        if title == selectedMenu {
                            Rectangle().fill(.black).frame(height: 3)
                        }
                    }.frame(height: 30)
                        .onTapGesture {
                            selectedMenu = title
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}