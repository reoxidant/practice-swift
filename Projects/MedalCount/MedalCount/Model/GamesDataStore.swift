import Foundation

final class GamesDataStore {
  // MARK: - Properties
  let allGames: AllGames

  // MARK: - Initializers
  init() {
    let path = Bundle.main.path(forResource: "GamesData", ofType: "plist")!
    let data = FileManager.default.contents(atPath: path)!
    let decoder = PropertyListDecoder()
    allGames = try! decoder.decode(AllGames.self, from: data)
  }
}
