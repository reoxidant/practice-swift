//
//  ProductListTableViewController.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 29.12.2021.
//

import UIKit

class ProductListTableViewController: UITableViewController {
    
    private var viewModel: ProductListViewModelProtocol! {
        didSet {
            viewModel.fetchProducts {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ProductListViewModel()
        tableView.rowHeight = 100
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailProductViewController else { return }
        detailVC.viewModel = sender as? DetailProductViewModelProtocol
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.productsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductTableViewCell {
            cell.viewModel = self.viewModel.getCellViewModel(at: indexPath)
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewModel = viewModel.viewModelForSelectedRow(at: indexPath)
        performSegue(withIdentifier: "detailProductSegue", sender: detailViewModel)
    }
}

extension ProductListTableViewController {
    func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .systemIndigo
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}

