//
//  PinTextField.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit

@IBDesignable
class PINTextField: UITextField{
    
    
    
    @IBInspectable var validColor: UIColor = #colorLiteral(red: 0.9137254902, green: 0.06850343797, blue: 0.2887741191, alpha: 1)
    @IBInspectable var invalidColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    @IBInspectable var digit: Int = 6
    @IBInspectable var imageSize:CGFloat = 0.8
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        guard let width   = UIApplication.shared.windows.last?.frame.width else {return}
        guard let height  = UIApplication.shared.windows.last?.frame.height else {return}
        
        
        self.inputView = PINKeyboard(frame: CGRect(x: 0, y: 0, width: width, height: height / 3), targetTextField: self)
        
        self.addObserver(self, forKeyPath: "text", options: [.new, .old], context: nil)
        
        
        
        self.textColor = UIColor.clear
        self.tintColor = UIColor.clear
        

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text"{
            let currentTf = (object as? PINTextField)!
            if (currentTf.text?.count)! > self.digit{
                currentTf.text? = change![NSKeyValueChangeKey.oldKey] as! String
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            }
            self.setNeedsDisplay()
            print(currentTf.text!)
        }
    }
   

    override func draw(_ rect: CGRect) {
        
        let pinCharImageFrameWidth  = (rect.width / CGFloat(self.digit))
        let pinCharImageFrameHeight = pinCharImageFrameWidth
        
        let pinCharImageWidth = pinCharImageFrameWidth * self.imageSize
        let pinCharImageHeight = pinCharImageWidth
        
        let pinCharImageFrameCenterX = pinCharImageFrameWidth / 2
        let pinCharImageFrameCenterY = pinCharImageFrameHeight / 2
        
        let pinCharImageX = pinCharImageFrameCenterX - (pinCharImageWidth / 2)
        let pinCharImageY = pinCharImageFrameCenterY - (pinCharImageHeight / 2)
        
        for index in 0..<self.digit{
            let path = UIBezierPath.init(ovalIn: CGRect(x: pinCharImageX  + (pinCharImageFrameWidth * CGFloat(index)), y: pinCharImageY, width: pinCharImageWidth , height: pinCharImageHeight))
            if index < (self.text?.count)!{
                self.validColor.setFill()
            }else {
                self.invalidColor.setFill()
            }
            
            path.fill()
            path.close()
        }
    }
}
