//
//  ItemTextFields.swift
//  Homepwner
//
//  Created by Łukasz Sokołowski on 03.07.2017.
//  Copyright © 2017 Łukasz Sokołowski. All rights reserved.
//

import UIKit

class ItemDetailTextField: UITextField {

     override func becomeFirstResponder() -> Bool {
        borderStyle = .bezel
        super.becomeFirstResponder()
        return true
    }
    
     override func resignFirstResponder() -> Bool {
        borderStyle = .roundedRect
        super.resignFirstResponder()
        return true
    }    
}
    
