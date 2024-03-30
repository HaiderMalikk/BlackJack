// BUGS: the stand and hit button remains after cpu or player loses it disaperes but its still there and you can press it once more before its gone

// ForEach<Array<String>, String, Image>: the ID card8 occurs multiple times within the collection, this will give undefined results! -> this error is ignored possibly

// TODO: ethier make the cards a stack or a scroll ability to scrool through played cards, get buttons for stand and reset replace the stop with stand

import SwiftUI

struct GameScreen: View {
    
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var playerStand = false
    @State private var cpuStand = false
    @State private var initialDealDone = false
    @State private var currentPlayerCards: [String] = []
    @State private var currentCpuCards: [String] = []
    @State private var gameState = false
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                if !initialDealDone {
                    Button(){
                        initialDealDone = true
                        initialDeal()
                    } label:{
                        Image("deal")
                    }
                    .padding()
                }
                Spacer()
                HStack{
                    Spacer()
                    ForEach(currentCpuCards, id: \.self) { card in
                        Image(card)
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    ForEach(currentPlayerCards, id: \.self) { card in
                        Image(card)
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    if initialDealDone && !playerStand && !cpuStand && !gameState {
                        Button(){
                            hit()
                        } label: {
                            Image("hit")
                        }
                        .padding()
                        .disabled(gameState)
                        Spacer()
                        Button("STAND"){
                            stand()
                        }
                        .padding()
                    }
                    Spacer()
                    if (playerScore == 21 || playerScore > 21 || (playerStand && cpuStand)) && initialDealDone {
                        Button("RESET"){
                            reset()
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
        }
    }
    
    func hit() {
        let cardNum = Int.random(in: 2...14)
        let cardName = "card" + String(cardNum)
        currentPlayerCards.append(cardName)
        
        // Special case for Ace (card number 14)
        if cardNum == 14 {
            if playerScore + 11 <= 21 {
                playerScore += 11
            } else {
                playerScore += 1
            }
        } else {
            playerScore += card_scores[cardNum] ?? 0
        }
        
        print("You were dealt a \(cardName). Your score is \(playerScore)")
        checkScore()
    }

    
    func stand() {
        playerStand = true
        while cpucard() == 1 && cpuScore < playerScore {
            let cardNum = Int.random(in: 2...14)
            let cardName = "card" + String(cardNum)
            currentCpuCards.append(cardName)
            cpuScore += card_scores[cardNum] ?? 0
            print("CPU dealt a \(cardName). CPU score is \(cpuScore)")
        }
        if cpuScore <= playerScore {
            let cardNum = Int.random(in: 2...14)
            let cardName = "card" + String(cardNum)
            currentCpuCards.append(cardName)
            cpuScore += card_scores[cardNum] ?? 0
            print("CPU dealt a \(cardName). CPU score is \(cpuScore)")
        }
        cpuStand = true
        checkScore()
    }

    
    func initialDeal() {
        let playerCardNum = Int.random(in: 2...14)
        let cpuCardNum = Int.random(in: 2...14)
        currentPlayerCards.append("card" + String(playerCardNum))
        currentCpuCards.append("card" + String(cpuCardNum))
        playerScore += card_scores[playerCardNum] ?? 0
        cpuScore += card_scores[cpuCardNum] ?? 0
        print("You were dealt a card\(playerCardNum). Your score is \(playerScore)")
        print("CPU was dealt a card\(cpuCardNum). CPU score is \(cpuScore)")
    }
    
    func cpucard() -> Int {
        if cpuScore >= 17 {
            return 0
        } else {
            return 1
        }
    }
    
    func checkScore() {
        if playerScore == 21 {
            print("You win")
        } else if playerScore > 21 {
            print("You lose")
            gameState = true
        } else if playerStand && cpuStand {
            if cpuScore == 21 {
                print("CPU wins")
                gameState = true
            } else if cpuScore > 21 {
                print("You win")
                gameState = true
            } else if playerScore > cpuScore {
                print("You win")
                gameState = true
            } else if playerScore < cpuScore {
                print("CPU wins")
                gameState = true
            } else if playerScore == cpuScore && playerScore == 21 {
                print("It's a tie")
                gameState = true
            }
        }
    }

    func reset() {
        playerScore = 0
        cpuScore = 0
        playerStand = false
        cpuStand = false
        initialDealDone = false
        currentPlayerCards = []
        currentCpuCards = []
        gameState = false
    }
    
    
    let card_scores: [Int: Int] = [2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9, 10: 10, 11: 10, 12: 10, 13: 10, 14: 11]

}


struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
