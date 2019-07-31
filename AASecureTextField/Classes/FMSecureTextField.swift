//
//  FMSecureTextField.swift
//  FMSecureTextField
//
//  Created by Saad Albasha on 6/1/16.
//  Copyright © 2016 AaoIi. All rights reserved.
//

import UIKit

@IBDesignable public class FMSecureTextField: UITextField {
    
    // public Outlets
    
    /// Enable image type
    @IBInspectable public var secureTypeImage: Bool = false{
        willSet {
            if newValue == true {
                showHideMode = .image
            }
        }
    }
    @IBInspectable public var showImage: UIImage = UIImage(){
        didSet {
            secureImage.show = showImage
        }
    }
    @IBInspectable public var hideImage: UIImage = UIImage(){
        didSet {
            secureImage.hide = hideImage
        }
    }
    
    /// Enable text type
    @IBInspectable public var secureTypeText: Bool = false{
        willSet {
            if newValue == true {
                showHideMode = .text
            }
        }
    }
    @IBInspectable public var showText: String = "Show"{
        didSet {
            secureTitle.show = showText
        }
    }
    
    @IBInspectable public var hideText: String = "Hide"{
        didSet {
            secureTitle.hide = hideText
        }
    }
    
    public var secureViewShowMode: UITextField.ViewMode = .whileEditing{
        didSet {
            secureTextfieldMode = secureViewShowMode
        }
    }
    
    /// Use to customize your button font,and colors only
    public var getSecureButton : UIButton {
        get{
            return self.secureButton
        }
    }

    // Storage Vars
    private var secureImage : (show:UIImage?,hide:UIImage?) = (nil,nil)
    private var secureTitle : (show:String?,hide:String?) = (nil,nil)

    private var secureButton: UIButton = UIButton(frame: .zero)
    private var secureTextfieldMode : UITextField.ViewMode = .whileEditing
    private var showHideMode : SecureViewMode = .image
    
    public enum SecureViewMode {
        case image
        case text
    }
    
    //MARK:- Core
    
    @available(*,unavailable)
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.validate()
        
        self.addShowHideButton()
    }
    
    fileprivate func addShowHideButton(){
        
        let height = self.frame.size.height;
        let frame = CGRect(x: 0,y: 0, width: 0, height: height)
        
        secureButton.frame = frame
        secureButton.backgroundColor = .clear

        if showHideMode == .image {
            secureButton.setImage(secureImage.show, for: UIControl.State())
            secureButton.sizeToFit()
            secureButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        }else {
            secureButton.setTitle(secureTitle.show, for: UIControl.State())
            secureButton.sizeToFit()
            secureButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        }
        
        secureButton.addTarget(self, action: #selector(toggleShowPassword(_:)), for: UIControl.Event.touchUpInside)
        
        self.rightViewMode = secureTextfieldMode
        self.rightView = secureButton
        
    }
    
    //MARK:- Handlers
    
    @objc private func toggleShowPassword(_ sender:AnyObject){
        
        let wasFirstResponder = false
        
        if wasFirstResponder == self.isFirstResponder {
            
            self.resignFirstResponder()
            
        }
        
        self.isSecureTextEntry = !self.isSecureTextEntry
        
        self.applySwitchingWithAnimation()
        
    }
    
    override public func becomeFirstResponder() -> Bool {
        
        let returnValue = super.becomeFirstResponder()
        
        if (returnValue) {
            
            self.applySwitchingWithAnimation()
            
        }
        
        return returnValue;
    }
    
    private func applySwitchingWithAnimation(){
        
        secureButton.alpha = 0
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.secureButton.alpha = 1
            
            if self.isSecureTextEntry {
                self.showHideMode == .image ? self.secureButton.setImage(self.secureImage.show, for: UIControl.State()) : self.secureButton.setTitle(self.secureTitle.show, for: UIControl.State())
            }else {
                self.showHideMode == .image ? self.secureButton.setImage(self.secureImage.hide, for: UIControl.State()): self.secureButton.setTitle(self.secureTitle.hide, for: UIControl.State())
                self.resetTextFont()
            }
            
        }, completion: nil)
        
    }
    
    private func resetTextFont(){
        
        self.attributedText = NSAttributedString(string: self.text!)
        
    }
    
    //MARK:- Validation Check
    
    /// will validate that user has entered the values correctly to avoid unwanted crashes.
    private func validate(){
        
        if self.showHideMode == .image {
            if self.secureImage.show == nil || self.secureImage.hide == nil {assert(false, "Provide a valid image for display for both show and hide, then try again :)")}
        }else {
            if self.secureTitle.show == nil || self.secureTitle.hide == nil {assert(false, "Provide a valid text for display for both show and hide, then try again :)")}
        }
        
    }
    
}
