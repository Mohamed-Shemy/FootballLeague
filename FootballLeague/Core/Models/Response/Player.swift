//
//  Player.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Player: Codable
{
    let id, shirtNumber: Int?
    let name, position, dateOfBirth, nationality, role: String?
    
    var viewModel: PlayerViewModel?
    {
        guard let id = id, let name = name else { return nil }
        
        return .init(id: id, name: name)
    }
}

struct PlayerViewModel
{
    let id: Int
    let name: String
}
