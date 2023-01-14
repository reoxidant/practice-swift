import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

/*

var view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
image.backgroundColor = .yellow
image.contentMode = .scaleAspectFit
view.addSubview(image)
 
PlaygroundPage.current.liveView = view

func fetchImage() {
    guard let imageUrl = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg") else { return }
    
    let queue = DispatchQueue.global(qos: .utility)
    queue.async {
        if let data = try? Data(contentsOf: imageUrl) {
            DispatchQueue.main.async {
                image.image = UIImage(data: data)
                print("Show image data")
            }
            print("Did download image data")
        }
    }
}
fetchImage()

*/

let mySerialQueue = DispatchQueue(label: "com.serial.example")
var value = "🥳"

func changeValue(variant: Int) {
    sleep(1)
    value = value + "🐔"
    print("\(value) - \(variant)")
}
/*
mySerialQueue.async {
    changeValue(variant: 1)
}
value
*/
/*
value = "🐵"
mySerialQueue.sync {
    changeValue(variant: 2)
}
value
*/

value = "🦊"
mySerialQueue.sync {
    changeValue(variant: 1)
}
value
sleep(2)

let serialQueue = DispatchQueue(label: "vshapovalov-serial", qos: .utility)
let concurrentQueue = DispatchQueue(label: "vshapovalov-queue", qos: .utility, attributes: .concurrent)

let group1 = DispatchGroup()

let workItem1 = DispatchWorkItem {
    print("start workItem1")
    sleep(3)
    print("end workItem1")
    group1.leave()
}

let workItem2 = DispatchWorkItem {
    print("start workItem2")
    sleep(3)
    print("end workItem2")
    group1.leave()
}

//concurrentQueue.async(group: group1, execute: workItem1)

//group1.enter()
//
//concurrentQueue.sync(execute: workItem1)
//
//group1.enter()
//
//concurrentQueue.sync(execute: workItem2)
//
//group1.wait(timeout: .now() + 5.0)
//
//print("FINISH!")

//let semaphore = DispatchSemaphore(value: 0)
//
//serialQueue.async {
//    print("start semaphore")
//    sleep(3)
//    print("end semaphore")
//
//    semaphore.signal()
//}

//semaphore.wait()
//
//print("Finish!")


weak var cancelledWorkItem: DispatchWorkItem?

let customWorkItem1 = DispatchWorkItem {
    
    if let workItem = cancelledWorkItem, workItem.isCancelled {
        print("canceled customWorkItem2")
    }
    
    print("start customWorkItem1")
    sleep(3)
    print("end customWorkItem1")
}

let customWorkItem2 = DispatchWorkItem {
    
    print("start customWorkItem2")
    sleep(3)
    print("end customWorkItem2")
}

cancelledWorkItem = customWorkItem2

concurrentQueue.async(execute: customWorkItem1)

concurrentQueue.async(execute: customWorkItem2)

customWorkItem2.cancel()

customWorkItem2.notify(queue: .main) {
    print("Finish customWorkItem2!")
}
