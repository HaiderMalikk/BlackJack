//
//  ContentView.swift
//  BlackJack
//
//  Created by Haider Malik on 2024-03-14.
//
// update 2024-03-15: completed UI placment
// TODO: change the svg icons (only for buttons), integrate svgs as buttons

import SwiftUI

struct GameScreen: View {
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("deal")
                    .resizable()
                    .frame(width: 300, height: 120)
                    .cornerRadius(20)
                Spacer()
                HStack{
                    Spacer()
                    Image("back")
                    Spacer()
                    Image("back")
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Image("hit")
                        .resizable()
                        .frame(width: 100, height: 40)
                        .cornerRadius(20)
                    Spacer()
                    Image("stop")
                        .resizable()
                        .frame(width: 100, height: 40)
                        .cornerRadius(20)
                    Spacer()
                    Image("doubledown")
                        .resizable()
                        .frame(width: 100, height: 40)
                        .cornerRadius(20)
                    Spacer()
                        
                }
                Spacer()
            }
        }
    }
}

#Preview {
    GameScreen()
}
