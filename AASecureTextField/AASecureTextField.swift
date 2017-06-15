//
//  AASecureTextField.swift
//  AASecureTextField
//
//  Created by user on 6/1/16.
//  Copyright © 2016 AaoIi. All rights reserved.
//

import UIKit

@IBDesignable class AASecureTextField: UITextField {
    
    @IBInspectable var showTextImage: UIImage = UIImage(){
        didSet {
            eyeButton.setImage(showTextImage, forState: UIControlState.Normal)
        }
    }

    @IBInspectable var hideTextImage: UIImage = UIImage(){
        didSet {
            eyeButton.setImage(showTextImage, forState: UIControlState.Normal)
        }
    }

    var showImage = UIImage()
    
    
    var eyeButton: UIButton = UIButton() {
        didSet {
            eyeButton.setImage(showTextImage, forState: UIControlState.Normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addShowHideButton()

    }

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    func toggleShowPassword(sender:AnyObject){
    
        let wasFirstResponder = false
        
        if wasFirstResponder == self.isFirstResponder() {
        
        self.resignFirstResponder()
        
        }
        self.secureTextEntry = !self.secureTextEntry
    
//        if wasFirstResponder == true{
//        
//            self.becomeFirstResponder()
//        }
    
        if self.secureTextEntry {
        
        eyeButton.setImage(showTextImage, forState: UIControlState.Normal)
        
        }else {
        
        eyeButton.setImage(hideTextImage, forState: UIControlState.Normal)

        
        }
        
    
    }

    
    func addShowHideButton(){
    
    let height = self.frame.size.height;
    let frame = CGRectMake(0,0, 55, height)
    
        eyeButton = UIButton(frame: frame)
        eyeButton.backgroundColor = .clearColor()
        eyeButton.setImage(showTextImage, forState: UIControlState.Normal)
        self.rightViewMode = UITextFieldViewMode.WhileEditing
        eyeButton.addTarget(self, action: #selector(toggleShowPassword(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.rightView = eyeButton
        self.addSubview(eyeButton)
        
    }

    

}
