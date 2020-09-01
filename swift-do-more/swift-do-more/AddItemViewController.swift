//
//  AddItemViewController.swift
//  swift-do-more
//
//  Created by Виталий Шаповалов on 21.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

protocol addItemViewControllerDelegate: class{
    func addItemViewControllerDidCancel(
        _ controller: AddItemViewController
    )
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: checkListItem)
}

class AddItemViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        textField.delegate = self
    }
    
    @IBOutlet weak var cancelActionBtn: UIBarButtonItem!
    @IBOutlet weak var doneActionBtn: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: addItemViewControllerDelegate?

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
}
