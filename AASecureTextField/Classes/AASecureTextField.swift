//
//  AASecureTextField.swift
//  AASecureTextField
//
//  Created by Saad Albasha on 6/1/16.
//  Copyright © 2016 AaoIi. All rights reserved.
//

import UIKit

@IBDesignable class AASecureTextField: UITextField {
    
    @IBInspectable var showImage: UIImage = UIImage(){
        didSet {
            self.showTextImage = showImage
        }
    }
    @IBInspectable var hideImage: UIImage = UIImage(){
        didSet {
            self.hideTextImage = hideImage
        }
    }
    var showTextImage : UIImage!
    var hideTextImage : UIImage!
    var eyeButton: UIButton!
    
//    init(){
//        super.init(frame: CGRectZero)
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.addShowHideButton()
        
    }
    
    
    @objc private func toggleShowPassword(sender:AnyObject){
        
        let wasFirstResponder = false
        
        if wasFirstResponder == self.isFirstResponder() {
            
            self.resignFirstResponder()
            
        }
        
        self.secureTextEntry = !self.secureTextEntry
        
        self.changeImageWithAnimation()


    }
    
    
    private func addShowHideButton(){
        
        let height = self.frame.size.height;
        let frame = CGRectMake(0,0, 50, height)
        
        eyeButton = UIButton(frame: frame)
        eyeButton.backgroundColor = .clearColor()
        eyeButton.setImage(showTextImage, forState: UIControlState.Normal)
        self.rightViewMode = UITextFieldViewMode.WhileEditing
        eyeButton.addTarget(self, action: #selector(toggleShowPassword(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.rightView = eyeButton
        self.addSubview(eyeButton)

    }

    
    override func becomeFirstResponder() -> Bool {
        
        let returnValue = super.becomeFirstResponder()

        if (returnValue) {
            
            self.changeImageWithAnimation()

        }
        
        return returnValue;

    }
    
    private func changeImageWithAnimation(){
    
    
        eyeButton.alpha = 0
        UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: [], animations: {
            
            self.eyeButton.alpha = 1
            
            if self.secureTextEntry {
                self.eyeButton.setImage(self.showTextImage, forState: UIControlState.Normal)
            }else {
                self.eyeButton.setImage(self.hideTextImage, forState: UIControlState.Normal)
                self.resetTextFont()
            }
            
            }, completion: nil)
    
    }
    
    
    private func resetTextFont(){
    
        self.attributedText = NSAttributedString(string: self.text!)
    
    }

}
