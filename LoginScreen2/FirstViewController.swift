//
//  FirstViewController.swift
//  LoginScreen2
//
//  Created by LeeX on 4/19/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit
import AFNetworking
import Firebase
import FirebaseDatabase
import GoogleSignIn

class FirstViewController: UIViewController, GIDSignInUIDelegate {
    
    
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
        
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
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
        } else if segue.identifier == "SignIn" {
            let destination = segue.destination as! SecondViewController
            destination.text2nd = txtUser.text
        }
    }
    
    override func shouldPerformSegue(withIdentifier: String?, sender: Any?) -> Bool {
        if withIdentifier == "moveToSecondVC" {
            let alert = UIAlertController(title: "Wrong Username or Password", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            let alert1 = UIAlertController(title: "Missing Username or Password", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            for account in accounts {
                if (txtUser.text!.isEmpty || txtPass.text!.isEmpty) {
                    self.present(alert1, animated: true, completion: nil)
                    return false
                }
                else if (txtUser.text! != account["username"]! || txtPass.text! != account["password"]!) {
                    self.present(alert, animated: true, completion:nil)
                    return false
                }
                else {
                    return true
                }
            }
        }
        return true
    }
    
    @IBAction func SignIn(_ sender: Any) {
        
        let alert3 = UIAlertController(title: "Cannot Sign In", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
        alert3.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        if let email = txtUser.text, let password = txtPass.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "SignIn", sender: self)
                } else {
                    self.present(alert3, animated: true, completion:nil)
                }
            }
        }
    }
}
