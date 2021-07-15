//
//  CompetitionTeamsResponse.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct CompetitionTeamsResponse: Codable
{
    let count: Int?
    let competition: Competition?
    let season: Season?
    let teams: [Team]?
}
