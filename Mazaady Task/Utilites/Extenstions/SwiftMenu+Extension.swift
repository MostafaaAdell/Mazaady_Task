//
//  SwiftMenu+Extension.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation
import SwiftyMenu


extension SwiftyMenu{
    
    
    func setConstraint(to view:UIView,topMargin:CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false

        let horizontalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)

        let topConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: topMargin)

        let leadingConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 30)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -30)

        self.heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)

        NSLayoutConstraint.activate(
            [
                horizontalConstraint,
                topConstraint,
                trailingConstraint,
                leadingConstraint,
                self.heightConstraint
            ]
        )

    }
    
    
     var storyboardMenuAttributes: SwiftyMenuAttributes {
         
         var attributes = SwiftyMenuAttributes()

         // Custom Behavior
         attributes.multiSelect = .disabled
         attributes.scroll = .enabled
         attributes.hideOptionsWhenSelect = .enabled

         // Custom UI
         attributes.roundCorners = .all(radius: 8)
         attributes.rowStyle = .value(height: 40, backgroundColor: .white, selectedColor: UIColor.gray.withAlphaComponent(0.1))
         attributes.headerStyle = .value(backgroundColor: .white, height: 35)
         attributes.placeHolderStyle = .value(text: "Please Select Item", textColor: .lightGray)
         attributes.textStyle = .value(color: .black, separator: " & ", font: .systemFont(ofSize: 14))
         attributes.separatorStyle = .value(color: .black, isBlured: false, style: .singleLine)
         attributes.arrowStyle = .value(isEnabled: true)
         attributes.height = .value(height: 300)

         // Custom Animations
         attributes.expandingAnimation = .linear
         attributes.expandingTiming = .value(duration: 0.5, delay: 0)

         attributes.collapsingAnimation = .linear
         attributes.collapsingTiming = .value(duration: 0.5, delay: 0)

         return attributes

     }

    
}
