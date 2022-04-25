import Foundation

struct Games: Codable {
  // MARK: - Properties
  let year: String
  let host: String
  let country: String
  let isSummer: Bool
  let medalWinners: [MedalWinner]

  var seasonYear: String {
    return "\(season.capitalized) \(year)"
  }

  var flagImageName: String {
    let name = country.lowercased().replacingOccurrences(of: " ", with: "_")
    return "\(name)_large"
  }

  private var season: String {
    return isSummer ? "summer" : "winter"
  }
}
