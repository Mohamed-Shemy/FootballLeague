//
//  Navigator.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

public protocol Navigator: AnyObject
{
    associatedtype Destination: Navigatable
    
    var viewController: UIViewController? { get }
    
    func dismiss()
    func navigate(to destination: Destination)
    func present(_ controller: Destination)
}

public extension Navigator
{
    func dismiss()
    {
        viewController?.dismiss()
    }
    
    func navigate(to destination: Destination)
    {
        viewController?.push(navigatable: destination)
    }
    
    func present(_ controller: Destination)
    {
        viewController?.present(navigatable: controller)
    }
}
