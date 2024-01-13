//
//  EndPoints.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation


enum BaseURL {
    
    
    static private let baseURL = "https://staging.mazaady.com/api/v1/"
    static var subCategoryId = 0
    static var optionChildId = 0
    
    case getAllCategory
    case subCategory
    case optionChild
    
    var endpoint:String {
        
        switch self {
            
        case .getAllCategory: return "\(BaseURL.baseURL)get_all_cats"
            
        case .subCategory: return "\(BaseURL.baseURL)properties?cat=\(BaseURL.subCategoryId)"
            
        case .optionChild: return "\(BaseURL.baseURL)get-options-child/\(BaseURL.optionChildId)"
        }
        
        
    }
    
}
