import UIKit

protocol GamesTableViewControllerDelegate: AnyObject {
  func gamesTableViewController(controller: GamesTableViewController, didSelectGames selectedGames: Games)
}

final class GamesTableViewController: UITableViewController {
  // MARK: - Properties
  weak var delegate: GamesTableViewControllerDelegate?
  var gamesArray: [Games]!
}

// MARK: - UITableViewDataSource
extension GamesTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gamesArray.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GamesCell", for: indexPath) as! GamesTableViewCell

    let games = gamesArray[indexPath.row]
    cell.hostLabel.text = games.host
    cell.yearLabel.text = games.year
    cell.logoImageView.image = UIImage(named: games.flagImageName)

    return cell
  }
}

// MARK: - UITableViewDelegate
extension GamesTableViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedGames = gamesArray[indexPath.row]
    delegate?.gamesTableViewController(controller: self, didSelectGames: selectedGames)
  }
}
