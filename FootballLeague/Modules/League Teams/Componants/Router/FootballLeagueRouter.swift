//
//  FootballLeagueRouter.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias FootballLeagueRouter = Router<FootballLeagueNavigator, UIViewController>
typealias FootballLeagueNavigationRouter = Router<FootballLeagueNavigator, UINavigationController>

enum FootballLeagueNavigator: Navigatable
{
    case leagueTeams(_ id: Int)
    case teamsInfo(TeamViewModel)
    
    var viewController: UIViewController
    {
        switch self
        {
            case let .leagueTeams(id): return LeagueTeamsViewController(season: id)
            case let .teamsInfo(team): return TeamInfoViewController(team: team)
        }
    }
}
