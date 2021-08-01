//
//  Fuserlistner.swift
//  reasala2
//
//  Created by Michael on 26/07/2021.
//

import Foundation
import Firebase
class Fuserlistner {
    static let shared = Fuserlistner();
    
    private init(){}
    
    
    //MARK:- Login
    
    func LoginEmail(email:String,password:String,completion: @escaping (_ error:Error?, _ isEmailverified:Bool)->Void){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil && authResult!.user.isEmailVerified{
                completion(error ,true)
                
                
            }else{
                
                completion(error,false)
                
            }
        }
        
        
        
        
    }
    
    
    //MARK:- Rejester
    
    func RejesterEmail(email:String,password:String)  {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil{
                authResult!.user.sendEmailVerification { error in
                    print(error?.localizedDescription)
                }
                
                
            }
            if authResult?.user != nil{
                
             let user =   User(Id:authResult!.user.uid, userName:email, email: email, pushId: "", avatarLink: "", status: "HEYYY")
                
                
                self.saveuserToFirestore(user)
            }
            
            
            
        }    }
    
    private func usermap(user:User) -> [String:String] {
        return["Id":user.Id,"username":user.userName,"email":user.email,"pushId":user.pushId,"avatarLink":user.avatarLink,"status":user.status]
    }

  private func saveuserToFirestore(_ user:User)  {
    do{
   try   firebaseCollection(.User).addDocument(data:["UserId":user.Id] )
    .setData(usermap(user: user))    } catch{
        print(error.localizedDescription)
    }

  }
    
}
