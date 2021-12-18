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
    
    public var labels: [UILabel] = [UILabel] ()
    public var labels_: [UILabel] = [UILabel] ()
    public var numberLines = 0 {didSet{updateUI()}}
    public var step = 30
    
    func updateUI(){
        print (numberLines)
        for i in 0 ..< numberLines {
            let label = UILabel(frame: CGRect(x: 10, y: 20 + 50 * i, width: Int(self.bounds.size.width), height: 20))
            label.text = ""
            labels.append (label)
            self.addSubview(label)
            
            let label_ = UILabel(frame: CGRect(x: 0, y: 50 * i, width: Int(self.bounds.size.width), height: 20))
            label_.text = ""
            label_.textColor = UIColor.blue
            labels_.append (label_)
            self.addSubview(label_)
        }
    }
    
    public override init (frame: CGRect) {
        super.init (frame: frame)
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

// Синхронность и асинхронность

print("---------------------------------------------------")
print("   СИНХРОННОСТЬ  sync ")
print("         Q1 - Global .concurrent qos = .userInitiated")
print("---------------------------------------------------")

safeString.setString(string: "")
usualString = ""

let mySerialQueue = DispatchQueue(label: "com.vshapovalov.mySerial")
let duration0 = duration {
    
    // Совпадают
    //userQueue.sync { task("😀") }
    
    // Не совпадают
    //userQueue.async { task("😀") }
    
    // Совпадают
    mySerialQueue.async { task("😀") }
    
    task("👿")
}

sleep(1)

view.labels[0].text = safeString.text + String(Float(duration0))
print("    threadSafe \(safeString.text)")
print("not threadSafe \(usualString)")
