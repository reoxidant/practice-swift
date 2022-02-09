import Foundation

// let serialQueue = DispatchQueue(label: "ru.vshapovalov.serial-queue")

// let workItem1 = DispatchWorkItem {
//   print("workItem1: zzzZZZ")
//   sleep(3)
//   print("workItem1: awaked")
// }

// let workItem2 = DispatchWorkItem {
//   print("workItem2: zzzZZZ")
//   sleep(3)
//   print("workItem2: awaked")
// }

// let group = DispatchGroup()

// serialQueue.async(group: group, execute: workItem1)
// serialQueue.async(group: group, execute: workItem2)

// group.notify(queue: DispatchQueue.main) {
//   print("All tasks on group completed")
// }

// group.wait()

// Enter and leave

let concurrentQueue = DispatchQueue(label: "ru.vshapovalov.concurren-queue", attributes: .concurrent)

let group2 = DispatchGroup()

let workItem3 = DispatchWorkItem {
  print("workItem3: zzzZZZ")
  sleep(3)
  print("workItem3: awaked")

  group2.leave()
}

let workItem4 = DispatchWorkItem {
  print("workItem4: zzzZZZ")
  sleep(3)
  print("workItem4: awaked")

  group2.leave()
}

group2.enter()
concurrentQueue.async(execute: workItem3)

group2.enter()
concurrentQueue.async(execute: workItem4)

group2.wait()

print("All tasks on group2 completed")
