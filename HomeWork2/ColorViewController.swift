//
//  ColorViewController.swift
//  HomeWork2
//
//  Created by Наташа Лемешевская on 12/4/19.
//  Copyright © 2019 Наташа Лемешевская. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController{
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingVC = segue.destination as! SettingViewController
        settingVC.newViewColor = view.backgroundColor
        settingVC.delegate = self
    }

}

extension ColorViewController: SettingViewControllerDelegate {
    
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}

