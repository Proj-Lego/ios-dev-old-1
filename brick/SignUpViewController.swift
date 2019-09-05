//
//  SignUpViewController.swift
//  brick
//
//  Created by Abhinav Pottabathula on 9/5/19.
//  Copyright © 2019 lego. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var profileField: UITextField!
    @IBOutlet weak var birthdateField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        phoneNumField.delegate = self
//        firstNameField.delegate = self
//        lastNameField.delegate = self
//        emailField.delegate = self
//        profileField.delegate = self
//        birthdateField.delegate = self
//        passwordField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func submitPress(_ sender: Any) {
        print(phoneNumField.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
