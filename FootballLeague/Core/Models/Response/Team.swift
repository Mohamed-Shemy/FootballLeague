//
//  Team.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Team: Codable
{
    let id, founded: Int?
    let area: Area?
    let name, shortName, tla, crestUrl,
        address, phone, website, email,
        clubColors, venue, lastUpdated: String?
    let activeCompetitions: [Competition]?
    let squad: [Player]?
    
    var viewModel: TeamViewModel?
    {
        guard let id = id,
              let name = name,
              let crestUrl = crestUrl,
              let website = website
        else { return nil }
        
        return TeamViewModel(id: id, name: name,
                             crestUrl: crestUrl, website: website,
                             squad: squad?.compactMap(\.viewModel) ?? [])
    }
}

struct TeamViewModel
{
    let id: Int
    let name, crestUrl, website: String
    let squad: [PlayerViewModel]
}
