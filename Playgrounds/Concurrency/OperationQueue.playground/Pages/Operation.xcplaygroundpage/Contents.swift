//: A UIKit based Playground for presenting user interface

import UIKit
import Accelerate
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Operation представляет собой задачу
// простейшая Operation используется только совместно c OperationQueue с помощью метода addOperation

let operation1 = {
    print("Operation 1 started")
    print("Operation 2 finished")
}

let queue = OperationQueue()
queue.addOperation(operation1)

// Полноценная Operation может быть сконструирована как BlockOperation или как пользовательский subclass Operation.

// Создаем BlockOperation для конкатенации двух строк

var result: String?

let concatenationOperation = BlockOperation {
    result = "💧" + "☂️"
    sleep(2)
}

duration {
    concatenationOperation.start()
}
result

// Создаем BlockOperation с можеством блоков:

let multiPrinter = BlockOperation()

multiPrinter.completionBlock = {
    print("Finished multiPrinting!")
}

multiPrinter.addExecutionBlock {  print("Каждый 🍎"); sleep(2) }
multiPrinter.addExecutionBlock {  print("Охотник 🍊"); sleep(2) }
multiPrinter.addExecutionBlock {  print("Желает 🍋"); sleep(2) }
multiPrinter.addExecutionBlock {  print("Знать 🍏"); sleep(2) }
multiPrinter.addExecutionBlock {  print("Где 💎"); sleep(2) }
multiPrinter.addExecutionBlock {  print("Сидит 🚙"); sleep(2) }
multiPrinter.addExecutionBlock {  print("Фазан 🍆"); sleep(2) }

duration {
    multiPrinter.start()
}

// Subclassing Operation

// Позволяет вам осуществлять большее управление над тем, что делает Operation

let inputImage = UIImage(named: "dark_road_small.jpg")

// DONE: Создайте и запустите  FilterOperation

class FilterOperation: Operation {
    
    var inputImage: UIImage?
    var outputImage: UIImage?
    
    override func main() {
        outputImage = filter(image: inputImage)
    }
    
    private func filter(image: UIImage?) -> UIImage? {
        guard let image = image else { return .none }
        sleep(1)
        let mask = topAndBottomGradient(size: image.size)
        return image.applyBlur(radius: 6, maskImage: mask)
    }
    
    private func filterAsync(image: UIImage?, callback: @escaping (UIImage?) ->()) {
        OperationQueue().addOperation {
            let result = self.filter(image: image)
            callback(result)
        }
    }
    
    private func topAndBottomGradient(size: CGSize, clearLocations: [CGFloat] = [0.35, 0.65], innerIntensity: CGFloat = 0.5) -> UIImage {
        
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpaceCreateDeviceGray(), bitmapInfo: CGImageAlphaInfo.none.rawValue)
        
        let colors = [
            .white,
            UIColor(white: innerIntensity, alpha: 1.0),
            .black,
            UIColor(white: innerIntensity, alpha: 1.0),
            .white
        ].map { $0.cgColor }
        
        let colorLocations : [CGFloat] = [0, clearLocations[0], (clearLocations[0] + clearLocations[1]) / 2.0, clearLocations[1], 1]
        
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceGray(), colors: colors as CFArray, locations: colorLocations)
        
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 0, y: size.height)
        
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions())
        let cgImage = context!.makeImage()
        
        return UIImage(cgImage: cgImage!)
    }
}

let filterOp = FilterOperation()
filterOp.inputImage = inputImage

duration {
  filterOp.start()
}
filterOp.inputImage
filterOp.outputImage

extension UIImage {
    
    public func applyBlur(radius: CGFloat, maskImage: UIImage? = nil) -> UIImage? {
        
        // Check pre-conditions.
        if (size.width < 1 || size.height < 1) {
            print("*** error: invalid size: \(size.width) x \(size.height). Both dimensions must be >= 1: \(self)")
            return nil
        }
        
        if self.cgImage == nil {
            print("*** error: image must be backed by a CGImage: \(self)")
            return nil
        }
        
        if maskImage != nil && maskImage!.cgImage == nil {
            print("*** error: maskImage must be backed by a CGImage: \(String(describing: maskImage))")
            return nil
        }
        
        let __FLT_EPSILON__ = CGFloat( Float.ulpOfOne)
        let screenScale = UIScreen.main.scale
        let imageRect = CGRect(origin: .zero, size: size)
        var effectImage = self
        
        let hasBlur = radius > __FLT_EPSILON__
        
        if hasBlur {
            func createEffectBuffer(context: CGContext) -> vImage_Buffer {
                let data = context.data
                let width = vImagePixelCount(context.width)
                let height = vImagePixelCount(context.height)
                let rowBytes = context.bytesPerRow
                
                return vImage_Buffer(data: data, height: height, width: width, rowBytes: rowBytes)
            }
            
            UIGraphicsBeginImageContextWithOptions(size, false, screenScale)
            let effectInContext = UIGraphicsGetCurrentContext()!
            
            effectInContext.scaleBy(x: 1.0, y: -1.0)
            effectInContext.translateBy(x: 0, y: -size.height)
            effectInContext.draw(self.cgImage!, in: imageRect)
            
            var effectInBuffer = createEffectBuffer(context: effectInContext)
            
            UIGraphicsBeginImageContextWithOptions(size, false, screenScale)
            let effectOutContext = UIGraphicsGetCurrentContext()!
            
            var effectOutBuffer = createEffectBuffer(context: effectOutContext)
            
            if hasBlur {
                
                let inputRadius = radius * screenScale
                var radius = UInt32(floor(Double(inputRadius * 0.75 * sqrt(2.0 * .pi) + 0.5)))
                if radius % 2 != 1 {
                    radius += 1 // force radius to be odd so that the three box-blur methodology works.
                }
                
                let imageEdgeExtendFlags = vImage_Flags(kvImageEdgeExtend)
                
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
            }
            
            effectImage = UIGraphicsGetImageFromCurrentImageContext()!
            
            UIGraphicsEndImageContext()
            UIGraphicsEndImageContext()
        }
        
        // Set up output context.
        UIGraphicsBeginImageContextWithOptions(size, false, screenScale)
        let outputContext = UIGraphicsGetCurrentContext()
        outputContext!.scaleBy(x: 1.0, y: -1.0)
        outputContext!.translateBy(x: 0, y: -size.height)
        
        // Draw base image.
        outputContext!.draw(self.cgImage!, in: imageRect)
        
        // Draw effect image.
        if hasBlur {
            outputContext!.saveGState()
            if let image = maskImage {
                let effectCGImage = effectImage.cgImage!.masking(image.cgImage!)
                if let effectCGImage = effectCGImage {
                    effectImage = UIImage(cgImage: effectCGImage)
                }
            }
            outputContext!.draw(effectImage.cgImage!, in: imageRect)
            outputContext!.restoreGState()
        }
        
        // Output image is ready.
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return outputImage
    }
}
