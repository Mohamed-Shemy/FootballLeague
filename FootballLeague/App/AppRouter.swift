//
//  AppRouter.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class AppRouter
{
    // MARK:- Properties
    
    private var window: UIWindow
    
    // MARK:- init
    
    init(_ window: UIWindow? = nil)
    {
        self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    // MARK:- Methods
    
    func displayFirstScreen(withNavigation: Bool = true)
    {
        var viewController: UIViewController
        let currentSeason = Date().year
        
        if withNavigation
        {
            viewController = UINavigationController(rootViewController: LeagueTeamsViewController(season: currentSeason))
        }
        else
        {
            viewController = LeagueTeamsViewController(season: currentSeason)
        }
        setRoot(viewController)
    }
    
    // MARK:- Helpers
    
    private func setRoot(_ viewController: UIViewController)
    {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
