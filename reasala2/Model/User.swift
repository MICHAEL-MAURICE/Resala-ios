//
//  User.swift
//  reasala2
//
//  Created by Michael on 23/07/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User : Codable{
    var Id = ""
    var userName :String
    var email : String
    var pushId = ""
    var avatarLink = ""
    var status : String
    
    
    
    
}
func samveDataLocally(_ user:User){
    
    let encoder = JSONEncoder()
    do{
        let data = try encoder.encode(user)
    
        KuserDefult.set(data, forKey: KcurrentUser)
        
    }catch{
        print(error.localizedDescription)
    }
}
