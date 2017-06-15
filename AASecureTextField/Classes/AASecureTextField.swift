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
    
    
    @objc fileprivate func toggleShowPassword(_ sender:AnyObject){
        
        let wasFirstResponder = false
        
        if wasFirstResponder == self.isFirstResponder {
            
            self.resignFirstResponder()
            
        }
        
        self.isSecureTextEntry = !self.isSecureTextEntry
        
        self.changeImageWithAnimation()


    }
    
    
    fileprivate func addShowHideButton(){
        
        let height = self.frame.size.height;
        let frame = CGRect(x: 0,y: 0, width: 50, height: height)
        
        eyeButton = UIButton(frame: frame)
        eyeButton.backgroundColor = .clear
        eyeButton.setImage(showTextImage, for: UIControlState())
        self.rightViewMode = UITextFieldViewMode.whileEditing
        eyeButton.addTarget(self, action: #selector(toggleShowPassword(_:)), for: UIControlEvents.touchUpInside)
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
    
    fileprivate func changeImageWithAnimation(){
    
    
        eyeButton.alpha = 0
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.eyeButton.alpha = 1
            
            if self.isSecureTextEntry {
                self.eyeButton.setImage(self.showTextImage, for: UIControlState())
            }else {
                self.eyeButton.setImage(self.hideTextImage, for: UIControlState())
                self.resetTextFont()
            }
            
            }, completion: nil)
    
    }
    
    
    fileprivate func resetTextFont(){
    
        self.attributedText = NSAttributedString(string: self.text!)
    
    }

}
