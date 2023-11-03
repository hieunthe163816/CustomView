//
//  SettingView.swift
//  CustomView
//
//  Created by Hiếu đang cáu on 23/10/2023.
//

import UIKit

class SettingView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingImageView: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var pasAction : (() -> Void)?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapSettingView))
        containerView.addGestureRecognizer(tapGesture)
    }
    
    
    
    @objc func tapSettingView(){
        pasAction?()
    }
    
    
}
