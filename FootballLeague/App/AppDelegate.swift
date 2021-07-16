//
//  AppDelegate.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Wed 14 Jul 2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    private var appRouter = AppRouter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        appRouter.launchFirstScreen()
        
        return true
    }
}

