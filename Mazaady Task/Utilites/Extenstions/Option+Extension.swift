//
//  Option+Extension.swift
//  Mazaady Task
//
//  Created by Mustafa on 13/01/2024.
//

import Foundation
import SwiftyMenu

extension Option:SwiftyMenuDisplayable{
    
    public var displayableValue: String{
        return self.name
    }
    
    public var retrievableValue: Any{
        return self.id
    }
    
}
