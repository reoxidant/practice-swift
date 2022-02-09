import Foundation

let serialQueue = DispatchQueue(label: "ru.vshapovalov.serial-queue")

let semaphore = DispatchSemaphore(value: 0)

serialQueue.async {
  sleep(5)

  print(123)

  semaphore.signal()
}

print("block")

semaphore.wait()

print("unblock")
