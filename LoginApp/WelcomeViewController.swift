//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Mac on 14/08/2022.
//  Copyright © 2022 Russel. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var welcomeLabel: UILabel!
    
    // MARK: - Public Properties
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "User")!"
    }
 
}
