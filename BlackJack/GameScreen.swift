//
//  ContentView.swift
//  BlackJack
//
//  Created by Haider Malik on 2024-03-14.
//
// update 2024-03-15: completed UI placment
// update 2024-03-16 change the svg icons (only for buttons) integrated svgs as buttons
// TODO: start working on game logic (blueprint in python)

import SwiftUI

struct GameScreen: View {
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Button(){
                    print("deal done")
                } label: {
                    Image("deal")
                }
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
                    Button(){
                        print("Hit done")
                    } label: {
                        Image("hit")
                    }
                    Spacer()
                    Button(){
                        print("stop done")
                    } label: {
                        Image("stop")
                    }
                    Spacer()
                        
                }
               
            }
        }
    }
}

#Preview {
    GameScreen()
}
