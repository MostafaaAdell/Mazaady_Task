//
//  UIViewController+Extension.swift
//  Mazaady Task
//
//  Created by Mustafa on 13/01/2024.
//

import UIKit

extension UIViewController{
    
    
    // MARK: - CustomLoadingIndicator
    var isLoadingIndicatorAnimating: Bool {
        set {
            //            if newValue {
            //                let customLoadingIndicator = CustomLoadingIndicator(customAnimation: "loading_4")
            //                customLoadingIndicator.addLoadingIndicator(to: self.view)
            //            } else {
            //                view.subviews.first(where: { $0 is CustomLoadingIndicator })?.removeFromSuperview()
            //            }
        }
        get {
            
            //    view.subviews.contains(where: { $0 is CustomLoadingIndicator })
            
            return true
            
        }
        
        
        
    }
    
    
    
}
