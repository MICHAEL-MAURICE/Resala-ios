//
//  Fuserlistner.swift
//  reasala2
//
//  Created by Michael on 26/07/2021.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
class Fuserlistner {
    static let shared = Fuserlistner();
    
    private init(){}
    
    
    //MARK:- Login
    
    func LoginEmail(email:String,password:String,completion: @escaping (_ error:Error?, _ isEmailverified:Bool)->Void){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil && authResult!.user.isEmailVerified
            {
                completion(error ,true)
                self.downloadUserFromFirestore(authResult!.user.uid)
                
            }else{
                
                completion(error,false)
                
            }
        }
        
        
        
        
    }
    
    
    //MARK:- Rejester
    
    func RejesterEmail(email:String,password:String,completion : @escaping (_ error:Error?)-> Void )  {
        Auth.auth().createUser(withEmail: email, password: password) {[self] (authResult, error) in
            completion(error)
            if error != nil{
                authResult?.user.sendEmailVerification(completion:{ error in
                    completion(error)
                    //print(error?.localizedDescription)
                })
                
                
            }
            if authResult?.user != nil{
                
             let user =   User(Id:authResult!.user.uid, userName:email, email: email, pushId: "", avatarLink: "", status: "HEYYY")
                
                
                self.saveuserToFirestore(user)
                samveDataLocally(user)
            }
            
            
            
        }    }
    
    
    
    //MARK:- Resend Email Verification
    
    
    func resendEmailVerification (email:String , completion: @escaping ( _ error:Error?)->Void)  {
        Auth.auth().currentUser?.reload(completion: { error in
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                completion(error)
            })
        })
    }

    //MARK:- Reset Password
    
    
    func resetPassword(_ email:String, completion: @escaping (_ error:Error?)->Void)  {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }

    
//    private func usermap(user:User) -> [String:String] {
//        return["Id":user.Id,"username":user.userName,"email":user.email,"pushId":user.pushId,"avatarLink":user.avatarLink,"status":user.status]
//    }

  private func saveuserToFirestore(_ user:User)  {
    do{
        try   firebaseCollection(.User).addDocument(from: user.Id )
            .setData(from: user)    } catch{
        print(error.localizedDescription)
    }

  }
    
    //MARK:- downloadUserFromFirestore

    
    private func downloadUserFromFirestore(_ userId:String){
        
        firebaseCollection(.User).document(userId).getDocument{ (document, error) in
        
        
            guard document != nil  else {
                
                print("Error , no Data found")
                return
            }
            let result = Result{
            try document?.data(as: User.self)
            }
            
            switch(result){
            
            case.success(let userObject):
                if let user = userObject{
                    samveDataLocally(user)
                }else {
                    print("There is no data here")
                }
            case.failure(let error):
                print(error.localizedDescription)
            
            
            
            }
            
    }
    }
    
    
    
    
}
