//
//  NumericButton.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit





@IBDesignable
class NumericButton: UIButton {
    public var index: String = ""
    public var embededData: String = ""
    public var isNumericButton = true
    
    @IBInspectable public var buttonColor: UIColor = UIColor.clear
    
   
    
//    let impact = UIImpactFeedbackGenerator() // 1
    let impact = UIImpactFeedbackGenerator(style: .medium)
    let impact2 = UIImpactFeedbackGenerator(style: .light)
    
    
    let notification = UINotificationFeedbackGenerator()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TouchBegin")
        impact.impactOccurred()
        self.alpha = 0.5
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1.0
        impact2.impactOccurred()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        if isNumericButton{
            
            let bounds = CGRect.init(x: 1.5, y: 1.5, width: self.frame.width - 3.0, height: self.frame.height - 3.0)
            let path = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.allCorners],
                                    cornerRadii: CGSize(width: 5.0, height: 5.0))
            
//            buttonColor.setFill()
            self.backgroundColor = UIColor.clear
            
            #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
            #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
            //086AB6
            path.fill()
            path.lineWidth = 0.1
            
            
            path.stroke()
        }else{
            self.drawDeleteButton(rect)
        }
        
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
