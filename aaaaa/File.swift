//
//  File.swift
//  aaaaa
//
//  Created by 江其 on 2018/3/5.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

func getNavHeight() -> Float {
    if kScreenHeight == 812.0  {
        return 44 + 44;
    }else{
        return 20 + 44;
    }
}
