//
//  ViewController.swift
//  reasala2
//
//  Created by Michael on 19/07/2021.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        rejesterOutlet.layer.cornerRadius = 20
        
        emailLabel.text="Email"
        passwordLabel.text="Password"
        confirmpasswordLabel.text="ConfirmPassword"
//        emailTextfield.delegate = self
//        passwordTextfield.delegate = self
//        ConfirmPasswordTextfield.delegate = self
        tapgester()    }

    //MARK:- IBOutlet
   
    //label
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmpasswordLabel: UILabel!
    @IBOutlet weak var haveanAccount: UILabel!
    
   
    //textField
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var ConfirmPasswordTextfield: UITextField!
    
    
    //Button Outlet
    
    @IBOutlet weak var resendemailOutlet: UIButton!
    @IBOutlet weak var forgetPasswordOutlet: UIButton!
    @IBOutlet weak var rejesterOutlet: UIButton!
    @IBOutlet weak var loginOutlet: UIButton!
    
    //MARK:- varabiles
    var islogin :Bool = false

    //MARK:- IBAction
    
    //Button
  
    @IBAction func ResendEmailpress(_ sender: UIButton) {
        print("jjjjjjj")
    }
    
    
    @IBAction func ForgetPasswordpress(_ sender: UIButton) {
        if isDataInputedfor(mode:"ForgetPassword"){
            print ("Correct")
            //TODO:-
            
        }    else {
            ProgressHUD.showError("user name or email is required")
                
                
            }   }
    
    
 
    
    @IBAction func Rejesterpress(_ sender: UIButton) {
        if isDataInputedfor(mode: islogin ? "Login" :"Rejester"){
            print ("Correct")
            //TODO :- login or rejester
            
        }    else {
                print ("all is required")
            ProgressHUD.showError("ALL Fields are reuired")
                
            }
        
        
        
        
        
    }
    @IBAction func loginpress(_ sender: UIButton) {
        updateUImood(mode: islogin)
        
    }
    
    private func updateUImood(mode:Bool){
        if !mode {
            titleLabel.text = "Login"
            ConfirmPasswordTextfield.isHidden=true
            confirmpasswordLabel.isHidden=true
            passwordTextfield.text = ""
            emailTextfield.text = ""
            rejesterOutlet.setTitle("Login", for: .normal)
            
            loginOutlet.setTitle("Rejester", for: .normal)
            haveanAccount.text = "New here"
            resendemailOutlet.isHidden = true
            
            forgetPasswordOutlet.isHidden = false
        }
        else{
            titleLabel.text = "Rejesteration"
            ConfirmPasswordTextfield.isHidden=false
            confirmpasswordLabel.isHidden=false
            passwordTextfield.text = ""
            emailTextfield.text = ""
            rejesterOutlet.setTitle("Rejester", for: .normal)
            loginOutlet.setTitle("Login", for: .normal)
            haveanAccount.text = "Have an account"
            resendemailOutlet.isHidden = false
            forgetPasswordOutlet.isHidden = true
           
        }
        
        islogin.toggle()
    }
    
    
    
    
    //MARK:- Helper
    
    private func isDataInputedfor(mode : String)->Bool{
        switch mode {
        case"Login":
            return emailTextfield.text != "" && passwordTextfield.text != ""
        case  "Rejester":
            return emailTextfield.text != "" && passwordTextfield.text != "" && ConfirmPasswordTextfield.text != ""
        case "ForgetPassword":
        return emailTextfield.text != ""
        
        default:
            return false
        }
        
        
    }

    //MARK:- Tap gester recognizer
    
    private func tapgester(){
        
        let tapges = UITapGestureRecognizer(target: self, action: #selector(Hidegester))
        view.addGestureRecognizer(tapges)
    }

    @objc func Hidegester(){
        view.endEditing(false)
        
    }
    
    
}

//extension LoginViewController :UITextFieldDelegate{
//
//
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        emailLabel.text = emailTextfield.hasText ? "Email" : ""
//
//        passwordLabel.text = passwordTextfield.hasText ? "Password": ""
//        confirmpasswordLabel.text = ConfirmPasswordTextfield.hasText ?"ConfirmPassword":""
//    }
//
//
//}
