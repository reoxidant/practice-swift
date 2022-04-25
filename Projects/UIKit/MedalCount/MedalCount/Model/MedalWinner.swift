import UIKit

struct MedalWinner: Codable {
  // MARK: - Properties
  let country: String
  let gold: Int
  let silver: Int
  let bronze: Int
}

// MARK: - Internal
extension MedalWinner {
  var flagImage: UIImage? {
    let imageName = country.lowercased().replacingOccurrences(of: " ", with: "_")
    return UIImage(named: imageName)
  }
  
  var goldString: String {
    return "\(gold)"
  }
  
  var silverString: String {
    return "\(silver)"
  }
  
  var bronzeString: String {
    return "\(bronze)"
  }
}
