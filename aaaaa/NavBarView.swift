//
//  NavBarView.swift
//  aaaaa
//
//  Created by 江其 on 2018/3/5.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit


class NavBarView: UIView {

    var bgColor: UIColor
    
    var navView: UIView
    
    let stateHeight: Double?
    var navHeight: Double?
    
    init(frame: CGRect, bgColor: UIColor) {
        
        if UIScreen.main.bounds.size.height == 812 {
            self.stateHeight = 44.0
            self.navHeight = 44.0
        }else{
            self.stateHeight = 20.0
            self.navHeight = 44.0
        }
        
        self.bgColor = bgColor
        self.navView = UIView()
        super.init(frame: frame)
        
        self.createUI()
    }
    
    
    func createUI() {
        
        var stateLab: UILabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: Double(self.frame.size.width), height: self.stateHeight!))
        self.addSubview(stateLab)
        stateLab.backgroundColor = .red
        
        navView = UIView(frame: CGRect(x: 0.0, y: Double(stateLab.frame.maxY), width: Double(self.frame.size.width), height: self.navHeight!))
        
        self.addSubview(navView)
        navView.backgroundColor = .orange
        
        //左边按钮
        let leftBtn: UIButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 44.0, height: self.navHeight!))
        leftBtn.backgroundColor = UIColor.clear
        navView.addSubview(leftBtn)
        leftBtn.setTitle("返回", for:.normal)
        leftBtn.setTitleColor(.black, for: .normal)
        leftBtn.addTarget(self, action:#selector(cyanButtonClick(clik:)), for: .touchUpInside)
        
        //中间标题
        let titLab: UILabel = UILabel(frame: CGRect(x: Double(leftBtn.frame.maxY), y: 0.0, width: Double(navView.frame.size.width-44*2), height: self.navHeight!))
        navView.addSubview(titLab)
        titLab.backgroundColor = UIColor.clear
        titLab.text = "标题"
        titLab.textAlignment = .center
        //右边按钮
        
        
        self.backgroundColor = UIColor.clear
    }
    @objc func cyanButtonClick(clik button: UIButton) {
        print(#function)
    }
    
    required public init?(coder: (NSCoder!)){
        self.bgColor = UIColor.red
        if UIScreen.main.bounds.size.height == 812 {
            self.stateHeight = 44.0
            self.navHeight = 44.0
        }else{
            self.stateHeight = 20.0
            self.navHeight = 44.0
        }
        self.navView = UIView()
        super.init(coder: coder)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
