//
//  FootballLeagueNetworkManager.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class FootballLeagueNetworkManager: FootballLeagueNetworable
{
    // MARK:- Properties
    
    private let moyaServiceHelper: MoyaServiceHelper<FootballLeagueAPI>
    
    // MARK:- Init
    
    init(type: ServiceType = .live)
    {
        moyaServiceHelper = MoyaServiceHelper(type: type)
    }
    
    // MARK:- Method
    
    func getLeagueTeams(with competitionID: Int, completion: @escaping (Result<CompetitionTeamsResponse, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .leagueTeams(competitionID), completion: completion)
    }
    
    func getTeamInfo(with teamID: Int, completion: @escaping (Result<Team, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .teamInfo(teamID), completion: completion)
    }
}
