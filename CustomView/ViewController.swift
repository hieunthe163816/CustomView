//
//  ViewController.swift
//  CustomView
//
//  Created by apple on 10/20/23.
//

import UIKit

enum ViewType: Int {
    case person
    case heart
    case paperplane
    case ellipsis
    case person3
}

class ViewController: UIViewController {
    
    struct Setting {
        var iconName: String
        var title: String
        var typeView: ViewType
    }
    
    let settings: [Setting] = [
        Setting(iconName: "person.fill", title: "Person Data", typeView: .person),
        Setting(iconName: "heart.fill", title: "Refferal Code", typeView: .heart),
        Setting(iconName: "paperplane.fill", title: "E-Statement", typeView: .paperplane),
        Setting(iconName: "heart.fill", title: "Refferal Code", typeView: .ellipsis)        ]
    
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let bodyView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let bodyViewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let bodyViewContainer1 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 100
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = .gray
        setUpView()
        setUpBodyView()
    }
    
    func setUpBodyView(){
        
        bodyViewContainer.frame = CGRect(x: 0, y: 0, width: bodyView.bounds.width, height: bodyView.bounds.height * 0.6)
        bodyViewContainer1.frame = CGRect(x: 0, y: bodyViewContainer.bounds.height+8, width: bodyView.bounds.width, height: bodyView.bounds.height * 0.4)
        bodyView.addSubview(bodyViewContainer)
        bodyView.addSubview(bodyViewContainer1)
        for (index, object) in settings.enumerated() {
            var settingView = Bundle.main.loadNibNamed("SettingView", owner: self)?.first as! SettingView
            
            settingView.settingLabel.text = object.title
            settingView.settingImageView.image = UIImage(systemName: object.iconName)
            settingView.pasAction = {
                let type = object.typeView
                switch type {
                case .person:
                    let personVC = PersonInfo()
                    self.present(personVC, animated: true)
                    break
                default:
                    break
                }
                print("tag \(settingView.tag)")
            }
            settingView.frame = CGRect(x: 0, y: 285 / 4 * Double(index) , width: bodyView.bounds.width, height: 50)
            bodyView.addSubview(settingView)
        }
        
        for (index, object) in settings.enumerated(){
            var settingView = Bundle.main.loadNibNamed("SettingView", owner: self)?.first as! SettingView
            
            settingView.settingLabel.text = object.title
            settingView.settingImageView.image = UIImage(systemName: object.iconName)
            settingView.pasAction = {
                let type = object.typeView
                switch type {
                case .person:
                    let personVC = PersonInfo()
                    self.present(personVC, animated: true)
                    break
                default:
                    break
                }
                print("tag \(settingView.tag)")
            }
            settingView.frame = CGRect(x: 0, y: 250 / 3 * Double(index) , width: bodyView.bounds.width, height: 50)
            bodyViewContainer1.addSubview(settingView)
            if index == 2 {
                break
            }
        }
        
    }
    
    func setUpView(){
        // thêm view con vào superView
        self.view.addSubview(headerView)
        self.view.addSubview(bodyView)
        self.view.addSubview(footerView)
        
        headerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: self.view.bounds.width,
                                  height: self.view.bounds.height / 5)
        
        
        bodyView.frame = CGRect(x: 0,
                                y: self.headerView.bounds.height + 2,
                                width: self.view.bounds.width,
                                height: self.view.bounds.height / 5 * 3 - 1)
        
        
        
        footerView.frame = CGRect(x: 0,
                                  y: self.bodyView.frame.maxY + 70,
                                  width: self.view.bounds.width,
                                  height: self.view.bounds.height / 5)
        
        var settingView = Bundle.main.loadNibNamed("SettingView", owner: self)?.first as! SettingView
        settingView.containerView.backgroundColor = .purple
        settingView.settingImageView.image = UIImage(systemName: "figure.child.circle.fill")
        settingView.settingLabel.text = "Feel free to Ask, We ready to Help"
        settingView.frame = CGRect(x: 0
                                   , y: footerView.bounds.minY, width: self.view.bounds.width, height: footerView.bounds.height)
        footerView.addSubview(settingView)
        
        
        var infoPersonView = Bundle.main.loadNibNamed("Info", owner: self)?.first as! Info
        headerView.addSubview(infoPersonView)
    }
    
    
}

