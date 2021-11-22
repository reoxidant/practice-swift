import UIKit

//Topic - Property Observers

class StepCounter {
    var totalSteps: Int = 0 {
        //Call willSet before u set value to variable
        willSet(newTotalSteps)
        {
            print("The new value of newTotalSteps will be \(newTotalSteps)")
        }
        //Call didSet after setting value
        didSet{
            if totalSteps > oldValue
            {
                print("Adding \(totalSteps - oldValue) steps")
            }
        }
    }
}


var counter = StepCounter()

counter.totalSteps = 10

//The new value of newTotalSteps will be 10
//Adding 10 steps

counter.totalSteps = 5

//The new value of newTotalSteps will be 5

counter.totalSteps = 10

//The new value of newTotalSteps will be 10
//Adding 5 steps

class User {
    var username = "none" {
        willSet{
            if username != newValue
            {
                print("The new name - \(newValue) has been set user")
            }
        }
        
        didSet{
            print("Old name of user has been \(oldValue), now \(username)")
        }
    }
}

var someUser = User()

someUser.username = "Vitaliy"
