BLACKJACK (ios)

Description:
The SwiftUI Blackjack Game is a digital version of the classic card game Blackjack, also known as 21. The game is played between a player and a computerized dealer (CPU). The goal of the game is for the player to have a higher score than the CPU without exceeding 21.

Key Features:
Deal: At the start of the game, the player and the CPU are dealt two cards each. The player's cards are visible, while only one of the CPU's cards is visible.
Hit: The player can choose to receive an additional card ("hit") to increase their score. However, if the player's score exceeds 21, they bust and lose the game.
Stand: The player can choose to end their turn ("stand"), keeping their current score. Once the player stands, the CPU reveals its hidden card and may draw additional cards to try to beat the player's score.
Winning Conditions: The player wins if their score is higher than the CPU's score without exceeding 21. The CPU wins if its score is higher than the player's score without exceeding 21. If both the player and the CPU have the same score and it's less than or equal to 21, it's a tie.
Reset: After the game ends, the player can choose to reset the game to play again.

Technologies Used:
SwiftUI: Used for building the user interface and managing the game's state.
Random Card Generation: Randomly generates cards for the player and CPU.
Score Calculation: Calculates the total score for the player and CPU based on the card values.
Game State Management: Manages the game's state, including tracking scores, player decisions (hit/stand), and game outcome.
