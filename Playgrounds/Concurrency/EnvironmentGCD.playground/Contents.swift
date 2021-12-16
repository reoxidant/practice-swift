//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreFoundation
import Darwin

//: Определяем бесконечное выполнение, чтобы предотвратить "выбрасывание" background tasks, когда работа на Playground будет закончена.

PlaygroundPage.current.needsIndefiniteExecution = true

//1. Глобальная последовательная (serial) main queue

let mainQueue = DispatchQueue.main

//2. Глобальная concurrent dispatch queues

let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let userQueue = DispatchQueue.global(qos: .userInitiated)
let utilityQueue = DispatchQueue.global(qos: .utility)
let backgroundQueue = DispatchQueue.global(qos: .background)

//==== Глобальная concurrent .default dispatch queue ====

let defaultQueue = DispatchQueue.global() // .default

// Задания:

func task(_ symbol: String) {
    for i in 1...10 {
        print("\(symbol) \(i) приоритет = \(qos_class_self().rawValue)")
    }
}

func taskHIGH(_ symbol: String) {
    print("\(symbol) HIGH приоритет = \(qos_class_self().rawValue)")
}

// Синхронность и ассинхронность

print("--------------------------")
print("----СИНХРОННОСТЬ sync----")
print("----Global .concurrent Q1 - .userInitiated----")
print("--------------------------")

userQueue.sync {
    task("😀")
}
task("😈")
sleep(2)

print("--------------------------")
print("----АСИНХРОННОСТЬ async----")
print("----Global .concurrent Q1 - .userInitiated----")
print("--------------------------")
userQueue.async {
    task("😀")
}
task("😈")

// Последовательная очередь mySerialQueue

let mySerialQueue = DispatchQueue(label: "com.vshapovalov.mySerial")

print("--------------------------")
print("----СИНХРОННОСТЬ sync----")
print("----Private .serial Q1 - no----")
print("--------------------------")

mySerialQueue.sync {
    task("😀")
}
task("😈")

print("--------------------------")
print("----АСИНХРОННОСТЬ async----")
print("----Private .serial Q1 - no----")
print("--------------------------")

mySerialQueue.async {
    task("😀")
}
task("😈")
sleep(1)

// Последовательная очередь с приоритетом

print("--------------------------")
print("----Private .serial Q1 - .userInitiated----")
print("--------------------------")

let serialPriorityQueue = DispatchQueue(label: "com.vshapovalov.serialPriority", qos: .userInitiated)
serialPriorityQueue.async {
    task("😀")
}
serialPriorityQueue.async {
    task("😈")
}
sleep(1)

// Последовательные очереди с разными приоритетами

print("--------------------------")
print("----Private .serial Q1 - .userInitiated----")
print("------------------- Q2 - .background-------")
print("--------------------------")

let serialPriorityQueue1 = DispatchQueue(label: "com.vshapovalov.serialPriority", qos: .userInitiated)
let serialPriorityQueue2 = DispatchQueue(label: "com.vshapovalov.serialPriority", qos: .background)
serialPriorityQueue2.async {
    task("😀")
}
serialPriorityQueue1.async {
    task("😈")
}
sleep(1)

// asyncAfter с изменением приоритета

print("-------------------------------------------")
print("----asyncAfter (.userInteractive) на Q2----")
print("----Private .serial Q1 - .utility----")
print("------------------- Q2 - .background-------")
print("-------------------------------------------")

let serialUtilityQueue = DispatchQueue(label: "com.vshapovalov.serialUtilityPriority", qos: .utility)
let serialBackgroundQueue = DispatchQueue(label: "com.vshapovalov.serialBackgroundPriority", qos: .background)

serialBackgroundQueue.asyncAfter(deadline: .now() + 0.1, qos: .userInteractive) {
    task("😈")
}
serialUtilityQueue.async {
    task("😀")
}
sleep(1)

// Параллельные Private очередь с приоритетом

print("-------------------------------------------")
print("Private .concurrent Q - .userInitiated")
print("-------------------------------------------")

let workerQueue = DispatchQueue(label: "com.vshapovalov.worker_concurrent", qos: .userInitiated, attributes: .concurrent)
workerQueue.async {
    task("😀")
}
workerQueue.async {
    task("😈")
}
sleep(2)


// Параллельные Private очереди с разными приоритетами

print("-------------------------------------------")
print("--------.concurrent Q1 - .utility----")
print("------------------- Q2 - .background-------")
print("-------------------------------------------")

let workerQueue1 = DispatchQueue(label: "com.vshapovalov.worker_concurrent1", qos: .userInitiated, attributes: .concurrent)
let workerQueue2 = DispatchQueue(label: "com.vshapovalov.worker_concurrent1", qos: .background, attributes: .concurrent)

workerQueue2.async {
    task("😀")
}

workerQueue1.async {
    task("😈")
}

sleep(1)

// Параллельная очередь с отложенным выполнением

print("-------------------------------------------")
print(" Параллельная очередь с отложенным выполнением")
print(" Private .concurrent Q - .userInitiated .initiallyInactive")
print("-------------------------------------------")


let workerDelayQueue = DispatchQueue(label: "com.vshapovalov.worker_concurrent", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive])

workerDelayQueue.async {
    task("😀")
}

workerDelayQueue.async {
    task("😈")
}

sleep(1)

print("-------------------------------------------")
print(" Выполнение заданий на параллелльной очереди")
print(" с отложенным выполнением")
print("-------------------------------------------")
workerDelayQueue.activate()
sleep(1)

// highPriorityItem = DispatchWorkItem

print("-------------------------------------------")
print(" .concurrent Q1 - userInitiated")
print("             Q2 - background")
print("-------------------------------------------")

let hightPriorityItem = DispatchWorkItem(qos: .userInteractive, flags: [.enforceQoS]) {
    taskHIGH("💋")
}

let hightPriorityItem2 = DispatchWorkItem(qos: .userInteractive) {
    taskHIGH("👄")
}

let workerQueue3 = DispatchQueue(label: "com.vshapovalov.concurrent2", qos: .userInitiated, attributes: .concurrent)
let workerQueue4 = DispatchQueue(label: "com.vshapovalov.concurrent2", qos: .background, attributes: .concurrent)

func duration(_ block: () -> ()) -> TimeInterval {
    let startTime = Date()
    block()
    return Date().timeIntervalSince(startTime)
}

let duration7 = duration {
    workerQueue3.async { task("😀") }
    workerQueue4.async { task("😈") }
    workerQueue4.async(execute: hightPriorityItem)
    workerQueue3.async(execute: hightPriorityItem)
    workerQueue4.async(execute: hightPriorityItem2)
    workerQueue3.async(execute: hightPriorityItem2)
}
sleep(1)
