//
//  FirstViewController.swift
//  LoginScreen2
//
//  Created by LeeX on 4/19/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    @IBOutlet weak var txtUser: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    var accounts: [[String:String]] = [
        [ "username" : "huy",
          "password" : "1"
        ],
        
        [ "username" : "le",
          "password" : "2"
        ],
        
        [ "username" : "hoang",
          "password" : "3"
        ],
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDidClick(_ sender: Any) {
        

        
        
        let userInput = txtUser.text
        let passInput = txtPass.text
        
        for account in accounts {
            let username = account["username"]!
            let password = account["password"]!
        
            if (userInput == username && passInput == password) {
                self.performSegue(withIdentifier: "moveToSecondVC", sender: self)
            }
        }
        self.shouldPerformSegue(withIdentifier:"moveToSecondVC", sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToSecondVC" {
            let destination = segue.destination as! SecondViewController
            destination.text2nd = txtUser.text
        }
    }
    
    override func shouldPerformSegue(withIdentifier: String?, sender: Any?) -> Bool {
        if withIdentifier == "moveToSecondVC" {
            let alert = UIAlertController(title: "Something went wrong", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            for account in accounts {
                if (txtUser.text!.isEmpty || txtPass.text!.isEmpty || txtUser.text! != account["username"]! || txtPass.text! != account["password"]!) {
                    self.present(alert, animated: true, completion: nil)
                    return false
                }
                else {
                    return true
                }
            }
        }
        return true
    }
    
}
