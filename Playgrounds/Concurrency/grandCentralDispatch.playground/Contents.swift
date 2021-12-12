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
