import UIKit

//Topic Lazy Stored Properties

class remoteDatabase{

    //class which load image from the internet
    var imageFile = "cats.png"
}

class imageView{
    lazy var remoteData = remoteDatabase()
    var data = [String]()
}

var image = imageView()

//We can to use data element for appending strings but remoteDatabase is not yet initialized

image.data.append("First image")
image.data.append("Second image")

//The remoteDatabase will be initialization then u calling the remoteData of imageView class, and not be if u don't do this

print("The lazy init will running and return image file named \(image.remoteData.imageFile)")
