//
//  NumericKeyboard.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit

class NumericKeyboard: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let color = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1),#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
        
        guard let safeAreaBottom = UIApplication.shared.windows.last?.safeAreaInsets.bottom else{
            return
        }
        
        
        
//        var numberPad = UIView(frame: CGRect(x:0,y:0,width:(frame.width/4)*3,height:frame.height))
        
        
        let buttonRowCnt = 3
        let buttonColCnt = 4
        
        let borderX = 3
        let borderY = 3
        
        let buttonWidth = self.frame.width / CGFloat(buttonRowCnt)
        let buttonHeight = (self.frame.height - CGFloat(safeAreaBottom)) / CGFloat(buttonColCnt)
        
        
        
        
        for rowIndex in 0..<buttonRowCnt{
            for colIndex in 0..<buttonColCnt{
                
                
                let positionX = (buttonWidth * CGFloat(rowIndex)) + CGFloat(borderX)
                let positionY = (buttonHeight * CGFloat(colIndex)) + CGFloat(borderY)
                let width = buttonWidth - CGFloat(borderX * 2)
                let height = buttonHeight - CGFloat(borderY * 2)
                
                
                if rowIndex == (buttonRowCnt - 1) && colIndex == (buttonColCnt - 1){
                    let button = NumericButton(frame: CGRect(x: positionX, y: positionY, width: width, height: height))
                    button.buttonColor = color.randomElement()!
                    button.isNumericButton = false
                    self.addSubview(button)
                }else{
                    let button = NumericButton(frame: CGRect(x: positionX, y: positionY, width: width, height: height))
                    button.buttonColor = color.randomElement()!
                    button.isNumericButton = true
                    self.addSubview(button)
                }
            }
        }
        
        
        
        

        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
//        var numberArray = ["0","1","2","3","4","5","6","7","8","9"," "]
        var numberArray = ["0","1","2","3","4","5","6","7","8","9"," "].shuffled()
        
        
        for view in self.subviews{
            if view is NumericButton{
                guard let numericButton = (view as? NumericButton) else{
                    return
                }
                if numericButton.isNumericButton == true{
                    numericButton.setTitle(numberArray.removeFirst(), for: .normal )
                }else{
//                    numericButton.setTitle("<-", for: .normal)
                }
            }
        }
    }
}
