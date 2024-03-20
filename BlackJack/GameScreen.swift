// BUGS: after player loses buttons are still there reduce this to just reset
// BUGS: the ui moves to fast to display cpu cards as player insted cpu last card is displayed fins a proper sleep function to use
// BUGS: sometimes cpu decides to just stop short it should never stop until it has defeted mt or lost

// TODO format buttons and layer card ontop eachother so aff played cards are viewable with latest card on top


import SwiftUI

struct GameScreen: View {
    
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var playerStand = false
    @State private var cpuStand = false
    @State private var initialDealDone = false
    @State private var currentPlayerCard = "back"
    @State private var currentCpuCard = "back"
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                if !initialDealDone {
                    Button("DEAL"){
                        initialDealDone = true
                        initialDeal()
                    }
                    .padding()
                }
                Spacer()
                HStack{
                    Spacer()
                    Image(currentCpuCard)
                    Spacer()
                    Image(currentCpuCard)
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Image(currentPlayerCard)
                    Spacer()
                    Image(currentPlayerCard)
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    if initialDealDone && !playerStand && !cpuStand {
                        Button("HIT"){
                            hit()
                        }
                        .padding()
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
        currentPlayerCard = cardName
        
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
        while cpucard() == 1 {
            let cardNum = Int.random(in: 2...14)
            let cardName = "card" + String(cardNum)
            currentCpuCard = cardName
            cpuScore += card_scores[cardNum] ?? 0
            print("CPU dealt a \(cardName). CPU score is \(cpuScore)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            }
        }
        cpuStand = true
        checkScore()
    }
    
    func initialDeal() {
        let playerCardNum = Int.random(in: 2...14)
        let cpuCardNum = Int.random(in: 2...14)
        currentPlayerCard = "card" + String(playerCardNum)
        currentCpuCard = "card" + String(cpuCardNum)
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
        } else if playerStand && cpuStand {
            if cpuScore == 21 {
                print("CPU wins")
            } else if cpuScore > 21 {
                print("You win")
            } else if playerScore > cpuScore {
                print("You win")
            } else if playerScore < cpuScore {
                print("CPU wins")
            } else {
                print("It's a tie")
            }
        }
    }
    
    func reset() {
        playerScore = 0
        cpuScore = 0
        playerStand = false
        cpuStand = false
        initialDealDone = false
        currentPlayerCard = "back"
        currentCpuCard = "back"
    }
    
    let card_scores: [Int: Int] = [2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9, 10: 10, 11: 10, 12: 10, 13: 10, 14: 11]

}


struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
