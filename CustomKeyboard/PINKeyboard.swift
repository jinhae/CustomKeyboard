//
//  NumericKeyboard.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit


protocol PINKeyboatdDelegate{
    
    func didEnterButtonTouchUp(pincode:String)
    
}

class PINKeyboard: UIView{
    
    var targetTextField:UITextField
    
    var delegate: PINKeyboatdDelegate?
    
    
    // Border Option
    
    let topBorder:CGFloat       = 5
    let leftBorder:CGFloat      = 5
    let rightBorder:CGFloat     = 5
    let bottomBorder:CGFloat    = 0
    
    
    // NumberPad Options
    var numberPad: UIView?
    var numberPadWidthRatio: CGFloat = 0.75
    
    var numberPadFrame: CGRect{
        get{
            if let safeAreaBottom  = UIApplication.shared.windows.last?.safeAreaInsets.bottom,
                let safeAreaLeft    = UIApplication.shared.windows.last?.safeAreaInsets.left,
                let safeAreaRight   = UIApplication.shared.windows.last?.safeAreaInsets.right{
                
                return CGRect(
                    x:0 + safeAreaLeft + leftBorder,
                    y:0 + self.topBorder,
                    width: (self.frame.width - (safeAreaLeft + safeAreaRight + self.leftBorder + self.rightBorder)) * self.numberPadWidthRatio,
                    height:self.frame.height - (safeAreaBottom + self.topBorder + self.bottomBorder))
                
            }else{
                return CGRect.zero
            }
        }
    }
    
    
    
    
    // FunctionPad Options
    var functionPad:UIView?
    var functionPadWidthRatio:CGFloat{
        get{
            print(self.frame.debugDescription)
            return 1 - self.numberPadWidthRatio
        }
    }
    
    var functionPadFrame: CGRect{
        get{
            if let safeAreaBottom  = UIApplication.shared.windows.last?.safeAreaInsets.bottom,
                let safeAreaLeft    = UIApplication.shared.windows.last?.safeAreaInsets.left,
                let safeAreaRight   = UIApplication.shared.windows.last?.safeAreaInsets.right{
                
                return CGRect(
                    x: self.numberPadFrame.width + safeAreaLeft + self.leftBorder,
                    y:0 + self.topBorder,
                    width: (self.frame.width - (safeAreaLeft + safeAreaRight + self.leftBorder + self.rightBorder)) * self.functionPadWidthRatio,
                    height:self.frame.height - (safeAreaBottom + self.topBorder + self.bottomBorder))
                
            }else{
                return CGRect.zero
            }
        }
    }
    
    
    init(frame: CGRect, targetTextField:UITextField) {
        self.targetTextField = targetTextField
        super.init(frame: frame)
        
        setupNumberPad()
        setupFunctionPad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func draw(_ rect: CGRect) {
        var numberArray = ["0","1","2","3","4","5","6","7","8","9","",""].shuffled()
        
        
        for view in (self.numberPad?.subviews)!{
            if view is PINKeyboardButton{
                guard let numberButton = (view as? PINKeyboardButton) else{return}
                numberButton.title = numberArray.removeFirst()

                if numberButton.title.isEmpty{
                    numberButton.isHidden = true
                }else{
                    numberButton.isHidden = false
                }
            }
        }
    }
    
    func setupNumberPad(){
        
        self.numberPad   = UIView(frame: self.numberPadFrame)
        self.numberPad?.backgroundColor = UIColor.clear
        
        
        
        let buttonBorder = 4
        let buttonDefaultWidth = self.numberPadFrame.width / 3
        let buttonDefaultHeight = self.numberPadFrame.height / 4
        
        // Column
        for colIndex in 0..<4{
            
            // Row
            for rowIndex in 0..<3{
                
                // Button Axis
                let buttonAxisX     = (buttonDefaultWidth * CGFloat(rowIndex)) + CGFloat(buttonBorder / 2)
                let buttonAxisY     = (buttonDefaultHeight * CGFloat(colIndex)) + CGFloat(buttonBorder / 2)
                
                // Button Size
                let buttonWidth     = buttonDefaultWidth - CGFloat(buttonBorder * 2)
                let buttonHeight    = buttonDefaultHeight - CGFloat(buttonBorder * 2)
                
                let button = PINKeyboardButton(frame: CGRect(x: buttonAxisX, y: buttonAxisY, width: buttonWidth, height: buttonHeight))
                
                button.buttonColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                button.addTarget(self, action: #selector(self.buttonTouchDown(_:_:)), for: .touchDown)
                button.addTarget(self, action: #selector(self.numberButtonTouchUp(_:_:)), for: .touchUpInside)
                
                
                self.numberPad?.addSubview(button)
            }
        }
        self.addSubview(self.numberPad!)
    }
    
    func setupFunctionPad(){
        self.functionPad = UIView(frame: self.functionPadFrame)
        self.functionPad?.backgroundColor = UIColor.clear
        
        let removeButtonHeight   = self.functionPadFrame.height * 0.3
        let enterButtonHeight      = self.functionPadFrame.height * 0.7
        
        
        let removeButton = PINKeyboardButton(frame: CGRect(x: 0, y: 0, width: self.functionPadFrame.width, height: removeButtonHeight))
        let enterButton    = PINKeyboardButton(frame: CGRect(x: 0, y: removeButtonHeight, width: self.functionPadFrame.width, height: enterButtonHeight))
        
        removeButton.buttonColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        enterButton.buttonColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        removeButton.setTitle("Remove", for: .normal)
        enterButton.setTitle("Enter", for: .normal)
        
        removeButton.addTarget(self, action: #selector(self.buttonTouchDown(_:_:)), for: .touchDown)
        removeButton.addTarget(self, action: #selector(self.removeButtonTouchUp(_:_:)), for: .touchUpInside)
        
        
        enterButton.addTarget(self, action: #selector(self.buttonTouchDown(_:_:)), for: .touchDown)
        enterButton.addTarget(self, action: #selector(self.enterButtonTouchUp(_:_:)), for: .touchUpInside)
        
        self.functionPad?.addSubview(removeButton)
        self.functionPad?.addSubview(enterButton)
        
        self.addSubview(self.functionPad!)
        
    }
    
    
    @objc func buttonTouchDown(_ sender: PINKeyboardButton , _ event: UIEvent){
        sender.alpha = 0.5
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
    }
    
    @objc func numberButtonTouchUp(_ sender: PINKeyboardButton , _ event: UIEvent){
        sender.alpha = 1.0
        
        targetTextField.text! += sender.currentTitle!
    }
    
    @objc func removeButtonTouchUp(_ sender: PINKeyboardButton , _ event: UIEvent){
        sender.alpha = 1.0
        
        if !targetTextField.text!.isEmpty{
                targetTextField.text!.removeLast()
        }else{
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        }
    }
    
    @objc func enterButtonTouchUp(_ sender: PINKeyboardButton , _ event: UIEvent){
        sender.alpha = 1.0
        if delegate != nil{
            delegate?.didEnterButtonTouchUp(pincode: targetTextField.text!)
        }
    }
    
    public func reset(){
        targetTextField.text?.removeAll()
    }
    
    public func reload(){
        self.setNeedsLayout()
    }
}
