//
//  FootballLeagueNetworable.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol FootballLeagueNetworable: AnyObject
{
    func getLeagueTeams(with competitionID: Int, completion: @escaping (Result<CompetitionTeamsResponse, Error>) -> Void)
    func getTeamInfo(with teamID: Int, completion: @escaping (Result<Team, Error>) -> Void)
}
