//
//  fcollectionRefrance.swift
//  reasala2
//
//  Created by Michael on 26/07/2021.
//

import Foundation
import Firebase


enum fcollectionRefrance : String{
    
    case User
}

func firebaseCollection(_ collection:fcollectionRefrance)-> CollectionReference{
    
    return Firestore.firestore().collection(collection.rawValue)
    
}
