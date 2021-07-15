//
//  LeagueTeamsVIPERProtocols.swift
//  LeagueTeams
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

// MARK:- Presenter ~> View (View)

protocol LeagueTeamsPresenterToViewProtocol: AnyObject
{
    var presenter: LeagueTeamsViewToPresenterProtocol? { get set }
    
    func display(teams dataSource: TeamsListDataSource, in competition: CompetitionViewModel)
    func display(error message: Alert)
}

// MARK:- View ~> Presenter (Presenter)

protocol LeagueTeamsViewToPresenterProtocol: AnyObject
{
    var view: LeagueTeamsPresenterToViewProtocol? { get set }
    var interactor: LeagueTeamsPresenterToInteractorProtocol? { get set }
    var router: FootballLeagueRouter? { get set }
    
    func getPremierLeagueTeams(for season: Int)
    func navigateToTeamInfo(with team: TeamViewModel)
}

// MARK:- Interactor ~> Presenter (Presenter)

protocol LeagueTeamsInteractorToPresenterProtocol: AnyObject
{
    func didRecive(premierLeague teams: [Team], in competition: Competition)
    func didrecive(error message: Alert)
}

// MARK:- Presenter ~> Interactor (Interactor)

protocol LeagueTeamsPresenterToInteractorProtocol: AnyObject
{
    var presenter: LeagueTeamsInteractorToPresenterProtocol? { get set }
    
    init(_ networkManager: FootballLeagueNetworable)
    func getPremierLeagueTeams(for season: Int)
}
