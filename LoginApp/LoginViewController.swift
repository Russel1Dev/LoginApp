//
//  ViewController.swift
//  LoginApp
//
//  Created by Mac on 14/08/2022.
//  Copyright © 2022 Russel. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let userName = "Ruslan"
    private let password = "Swift"
    
    // MARK: - Public Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "logIn" else { return }
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTextField.text
    }
    
    // MARK: - IB Actions
    @IBAction func logInButton() {
        guard
            userNameTextField.text == userName,
            passwordTextField.text == password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
            return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Oops!",
                  message: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Oops!",
                  message: "Your password is \(password)")
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}
    // MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = nil }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

