//
//  ViewController.swift
//  Sun_Exchange
//
//  Created by onedata on 27/06/19.
//  Copyright © 2019 onedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        enterPassword.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }


}

