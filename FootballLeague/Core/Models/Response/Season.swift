//
//  Season.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Season: Codable
{
    let id, currentMatchday: Int?
    let startDate, endDate: String?
    let winner: Team?
    
    var viewModel: SeasonViewModel?
    {
        guard let id = id else { return nil}
        
        return .init(id: id, currentMatchday: currentMatchday ?? 0,
                     startDate: startDate ?? "", endDate: endDate ?? "", winner: winner)
    }
}

struct SeasonViewModel
{
    let id, currentMatchday: Int
    let startDate, endDate: String
    let winner: Team?
}
