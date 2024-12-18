//
//  ViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 07/03/24.
//

import UIKit
import SwiftUI

class ViewController: UITabBarController {
    
    @State private var modelData = ModelData()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        
        let vc1 = UIHostingController(rootView: CategoryHome().environment(self.modelData))
        let vc2  = UINavigationController(rootViewController: InBoxViewController())
        let vc3 = UIHostingController(rootView: FoodView())
        let vc4  = UINavigationController(rootViewController: SettingViewController())
                                       
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "tray.fill")
        vc3.tabBarItem.image = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
        vc4.tabBarItem.image = UIImage(systemName: "star.fill")
        
        vc1.title = "Home"
        vc2.title = "Inbox"
        vc3.title = "F&B"
        vc4.title = "Favorite"
        
        tabBar.tintColor = .systemBlue
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        CTevent.onUserLogin()
    }

}


