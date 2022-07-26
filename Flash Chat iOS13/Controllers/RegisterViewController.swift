//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var emailTextfield: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  @IBAction func registerPressed(_ sender: UIButton) {
    
    // Si email y password son distintos a null
    if let email = emailTextfield.text, let password = passwordTextfield.text {
      
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        // Si hay error lo muestro, sino me muevo a la pantalla correspondiente
        if let e = error {
          print(e)
        } else {
          //Navigate to the ChatViewController
          self.performSegue(withIdentifier: K.registerSegue, sender: self)
        }
      }
    }
  }
}
