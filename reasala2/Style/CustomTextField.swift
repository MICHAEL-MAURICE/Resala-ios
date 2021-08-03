//
//  CustomTextField.swift
//  reasala2
//
//  Created by Michael on 29/07/2021.
//

import UIKit

class CustomTextField: UITextField {
    
    
    
    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
        layer.borderWidth = 1
        clipsToBounds = true
        placeholder = "HHHHH"
        
    }
    override func layoutSubviews() {
        //layer.cornerRadius = frame.size.height/2
        
        
    }
    
    
}
