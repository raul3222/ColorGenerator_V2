//
//  MainViewController.swift
//  ColorGenerator
//
//  Created by Raul Shafigin on 04.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(viewColor: UIColor)
}

class MainViewController: UIViewController {

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let settingsVC = segue.destination as? SettingsViewController else { return }
       settingsVC.bgColor = view.backgroundColor
       settingsVC.delegate = self
      
       
   }
   
}


extension MainViewController: SettingsViewControllerDelegate {
    func setColor(viewColor: UIColor) {
        view.backgroundColor = viewColor
    }
}
