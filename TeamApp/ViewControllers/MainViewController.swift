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
    
    //MARK: - IB Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsButton.isHidden = true
        label.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    //MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            settingsButton.isHidden = true
            label.isHidden = true
        default:
            settingsButton.isHidden = false
            label.isHidden = false
        }
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
