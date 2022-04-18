//
//  ViewController.swift
//  AutoChangeAppIcon
//
//  Created by mengshun on 2022/4/18.
//

import UIKit
/*
 1. 准备好备用的app icon 图标, 此Demo准备了 3 套, Icon1, Icon2, Icon3
 2. Info.plist 添加 Icon files (iOS 5), 并在该分类下添加字典CFBundleAlternateIcons;
 3. 在CFBundleAlternateIcons继续添加字典1的key(切换主题的名称), 在主题1下添加 数组CFBundleIconFiles, 并在该列表添加Icon1的图片标题;
 4. 同样的方法添加第二三套主题;
 5. 使用 UIApplication.shared.setAlternateIconName app进行主题切换, ios 10.3 以上才支持此功能.
 
 注意: 如果想恢复原来的主题, 只需要传入名称为 nil 即可.
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changeAction(_ sender: Any) {
        
        var version = UserDefaults.standard.integer(forKey: "APPICON")
        version += 1
        if version > 3 {
            version = 1
        }
        UserDefaults.standard.set(version, forKey: "APPICON")
        let iconName = "Icon\(version)"
        UIApplication.shared.setAlternateIconName(iconName) { error in
            print("\(iconName) completion: \(error?.localizedDescription ?? "")")
        }
        
    }
    
}

