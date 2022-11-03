/*:
 ## Exercise for Application - Training Types.
 
 >These exercises help Swift better understand the fitness application.
 
 Your app allows you to track different types of training. At the time of designing the app, you decided to create a basic class `Workout`, from which all other classes with different types of training will inherit. `Workout` — base class with properties `time` and `distance`. `Run` and `Swim` — classes of inheritance that add class-specific properties `Workout`.
 
 Also defined array `workouts`, this is a log of previous training. You use the classes and the array for the exercises below.
 */

class Workout {             // workout
    let time: Double        // time
    let distance: Double    // distance
    
    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {    // run
    let cadence: Double // cadence
    
    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {   // swim
    let stroke: String  // stroke
    
    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "freestyle", time: 32.1, distance: 50),
    Swim(stroke: "butterfly", time: 36.8, distance: 50),
    Swim(stroke: "freestyle", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

/*:
    Write a function`describeRun(runningWorkout:)` and `describeSwim(swimmingWorkout:)`, receive type object `Run` and `Swim` respectively. None of them should return values. Each function should display a description of the workout, including running speed or swimming style.  The time is depicted in seconds, the distance - in metres, the cadence - in steps per minute.
 */
func describeRun(runningWorkout: Run) {
    print("Running Workout Description - Running Speed: \(runningWorkout.cadence) steps per minute, time: \(runningWorkout.time) seconds, distance \(runningWorkout.distance) meters.")
}

func describeSwim(swimmingWorkout: Swim) {
    print("Training Description Swimming - Swimming Style: \(swimmingWorkout.stroke), time: \(swimmingWorkout.time) seconds, distance  \(swimmingWorkout.distance) meters.")
}

/*:
    Recalculate all workouts in the array `workouts` and, with the help of typing, call either `describeRun(runningWorkout:)`, either `describeSwim(swimmingWorkout:)` for each.  Note that will be displayed in the console.
 */
workouts.forEach {
    if let run = $0 as? Run {
        describeRun(runningWorkout: run)
    } else if let swim = $0 as? Swim {
        describeSwim(swimmingWorkout: swim)
    }
}

//: [Previous](@previous)  |  page 2 of 2
