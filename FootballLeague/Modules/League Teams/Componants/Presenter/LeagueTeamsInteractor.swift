//
//  LeagueTeamsInteractor.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class LeagueTeamsInteractor: LeagueTeamsPresenterToInteractorProtocol
{
    // MARK:- Properties
    var presenter: LeagueTeamsInteractorToPresenterProtocol?
    private var networkManager: FootballLeagueNetworable
    
    // MARK:- init
    
    required init(_ networkManager: FootballLeagueNetworable = FootballLeagueNetworkManager())
    {
        self.networkManager = networkManager
    }
    
    // MARK:- Methods
    
    func getPremierLeagueTeams(for season: Int)
    {
        networkManager.getLeagueTeams(with: season, completion: leagueTeamsCallBack)
    }
    
    // MARK:- Helpers
    
    private func leagueTeamsCallBack(_ result: Result<CompetitionTeamsResponse, Error>)
    {
        switch result
        {
            case let .success(response):
                presentLeagueTeamsResponse(response)
                
            case .failure:
                presenter?.didrecive(error: .unableToLoadTeams)
        }
    }
    
    private func presentLeagueTeamsResponse(_ response: CompetitionTeamsResponse)
    {
        guard let teams = response.teams,
              let competition = response.competition
        else
        {
            presenter?.didrecive(error: .unableToLoadTeams)
            return
        }
        
        presenter?.didRecive(premierLeague: teams, in: competition)
    }
}
