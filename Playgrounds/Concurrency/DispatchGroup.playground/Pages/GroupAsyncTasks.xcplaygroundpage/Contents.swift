//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

public class EightImages: UIView {
    
    public var ivs = [UIImageView]()
    
    public override init (frame: CGRect) {
        super.init (frame: frame)
        
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
        
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 400, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 400, width: 100, height: 100)))
        
        for i in 0...7 {
            ivs[i].contentMode = .scaleAspectFit
            self.addSubview(ivs[i])
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


var view = EightImages(frame: CGRect(x: 0, y: 0, width: 200, height: 500))
view.backgroundColor = UIColor.red

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                 "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                 "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
                 "https://csis-website-prod.s3.amazonaws.com/s3fs-public/publication/190503_Iceberg.jpg"]

var images = [UIImage]()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = view

// асинхронная обертка синхронной операции - загрузки изображение

func asyncLoadImage(imageURL: URL,
                    runQueue: DispatchQueue,
                    completionQueue: DispatchQueue,
                    completion: @escaping (UIImage?, Error?) -> ()) {
    runQueue.async {
        do {
            let data = try Data(contentsOf: imageURL)
            completionQueue.async { completion(UIImage(data: data), nil)}
        } catch let error {
            completionQueue.async { completion(nil, error)}
        }
    }
}

// Формируем группу асинхронных операций по загрузке 4-х изображений

func asyncGroup() {
    print("\n----- Группа асинхронных заданий ---\n")
    let aGroup = DispatchGroup()
    
    // формируем группу aсинхронных операций
    /*
     for i in 0...3 {
     aGroup.enter()
     asyncLoadImage(imageURL: URL(string: imageURLs[i])!,
     runQueue: DispatchQueue.global(),
     completionQueue: DispatchQueue.main)
     { result, error in
     guard let image1 = result else { return }
     images.append(image1)
     aGroup.leave()
     }
     }
     */
    
    // Формируем смешанную группу синхронных и
    // асинхронных операций по загрузке 4-х изображений
    
    // Добавляем aсинхронные операции в группу (enter(), eave())
        
    for i in 0...1 {
        aGroup.enter()
        asyncLoadImage(imageURL: URL(string:imageURLs[i])!,
                       runQueue: DispatchQueue.global(),
                       completionQueue: DispatchQueue.main)
        { result, error in
            guard let image1 = result else { return }
            images.append(image1)
            print ("----finished \(i) приоритет = \(qos_class_self().rawValue)")
            aGroup.leave()
        }
    }
    
    // Добавляем синхронные операции в группу (async(group: aGroup))
    
    for i in 2...3 {
        DispatchQueue.global(qos: .userInitiated).async(group: aGroup) {
            if let url = URL(string: imageURLs[i]), let data = try? Data(contentsOf: url){
                images.append(UIImage(data: data)!)
                print ("----finished \(i) приоритет = \(qos_class_self().rawValue)")
            }
        }
    }
    
    aGroup.notify(queue: DispatchQueue.main) {
        for i in 0...3 {
            view.ivs[i].image = images[i]
        }
    }
}
    
// Для сравнения загружаем изображения в нижнюю часть экрана
// обычным способом (URLSession) без групп, друг за другом

func asyncUsual() {
    print("\n=--- Usual way of load image one by one ----\n")
    for i in 4...7 {
        let url = URL(string: imageURLs[i - 4])
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                print ("----finished \(i)")
                view.ivs[i].image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}

asyncGroup()
asyncUsual()

//PlaygroundPage.current.finishExecution()
//Остановите Playground вручную, но изображение исчезнет
