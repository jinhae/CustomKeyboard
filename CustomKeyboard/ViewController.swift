//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by 모바일보안팀 on 19/03/2019.
//  Copyright © 2019 모바일보안팀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_textView: PINTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
        self.view.endEditing(true)        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.size.height
        
        print(guide.debugDescription)
        print("height \(height)")
        print("full \(self.view.frame.height)")
        
    }
    @objc func bt1Action(sender:UIButton){
        
        
        
    }
    
}

