//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

public class ThreadSafeString {
    private var internalString = ""
    
    let isolationQueue = DispatchQueue(label:"com.vshapovalov.isolation",
                                       attributes: .concurrent)
    
    public func addString(string: String) {
        isolationQueue.async(flags: .barrier) {
            self.internalString = self.internalString + string
        }
    }
    public func setString(string: String) {
        isolationQueue.async(flags: .barrier) {
            self.internalString = string
        }
    }
    
    public init (_ string: String){
        isolationQueue.async(flags: .barrier) {
            self.internalString = string
        }
    }
    
    public var text: String {
        var result = ""
        isolationQueue.sync {
            result = self.internalString
        }
        return result
    }
}

public class QueuesView: UIView {
    
    public var labels: [UILabel] = [UILabel]()
    public var labels_: [UILabel] = [UILabel]()
    public var numberLines = 0 { didSet{ updateUI() } }
    public var step = 30
    
    func updateUI() {
        print (numberLines)
        for i in 0 ..< numberLines {
            let label = UILabel(frame: CGRect(x: 10, y: 20 + 50 * i, width: Int(self.bounds.size.width), height: 20))
            label.text = ""
            labels.append (label)
            self.addSubview(label)
            
            let label_ = UILabel(frame: CGRect(x: 0, y: 50 * i, width: Int(self.bounds.size.width), height: 20))
            label_.text = ""
            label_.textColor = UIColor.blue
            labels_.append(label_)
            self.addSubview(label_)
        }
    }
    
    public override init (frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }
    
   public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

public func duration(_ block: () -> ()) -> TimeInterval {
    let startTime = Date()
    block()
    return Date().timeIntervalSince(startTime)
}

var view = QueuesView(frame: CGRect(x: 0, y: 0, width: 600, height: 500))
view.numberLines = 10
view.backgroundColor = UIColor.lightGray

view.labels_[0].text  =  "     СИНХРОННОСТЬ  global (qos: .userInitiated) к playground"
view.labels_[1].text  =  "     АСИНХРОННОСТЬ  global (qos: .userInitiated) к playground"
view.labels_[2].text  =  "     СИНХРОННОСТЬ   .serial  к playground"
view.labels_[3].text  =  "     АСИНХРОННОСТЬ  .serial  к playground"
view.labels_[4].text  =  "     .serial Q1 - .userInitiated "
view.labels_[5].text  =  "     .serial     Q1 - .userInitiated Q2 - .background"
view.labels_[6].text  =  "     .concurrent Q - .userInitiated"
view.labels_[7].text  =  "     .concurrent Q1 - .userInitiated  Q2 - .background"
view.labels_[8].text  =  "     .concurrent Q1 - .userInitiated Q2 - .background asyncAfter (0.0)"
view.labels_[9].text  =  "     .concurrent Q1 - .userInitiated Q2 - .background asyncAfter (0.1)"

// Глобальная  concurrent.userInitiated dispatch queue

let userQueue = DispatchQueue.global(qos: .userInitiated)

// Некоторые задания:

var safeString = ThreadSafeString("")
var usualString = ""

func task(_ symbol: String) {
    for i in 1...10 {
        print("\(symbol) \(i) приоритет = \(qos_class_self().rawValue)")
        safeString.addString(string: symbol)
        usualString = usualString + symbol
    }
}

func taskHIGH(_ symbol: String) {
    print("\(symbol) HIGH приоритет = \(qos_class_self().rawValue)")
    safeString.addString(string: symbol)
    usualString = usualString + symbol
}

let highPriorityItem = DispatchWorkItem (qos: .userInteractive, flags: [.enforceQoS]){
    taskHIGH("🌺")
}

// Синхронность и асинхронность

print("---------------------------------------------------")
print("   СИНХРОННОСТЬ sync и АСИНХРОННОСТЬ async")
print("         Q1 - Global .concurrent qos = .userInitiated")
print("         Q2 - Global .concurrent qos = .background")
print("---------------------------------------------------")

safeString.setString(string: "")
usualString = ""

let mySerialQueue = DispatchQueue(label: "com.vshapovalov.mySerial")
let mySerialPriorityQueue = DispatchQueue(label: "com.vshapovalov.serialPriority", qos: .userInitiated)

let myGoodQueue = DispatchQueue(label: "com.vshapovalov.good", qos: .userInitiated)
let myBadQueue = DispatchQueue(label: "com.vshapovalov.bad", qos: .background)

let workerQueue = DispatchQueue(label: "com.vshapovalov.worker_concurrent", qos: .userInitiated, attributes: .concurrent)

let workerQueue1 = DispatchQueue(label: "com.vshapovalov.worker_concurrent1", qos: .userInitiated, attributes: .concurrent)
let workerQueue2 = DispatchQueue(label: "com.vshapovalov.worker_concurrent2", qos: .background, attributes: .concurrent)

let result = duration {
    
    // Совпадают
    //userQueue.sync { task("😀") }
    // task("👿")
    
    // Не совпадают
    //userQueue.async { task("😀") }
    // task("👿")
    
    // Совпадают
    // mySerialQueue.sync { task("😀") }
    // task("👿")
    
    // Не совпадают
    // mySerialQueue.async { task("😀") }
    // task("👿")
    
    // Результаты совпадают
    // mySerialPriorityQueue.async { task("😀") }
    // mySerialPriorityQueue.async { task("👿") }
    
    // Результаты не совпадают
    // myGoodQueue.async { task("😀") }
    // myBadQueue.async { task("👿") }
    
    // Результаты не совпадают
    // workerQueue.async { task("😀") }
    // workerQueue.async { task("👿") }
    
    // Результаты не совпадают
    // workerQueue1.async { task("😀") }
    // workerQueue2.async { task("👿") }
    // workerQueue1.async(execute: highPriorityItem)
    // workerQueue2.async(execute: highPriorityItem)
    
    // Результаты не совпадают
    // workerQueue2.asyncAfter(deadline: .now() + 0.0, qos: .userInteractive) { task("👿") }
    // workerQueue1.async { task("😀") }
    // workerQueue2.async(execute: highPriorityItem)
    // workerQueue1.async(execute: highPriorityItem)
    
    // Результаты не совпадают тк задания разнесены во времени.
    workerQueue2.asyncAfter(deadline: .now() + 0.1, qos: .userInteractive) { task("👿") }
    workerQueue1.async { task("😀") }
    workerQueue2.async(execute: highPriorityItem)
    workerQueue1.async(execute: highPriorityItem)
}

sleep(1)

print("    threadSafe \(safeString.text)")
print("not threadSafe \(usualString)")
