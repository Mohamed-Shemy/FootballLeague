//
//  TeamInfoVIPERProtocols.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

// MARK:- Presenter ~> View (View)

protocol TeamInfoPresenterToViewProtocol: AnyObject
{
    var presenter: TeamInfoViewToPresenterProtocol? { get set }
    
    func display(team info: TeamViewModel, players dataSource: PLayersDataSource)
    func display(error message: Alert)
}

// MARK:- View ~> Presenter (Presenter)

protocol TeamInfoViewToPresenterProtocol: AnyObject
{
    var view: TeamInfoPresenterToViewProtocol? { get set }
    var interactor: TeamInfoPresenterToInteractorProtocol? { get set }
    
    func getTeamInfo(by teamID: Int)
}

// MARK:- Interactor ~> Presenter (Presenter)

protocol TeamInfoInteractorToPresenterProtocol: AnyObject
{
    func didRecive(team info: Team)
    func didrecive(error message: Alert)
}

// MARK:- Presenter ~> Interactor (Interactor)

protocol TeamInfoPresenterToInteractorProtocol: AnyObject
{
    var presenter: TeamInfoInteractorToPresenterProtocol? { get set }
    
    init(_ networkManager: FootballLeagueNetworable)
    func getTeamInfo(by teamID: Int)
}
