//
//  ContentView.swift
//  War Card Game
//
//  Created by Mykola on 04.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        // Main Area
        ZStack {
            
            Image("background")
                .ignoresSafeArea()
            
            // Positioning all elements
            VStack {
                
                Spacer()
                Image("logo")
                Spacer()
                // Card section
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    
                    // Generate random number between 2 and 13
                    var playerRandom = Int.random(in: 2...14)
                    var cpuRandom = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRandom)
                    cpuCard = "card" + String(cpuRandom)
                    
                    // Update the score
                    if playerRandom > cpuRandom {
                        playerScore += 1
                    } else if playerRandom < cpuRandom {
                        cpuScore += 1
                    }
                    
                } label: {
                    Image("dealbutton")
                }
                Spacer()
                // Scores
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
