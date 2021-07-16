//
//  TeamInfoPresenter.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class TeamInfoPresenter
{
    // MARK:- Properties
    
    weak var view: TeamInfoPresenterToViewProtocol?
    var interactor: TeamInfoPresenterToInteractorProtocol?
    var router: FootballLeagueRouter?
    private var playersDataSource: PLayersDataSource!
}

// MARK:- View ~> Presenter

extension TeamInfoPresenter: TeamInfoViewToPresenterProtocol
{
    func getTeamInfo(by teamID: Int)
    {
        interactor?.getTeamInfo(by: teamID)
    }
}

// MARK:- Interactor ~> Presenter

extension TeamInfoPresenter: TeamInfoInteractorToPresenterProtocol
{
    func didRecive(team info: Team)
    {
        guard let infoViewModel = info.viewModel else {
            didrecive(error: .unableToLoadTeamInfo)
            return
        }
        
        playersDataSource = .init(infoViewModel.squad)
        view?.display(team: infoViewModel, players: playersDataSource)
    }
    
    func didrecive(error message: Alert)
    {
        view?.display(error: message)
    }
}
