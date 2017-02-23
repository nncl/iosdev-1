//
//  ViewController.swift
//  iOSDev-class1
//
//  Created by Usuário Convidado on 22/02/17.
//  Copyright © 2017 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Variables
    
    @IBOutlet weak var tfUsername: UITextField!

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    // MARK: Functions
    
    override var canBecomeFirstResponder: Bool {
        return true //
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View loaded, lets create our delegates
         
        tfEmail.delegate = self // self is this class
        tfPassword.delegate = self
        
        // If you say you cut hair, prove me, so to be a tfPassword delegate, you must be a TextField Delegate
        // So extends UITextFieldDelegate
    }
    
    // When user touched the view, hide keyboard, but viewcontroller cannot be by default firstResponder, so
    // implement canBecomeFirstResponder
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder() // fot that, canBecomeFirstResponder
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToNextScreen() {
        print("Form validated")
    }
    
    /*@IBAction func textfieldDidBegin(_ sender: UITextField) {
        print("Start to edit")
    }*/

}

// To separete better
extension ViewController: UITextFieldDelegate {
    
    // Lets implement the methods. User pressed return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfUsername:
            // go to email field
            tfEmail.becomeFirstResponder()
        case tfEmail:
            // go to password field
            tfPassword.becomeFirstResponder()
        default:
            // hide keyboard
            tfPassword.resignFirstResponder()
            // go to next screen
            goToNextScreen()
        }
        
        return true
    }
    
    // If a user tries to get out from a field without entering data, do not quit
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return !textField.text!.isEmpty
    }
    
    // Change characters from a textfield? We add MASKS here
    // paramers: 1 = textfield, 2 = range w/ number of characters, length, position etc; remember about copy and paste, 3 = what is being typed
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
