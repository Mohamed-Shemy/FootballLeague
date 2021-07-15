//
//  AppAlerts.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

enum Alert
{
    // MARK:- Cases
    
    case unkown(String)
    
    case unableToLoadTeams
    
    // MARK:- Values
    
    var value: String
    {
        switch self
        {
            case let .unkown(message): return message
            case .unableToLoadTeams: return "Unable to laod teams for the season"
        }
    }
}
