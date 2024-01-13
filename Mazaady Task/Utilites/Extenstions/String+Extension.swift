//
//  String+Extension.swift
//  Mazaady Task
//
//  Created by Mustafa on 13/01/2024.
//

import Foundation
import SwiftyMenu


extension String:SwiftyMenuDisplayable {
    
    public var displayableValue: String{
        
        return self
    }
    
    public var retrievableValue: Any{
        
        return self
    }
    
    
}
