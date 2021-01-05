import UIKit

//Topic - Assertions

//Now name is Topic - Assertions and Preconditions

//in example using assertions for getting result what i expect in otherwise the app is will be close

var fingersOnTheHand = 5
assert(fingersOnTheHand==5, "The man has a 5 fingers on his hand")

//in example using assertions in conditional
fingersOnTheHand = 2

if fingersOnTheHand > 5
{
    print("U are not a human")
}
else if fingersOnTheHand > 0 && fingersOnTheHand < 5
{
    print("You don't have all fingers")
}
else if fingersOnTheHand == 5
{
    print("U are the human")
}
else
{
    assertionFailure("You don't have a negative value")
}

//in example use precondition for checking max age of human

var maxAgeHumanLife = 100

precondition(maxAgeHumanLife == 100, "The human life max 100 age")


//in example use stack as debugging code in 0unchecked mode, because it's ignore precondition in debug mode

maxAgeHumanLife = 102

if maxAgeHumanLife != 100{
    fatalError("The human life max 100 age")
    print("Don't reach here after error")
}
