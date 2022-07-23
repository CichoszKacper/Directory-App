//
//  TabBarController.swift
//  HitchWiki
//
//  Created by Kacper Cichosz on 03/02/2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBarController()
    }
    
    func setUpTabBarController() {
        let mainMenu = NavigationController(rootViewController: MainMenuViewController(viewModel: MainMenuViewModel()))
        self.setViewControllers([mainMenu], animated: true)
        guard let items = self.tabBar.items else {
            return
        }
        
        if #available(iOS 15, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.stackedLayoutAppearance.normal.iconColor = .white
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            appearance.stackedLayoutAppearance.selected.iconColor = .white
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.backgroundColor = UIColor(hexString: Constants.MainBrandColour)
            
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance
        }
        
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .white
            
            appearance.stackedLayoutAppearance.normal.iconColor = .white
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor(hexString: Constants.MainBrandColour)
            
            appearance.stackedLayoutAppearance.selected.iconColor = .systemPink
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            self.tabBar.standardAppearance = appearance
        }
        let images = ["house", "gear"]
        for (index, item) in items.enumerated() {
            item.image = UIImage(systemName: images[index])
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let viewController = self.viewControllers?[selectedIndex] as? NavigationController
        viewController?.popToRootViewController(animated: false)
    }
}
