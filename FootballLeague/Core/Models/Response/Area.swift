//
//  Area.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Area: Codable
{
    let id: Int?
    let name: String?
    
    var viewModel: AreaViewModel?
    {
        guard let id = id,
              let name = name
        else { return nil }
        
        return .init(id: id, name: name)
    }
}

struct AreaViewModel
{
    let id: Int
    let name: String
}
