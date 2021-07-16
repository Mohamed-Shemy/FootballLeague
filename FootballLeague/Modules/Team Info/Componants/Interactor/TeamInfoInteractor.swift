//
//  TeamInfoInteractor.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class TeamInfoInteractor: TeamInfoPresenterToInteractorProtocol
{
    // MARK:- Properties
    
    weak var presenter: TeamInfoInteractorToPresenterProtocol?
    private var networkManager: FootballLeagueNetworable
    
    // MARK:- init
    
    required init(_ networkManager: FootballLeagueNetworable = FootballLeagueNetworkManager())
    {
        self.networkManager = networkManager
    }
    
    // MARK:- Methods
    
    func getTeamInfo(by teamID: Int)
    {
        networkManager.getTeamInfo(with: teamID, completion: teamInfoCallBack)
    }
    
    // MARK:- Helpers
    
    private func teamInfoCallBack(_ result: Result<Team, Error>)
    {
        switch result
        {
            case let .success(info):
                presenter?.didRecive(team: info)
                
            case .failure:
                presenter?.didrecive(error: .unableToLoadTeamInfo)
        }
    }
}
