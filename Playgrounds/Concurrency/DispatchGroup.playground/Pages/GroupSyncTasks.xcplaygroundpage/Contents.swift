//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

public class FourImages: UIView {
    
    public var ivs = [UIImageView]()
    
    public override init (frame: CGRect) {
        super.init (frame: frame)
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
        
        for i in 0...3 {
            //ivs[i].contentMode = .scaleAspectFit
            self.addSubview(ivs[i])
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

let view = FourImages(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.backgroundColor = UIColor.red

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                 "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                 "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
                 "https://csis-website-prod.s3.amazonaws.com/s3fs-public/publication/190503_Iceberg.jpg"]

var images = [UIImage]()

// Формируем группу синхронных операций по загрузке 4-х изображений

let imageGroup = DispatchGroup()

for i in 0...1 {
    DispatchQueue.global().async(group: imageGroup) {
        if let url = URL(string: imageURLs[i]), let data = try? Data(contentsOf: url) {
            images.append(UIImage(data: data)!)
            print ("----finished \(i) приоритет = \(qos_class_self().rawValue)")
        }
    }
}

for i in 2...3 {
    DispatchQueue.global(qos: .userInitiated).async(group: imageGroup) {
        if let url = URL(string: imageURLs[i]), let data = try? Data(contentsOf: url) {
            images.append(UIImage(data: data)!)
            print ("----finished \(i) приоритет = \(qos_class_self().rawValue)")
        }
    }
}

// Блок обратного вызова на всю группу

imageGroup.notify(queue: DispatchQueue.main) {
    for i in 0...3 {
        view.ivs[i].image = images[i]
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = view

//PlaygroundPage.current.finishExecution()
// Остановите Playground вручную, но изображение исчезнет
