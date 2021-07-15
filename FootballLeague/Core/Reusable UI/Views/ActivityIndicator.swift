//
//  ActivityIndicator.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class ActivityIndicator
{
    private static let topViewController = UIViewController.topViewController
    
    static func startLoading()
    {
        DispatchQueue.main.async
        {
            self.topViewController?.showLoader()
        }
    }
    
    static func stopLoading()
    {
        DispatchQueue.main.async
        {
            self.topViewController?.hideLoader()
        }
    }
}
