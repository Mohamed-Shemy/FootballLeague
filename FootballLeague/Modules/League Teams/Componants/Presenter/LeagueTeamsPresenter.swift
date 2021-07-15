//
//  LeagueTeamsPresenter.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class LeagueTeamsPresenter
{
    // MARK:- Properties
    
    weak var view: LeagueTeamsPresenterToViewProtocol?
    var interactor: LeagueTeamsPresenterToInteractorProtocol?
    var router: FootballLeagueRouter?
    
    private var teamsListDataSource: TeamsListDataSource!
}

// MARK:- View ~> Presenter

extension LeagueTeamsPresenter: LeagueTeamsViewToPresenterProtocol
{
    func getPremierLeagueTeams(for season: Int)
    {
        interactor?.getPremierLeagueTeams(for: season)
    }
    
    func navigateToTeamInfo(with team: TeamViewModel)
    {
        router?.navigate(to: .teamsInfo(team))
    }
}

// MARK:- Interactor ~> Presenter

extension LeagueTeamsPresenter: LeagueTeamsInteractorToPresenterProtocol
{
    func didRecive(premierLeague teams: [Team], in competition: Competition)
    {
        guard let competitionViewModel = competition.viewModel else
        {
            didrecive(error: .unableToLoadTeams)
            return
        }
        
        let teamsViewModels = teams.compactMap(\.viewModel)
        teamsListDataSource = .init(teamsViewModels)
        
        view?.display(teams: teamsListDataSource, in: competitionViewModel)
    }
    
    func didrecive(error message: Alert)
    {
        view?.display(error: message)
    }
}
