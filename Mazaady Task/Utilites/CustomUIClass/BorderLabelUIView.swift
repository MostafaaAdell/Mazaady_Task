//
//  BorderLabelUIView.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import UIKit

class PaddedLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width + 20, height: super.intrinsicContentSize.height)
    }
}

class BorderLabelView: UIView {
    
    
    
    convenience init(labelName: String) {
        self.init()
        
        let contentView = UIView()
        
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 10;
        contentView.layer.masksToBounds = true;
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        let label = PaddedLabel()
        label.text = labelName
        label.backgroundColor = .white
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
    }
    
    
    func setupBorderViewToMainView(mainView:UIView ,topview:UIView, topMargin:CGFloat,leftView:UIView,LeftMargin:CGFloat){
        
        mainView.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topview.topAnchor, constant: topMargin).isActive = true
        self.leftAnchor.constraint(equalTo: leftView.leftAnchor, constant: LeftMargin).isActive = true
        
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        

        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        

        
    }
}


