import Foundation

let concurrentQueue = DispatchQueue(label: "ru.vshapovalov.concurrent-queue", attributes: .concurrent)

let workItem = DispatchWorkItem {
  print("workItem: zzzZZZ")
  sleep(3)
  print("workItem: awaked")
}

concurrentQueue.async(flags: .barrier) {
  print("barrier: zzzZZZ")
  sleep(3)
  print("barrier: awaked")
}

concurrentQueue.async(execute: workItem)
