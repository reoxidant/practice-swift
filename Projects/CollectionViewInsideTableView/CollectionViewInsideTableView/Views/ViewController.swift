//
//  ViewController.swift
//  CollectionViewInsideTableView
//
//  Created by Виталий Шаповалов on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var colorsArray = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the xib for tableview cell
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "tableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorsArray.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.objectsArray[section].subcategory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = colorsArray.objectsArray[section].category
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? TableViewCell {
            // Show SubCategory Title
            let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
            
            cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]
            
            // Set cell's delegate
            cell.cellDelegate = self
            
            // Pass the data to collectionView inside the tableViewCell
            let rowArray = colorsArray.objectsArray[indexPath.section].colors[indexPath.row]
            
            cell.updateCellWith(row: rowArray)
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: CollectionViewCellDelegate {
    func collectionView(collectionViewCell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
//        if let colorsRow = didTappedInTableViewCell.rowWithColors {
//            print("You tapped the cell \(index) in the row of colors \(colorsRow)")
//        }
        
        let color = didTappedInTableViewCell.rowWithColors?[index].color
        
        let detailsViewController = DetailsViewController()
        detailsViewController.backgroundColor = color
        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
