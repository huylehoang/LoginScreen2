//
//  SecondViewController.swift
//  LoginScreen2
//
//  Created by LeeX on 4/19/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtUser2: UITextField!
    var text2nd:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUser2.text = text2nd
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBack(_ sender: Any) {
        print("Back")
    }
    
    
}
