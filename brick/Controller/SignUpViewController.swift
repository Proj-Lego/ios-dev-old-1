//
//  SignUpViewController.swift
//  brick
//
//  Created by Abhinav Pottabathula on 9/5/19.
//  Copyright © 2019 lego. All rights reserved.
//

import UIKit
import AWSMobileClient

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var profileField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var phoneNum1: UITextField!
    @IBOutlet weak var phoneNum2: UITextField!
    @IBOutlet weak var phoneNum3: UITextField!
    @IBOutlet weak var phoneNum4: UITextField!
    @IBOutlet weak var phoneNum5: UITextField!
    @IBOutlet weak var phoneNum6: UITextField!
    @IBOutlet weak var phoneNum7: UITextField!
    @IBOutlet weak var phoneNum8: UITextField!
    @IBOutlet weak var phoneNum9: UITextField!
    @IBOutlet weak var phoneNum10: UITextField!
    
    @IBOutlet weak var phoneNextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        phoneNumField.delegate = self
//        firstNameField.delegate = self
//        lastNameField.delegate = self
//        emailField.delegate = self
//        profileField.delegate = self
//        passwordField.delegate = self
        // Do any additional setup after loading the view.
        phoneNum1.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum2.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum3.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum4.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum5.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum6.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum7.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum8.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum9.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        phoneNum10.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        phoneNum1.tintColor = UIColor.clear
        phoneNum2.tintColor = UIColor.clear
        phoneNum3.tintColor = UIColor.clear
        phoneNum4.tintColor = UIColor.clear
        phoneNum5.tintColor = UIColor.clear
        phoneNum6.tintColor = UIColor.clear
        phoneNum7.tintColor = UIColor.clear
        phoneNum8.tintColor = UIColor.clear
        phoneNum9.tintColor = UIColor.clear
        phoneNum10.tintColor = UIColor.clear
        
        self.phoneNextBtn.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneNum1.becomeFirstResponder()
    }
    
    @objc func textDidChange(textField: UITextField) {
        let text = textField.text
        
        if text?.utf16.count == 1 {
            switch textField {
            case phoneNum1:
                phoneNum2.becomeFirstResponder()
                break
            case phoneNum2:
                phoneNum3.becomeFirstResponder()
                break
            case phoneNum3:
                phoneNum4.becomeFirstResponder()
                break
            case phoneNum4:
                phoneNum5.becomeFirstResponder()
                break
            case phoneNum5:
                phoneNum6.becomeFirstResponder()
                break
            case phoneNum6:
                phoneNum7.becomeFirstResponder()
                break
            case phoneNum7:
                phoneNum8.becomeFirstResponder()
                break
            case phoneNum8:
                phoneNum9.becomeFirstResponder()
                break
            case phoneNum9:
                phoneNum10.becomeFirstResponder()
                break
            case phoneNum10:
                phoneNum10.resignFirstResponder()
                self.phoneNextBtn.isHidden = false
                break
            default:
                break
            }
        }
        if text?.utf16.count == 0 {
            self.phoneNextBtn.isHidden = true
            switch textField {
            case phoneNum1:
                break
            case phoneNum2:
                phoneNum1.becomeFirstResponder()
                break
            case phoneNum3:
                phoneNum2.becomeFirstResponder()
                break
            case phoneNum4:
                phoneNum3.becomeFirstResponder()
                break
            case phoneNum5:
                phoneNum4.becomeFirstResponder()
                break
            case phoneNum6:
                phoneNum5.becomeFirstResponder()
                break
            case phoneNum7:
                phoneNum6.becomeFirstResponder()
                break
            case phoneNum8:
                phoneNum7.becomeFirstResponder()
                break
            case phoneNum9:
                self.phoneNextBtn.isHidden = true
                phoneNum8.becomeFirstResponder()
                break
            case phoneNum10:
                phoneNum9.becomeFirstResponder()
                break
            default:
                break
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        phoneNumField.resignFirstResponder()
//        firstNameField.resignFirstResponder()
//        lastNameField.resignFirstResponder()
//        emailField.resignFirstResponder()
//        profileField.resignFirstResponder()
//        passwordField.resignFirstResponder()
    }
    
    @IBAction func phoneNumberButtonPress(_ sender: Any) {
        // TODO implement dynamic country code
        let phoneNumber = "+1" + phoneNum1.text! + phoneNum2.text! + phoneNum3.text! + phoneNum4.text! + phoneNum5.text! + phoneNum6.text! + phoneNum7.text! + phoneNum8.text! + phoneNum9.text! + phoneNum10.text!
        
        // TODO validate phoneNumber format
        
        // generatedPass =
        AWSMobileClient.sharedInstance().signUp(username: phoneNumber,
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

class NameViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var nameNextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstName.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        lastName.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.nameNextBtn.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func textDidChange(textField: UITextField) {
        if firstName.text?.count ?? "".count > 0 && lastName.text?.count ?? "".count > 0 {
            self.nameNextBtn.isHidden = false
        } else {
            self.nameNextBtn.isHidden = true
        }
    }
}

class EmailViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailField.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.emailNextButton.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func textDidChange(textField: UITextField) {
        // TODO validate email format
        
        if emailField.text?.count ?? "".count > 0 {
            self.emailNextButton.isHidden = false
        } else {
            self.emailNextButton.isHidden = true
        }
    }
}
