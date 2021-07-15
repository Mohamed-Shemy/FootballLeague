//
//  Router.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class Router<Destination: Navigatable>: Navigator
{
    // MARK: Properties
    
    weak var viewController: UIViewController?
    
    // MARK: init
    
    init(_ view: UIViewController?)
    {
        viewController = view
    }
}
