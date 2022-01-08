//
//  ViewController.swift
//  TeamApp
//
//  Created by admin on 07.01.2022.
//

import UIKit

@objc protocol SettingsLabeleAndViewControllerDelegate {
    
    @objc optional func setColor(_ color: UIColor)
    @objc optional func setColors(_ fontColor: UIColor, _ backGroundColor: UIColor)
    
}


class MainViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? SettingsViewController else { return }
        
        guard let colorsVC = segue.destination as? LabelSettingsViewController else { return }
    }

}

//MARK: - ColorDelegate
extension MainViewController: SettingsLabeleAndViewControllerDelegate {
    func setColor(_ color: UIColor) {
        
        view.backgroundColor = color
        
    }
    func setColors(_ fontColor: UIColor, _ backGroundColor: UIColor) {
        
        label.textColor = fontColor
        label.backgroundColor = backGroundColor
        
    }

}
