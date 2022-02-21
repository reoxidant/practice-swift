import UIKit

final class MedalCountViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var medalCountStackView: UIStackView!
  @IBOutlet var countryFlags: [UIImageView]!
  @IBOutlet var countryNames: [UILabel]!
  @IBOutlet var countryGolds: [UILabel]!
  @IBOutlet var countrySilvers: [UILabel]!
  @IBOutlet var countryBronzes: [UILabel]!

  // MARK: - Properties
  var medalWinners: [MedalWinner]!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    for (index, winner) in medalWinners.enumerated() {
      countryFlags[index].image = winner.flagImage
      countryNames[index].text = winner.country
      countryGolds[index].text = winner.goldString
      countrySilvers[index].text = winner.silverString
      countryBronzes[index].text = winner.bronzeString
    }

    setupGestureRecognizers()
  }
}

// MARK: - Private
private extension MedalCountViewController {
  func setupGestureRecognizers() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
    view.addGestureRecognizer(tapRecognizer)
  }
}

// MARK: - GestureRecognizerSelectors
private extension MedalCountViewController {
  @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
    dismiss(animated: true)
  }
}
