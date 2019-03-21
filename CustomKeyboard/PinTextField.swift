//
//  PinTextField.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit

class PinTextField: UITextField, UITextFieldDelegate{

    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let width   = UIApplication.shared.windows.last?.frame.width else {
            return
        }
        guard let height  = UIApplication.shared.windows.last?.frame.height else {
            return
        }
        
        
        self.delegate = self
        
        self.inputView = NumericKeyboard(frame: CGRect(x: 0, y: 0, width: width, height: height / 3))
        
//
//        let test = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        test.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        let test2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        test2.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        self.addSubview(test2)
        
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.inputView?.reloadInputViews()
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end editing")
    }
    

//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
    }
 

}
