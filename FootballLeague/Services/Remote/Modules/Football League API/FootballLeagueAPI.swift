//
//  FootballLeagueAPI.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya

enum FootballLeagueAPI
{
    case leagueTeams(_ competitionID: Int)
    case teamInfo(_ teamID: Int)
}

extension FootballLeagueAPI: TargetType, AccessTokenAuthorizable, BaseAPIParametersProtocol
{
    var path: String
    {
        switch self
        {
            case let .leagueTeams(competitionID):
                return "competitions/\(competitionID)/teams"
                
            case let .teamInfo(teamID):
                return "teams/\(teamID)"
        }
    }
    
    var method: Method
    {
        .get
    }
    
    var sampleData: Data
    {
        Data()
    }
    
    var task: Task
    {
        .requestPlain
    }
}
