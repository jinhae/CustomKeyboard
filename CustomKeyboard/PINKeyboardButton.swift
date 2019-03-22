//
//  NumericButton.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit

class PINKeyboardButton: UIButton {
    
    public var buttonColor: UIColor = UIColor.clear
    
    
    public var title: String {
        set(newValue){
            self.setTitle(newValue, for: .normal)
            self.backgroundColor = UIColor.clear
            self.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            
        
        }
        get{
            guard let title = self.currentTitle else { return "" }
            return title
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let bounds = CGRect.init(x: 1.5, y: 1.5, width: self.frame.width - 3.0, height: self.frame.height - 3.0)
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.allCorners],
                                cornerRadii: CGSize(width: 5, height: 5))
        
        
        buttonColor.setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        
        path.fill()
        path.lineWidth = 0.5
        
        
        path.stroke()
        
        
    }
    
    func drawDeleteButton(_ rect: CGRect){
        let aPath = UIBezierPath()
        
        let midX = rect.midX + 5
        let midY = rect.midY
        
        let p1_1    = CGPoint(x: midX - 28, y: midY - 3)
        let p1      = CGPoint(x: midX - 30, y: midY)
        let p1_2    = CGPoint(x: midX - 28, y: midY + 3)
        
        let p2_1    = CGPoint(x: midX - 20, y: midY - 10)
        let p2      = CGPoint(x: midX - 15, y: midY - 15)
        let p2_2    = CGPoint(x: midX - 10, y: midY - 15)
        
        
        
        let p3_1    = CGPoint(x: midX + 10, y: midY - 15)
        let p3      = CGPoint(x: midX + 15, y: midY - 15)
        let p3_2    = CGPoint(x: midX + 15, y: midY - 10)
        
        
        let p4_1    = CGPoint(x: midX + 15, y: midY + 10)
        let p4      = CGPoint(x: midX + 15, y: midY + 15)
        let p4_2    = CGPoint(x: midX + 10, y: midY + 15)
        
        
        let p5_1    = CGPoint(x: midX - 20, y: midY + 10)
        let p5      = CGPoint(x: midX - 15, y: midY + 15)
        let p5_2    = CGPoint(x: midX - 10, y: midY + 15)
        
        aPath.move(to: p1_2)
        aPath.addQuadCurve(to: p1_1, controlPoint: p1)

        aPath.addLine(to: p2_1)
        aPath.addQuadCurve(to: p2_2, controlPoint: p2)
        
        
        
        aPath.addLine(to: p3_1)
        aPath.addQuadCurve(to: p3_2, controlPoint: p3)

        aPath.addLine(to: p4_1)
        aPath.addQuadCurve(to: p4_2, controlPoint: p4)

        aPath.addLine(to: p5_2)
        aPath.addQuadCurve(to: p5_1, controlPoint: p5)

        aPath.addLine(to: p1_2)
        
        
        aPath.close()
        
        aPath.move(to: CGPoint(x: midX - 5, y: midY - 5))
        aPath.addLine(to:   CGPoint(x: midX + 5, y: midY + 5))
        
        aPath.close()
        
        aPath.move(to: CGPoint(x: midX + 5, y: midY - 5))
        aPath.addLine(to:   CGPoint(x: midX - 5, y: midY + 5))
        aPath.close()
        
        aPath.lineWidth = 1.5
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        aPath.stroke()
      
    }
 

}
