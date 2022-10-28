import UIKit

//Topic - While Loops

//use while conditional, while iterator not will be in finish state that define into body iterator

//while {}

//in example game stairs and snake define 25 square

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare+1)

//then define square for stairs and upper and down points

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {

    diceRoll += 1
    diceRoll = diceRoll == 7 ? 1 : diceRoll

    square += diceRoll

    if square < board.count{
        square += board[square]
        print("square  - \(square)")
    }
}


//Sub topic - repeat-while

//in repeat-while first do iteration then check condition

//below the game Stairs and Snake in realesation repeat-while

repeat{
    square += board[square]
    
    diceRoll += 1
    diceRoll = diceRoll == 7 ? 1 : diceRoll
    print("square - \(square)")
    square += diceRoll
} while square < finalSquare

print("Game over!")
