//
//  SplashVC.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 22.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation
import Reachability

class SplashVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetwork()
        
    }
    
    private func checkNetwork() {
        do {
            let reachability = try Reachability()
            let connection = reachability.connection
            if connection == .unavailable {
                let alert = UIAlertController(title: "Error", message: "Check your internet connection.", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            } else {
                gotoMainPage()
            }
        } catch {
            
        }
    }
    
    private func gotoMainPage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            if let vc = self.storyboard?.instantiateViewController(identifier: "MainPageVC") {
                let nc = UINavigationController(rootViewController: vc)
                UIApplication.shared.windows[0].rootViewController = nc
            }
            
        })
    }

}
