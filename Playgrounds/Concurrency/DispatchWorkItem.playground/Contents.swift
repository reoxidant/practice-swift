//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//: Определяем бесконечное выполнение, чтобы предотвратить "выбрасывание" background tasks, когда работа на Playground будет закончена.
PlaygroundPage.current.needsIndefiniteExecution = true

var view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
var mainImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
mainImage.backgroundColor = UIColor.yellow
mainImage.contentMode = .scaleAspectFit
view.addSubview(mainImage)
//: "Живой" UI
PlaygroundPage.current.liveView = view

let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!

func fetchImage() {

    let queue = DispatchQueue.global(qos: .utility)
    queue.async{
        if let data = try? Data(contentsOf: imageURL){
            DispatchQueue.main.async {
                mainImage.image = UIImage(data: data)
                 print("Show image data")
            }
            print("Did download  image data")
        }
    }
}
//fetchImage()

//: Замечание: Необходимо закомментировать предложение finishExecution чтобы посмотреть результат на main queue в отладочной области и включить Ассистента Редактора, если вы хотите увидеть UI
//PlaygroundPage.current.finishExecution()
//: Остановите Playground вручную, если вы комментируете finishExecution()


// Загрузка изображения с помощью DispatchWorkItem

func fetchImage2() {
    var data: Data?
    let queue = DispatchQueue.global(qos: .utility)
    
    let workItem = DispatchWorkItem { data = try? Data(contentsOf: imageURL) }
    
    // workItem.cancel()
    // workItem не исполняется
    
    queue.async(execute: workItem)
    
    workItem.notify(queue: DispatchQueue.main) {
        if let imageData = data {
            mainImage.image = UIImage(data: imageData)
        }
    }
}
//fetchImage2()

// Загрузка классическим способом

func fetchImage3() {
    let queue = DispatchQueue.global(qos: .utility)
    queue.async {
        if let data = try? Data(contentsOf: imageURL) {
            DispatchQueue.main.async {
                mainImage.image = UIImage(data: data)
            }
        }
    }
}
//fetchImage3()

// Загрузка с помощью ассинхронной функции URLSession

func fetchImage4() {
    
    let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
        if let imageData = data {
            DispatchQueue.main.async {
                print("Show image data")
                mainImage.image = UIImage(data: imageData)
            }
        }
    }
    
    task.resume()
}

//fetchImage4()

// асинхронная обертка синхронной операции - загрущзки изображения

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

// Загрузка изображения с помощью асинхронной обертки синхронной операции

func fetchImage5() {
    asyncLoadImage(imageURL: imageURL,
                   runQueue: DispatchQueue.global(),
                   completionQueue: DispatchQueue.main)
    { result, error in
        guard let image = result else { return }
        mainImage.image = image
    }
}
fetchImage5()
