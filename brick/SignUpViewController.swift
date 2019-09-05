//
//  SignUpViewController.swift
//  brick
//
//  Created by Abhinav Pottabathula on 9/5/19.
//  Copyright © 2019 lego. All rights reserved.
//

import UIKit
import AWSMobileClient

class SignUpViewController: UIViewController {

    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var profileField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumField.delegate = self
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        profileField.delegate = self
        passwordField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        profileField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @IBAction func submitPress(_ sender: Any) {
        AWSMobileClient.sharedInstance().signUp(username: phoneNumField.text!,
                                                password: passwordField.text!,
                                                userAttributes: ["email":emailField.text!, "phone_number": phoneNumField.text!,
                                                                 "birthdate":"2019-09-05", "name":firstNameField.text!,
                                                                 "family_name": lastNameField.text!, "profile":profileField.text!,
                                                                 "gender":"male", "updated_at":"1567672734", "picture":""]) { (signUpResult, error) in
                                                    if let signUpResult = signUpResult {
                                                        switch(signUpResult.signUpConfirmationState) {
                                                        case .confirmed:
                                                            print("\n\n\nUser is signed up and confirmed.")
                                                        case .unconfirmed:
                                                            print("\n\n\nUser is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                                                        case .unknown:
                                                            print("\n\n\nUnexpected case")
                                                        }
                                                    } else if let error = error {
                                                        if let error = error as? AWSMobileClientError {
                                                            switch(error) {
                                                            case .usernameExists(let message):
                                                                print(message)
                                                            default:
                                                                break
                                                            }
                                                        }
                                                        print(error)
                                                        print("\(error.localizedDescription)")
                                                    }
        }
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
