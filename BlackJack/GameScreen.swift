//
//  ContentView.swift
//  BlackJack
//
//  Created by Haider Malik on 2024-03-14.
//
// update 2024-03-15: completed UI placment
// update 2024-03-16 change the svg icons (only for buttons) integrated svgs as buttons
// TODO: FIX PYTHON SCRIPT

import SwiftUI
import PythonKit



struct GameScreen: View {
    @State var showResult: Bool = false
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Button(action: {
                    RunPythonScript()
                    showResult.toggle()
                }) {
                    Text("RUN PY")
                }
                if showResult {
                    Text(String("\(RunPythonScript())"))
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
