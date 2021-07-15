//
//  Competition.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Competition: Codable
{
    let id: Int?
    let area: Area?
    let name, code, plan, lastUpdated: String?
    
    var viewModel: CompetitionViewModel?
    {
        guard let id = id,
              let area = area?.viewModel,
              let name = name, let code = code,
              let plan = plan
        else { return nil }
        
        return .init(id: id, area: area, name: name, code: code, plan: plan)
    }
}

struct CompetitionViewModel
{
    let id: Int
    let area: AreaViewModel
    let name, code, plan: String
}
