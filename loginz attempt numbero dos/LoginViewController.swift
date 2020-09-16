//
//  LoginViewController.swift
//  loginz attempt numbero dos
//
//  Created by Michael Osorio on 9/15/20.
//  Copyright © 2020 Michael Osorio. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
 
    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    @IBAction func createAccounttapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    func validateFields(){
        if email.text?.isEmpty == true{
            print("No Email Text")
            return
        }
        if password.text?.isEmpty == true{
            print("No Password Text")
            return
        }
        login()
    }
    func login() {
        let emailText = email.text! 
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self!.checkUserInfo()
        }
    }       
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
}
