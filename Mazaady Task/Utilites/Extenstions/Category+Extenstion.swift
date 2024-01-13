//
//  String+Extension.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation
import SwiftyMenu

extension Category:SwiftyMenuDisplayable {
    
    var displayableValue: String {
        return self.name
    }
    
    
    var retrievableValue: Any {
        return self.id
    }
    
}
