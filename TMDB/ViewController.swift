//
//  ViewController.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
      
        let vc2 = UINavigationController(rootViewController: SaveViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "star.fill")
        
        
        vc1.title = "Home"
        vc2.title = "Favorite"
        
        
        tabBar.tintColor = .label
    
        
        
        
        
        
        setViewControllers([vc1, vc2], animated: true)
        
    }
    

}

