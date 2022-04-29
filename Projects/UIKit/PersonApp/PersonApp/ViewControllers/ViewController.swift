//
//  ViewController.swift
//  PersonApp
//
//  Created by hutzo on 13.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "userScreen" else { return }
        guard let tabBarController = segue.destination as? UITabBarController,
              let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = user.username
            }
            
            if let navController = viewController as? UINavigationController,
               let aboutMeVC = navController.topViewController as? AboutMeViewController {
                aboutMeVC.navigationController?.title = user.person.fullname
                aboutMeVC.navigationItem.title = user.person.fullname
            }
            
        }
    }

    @IBAction func forgotUsernameTap() {
        showAlert(title: "Oops!", message: "Your name is \(user.username) 😉")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
    
    @IBAction func logIn() {
        
        let correctedUsername = usernameTextField.text == user.username
        let correctedPassword = passwordTextField.text == user.password
        
        if correctedUsername && correctedPassword {
            performSegue(withIdentifier: "userScreen", sender: nil)
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logIn()
        }
        
        return false
    }
}
