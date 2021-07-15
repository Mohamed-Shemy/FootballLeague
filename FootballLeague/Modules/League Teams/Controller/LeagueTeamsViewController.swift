//
//  LeagueTeamsViewController.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Wed 14 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class LeagueTeamsViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var teamsTableView: UITableView!
    
    // MARK:- Properties
    
    var presenter: LeagueTeamsViewToPresenterProtocol?
    private let season: Int
    
    // MARK:- init
    
    init(season: Int)
    {
        self.season = season
        super.init(nibName: Self.identifier, bundle: nil)
        setupComponants()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("use init(season: Int)")
    }
    
    // MARK:- Life Cycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        getPremierLeagueTeamsForCurrentSeason()
    }
    
    // MARK:- Setup
    
    private func setupComponants()
    {
        let presenter = LeagueTeamsPresenter()
        let interactor = LeagueTeamsInteractor()
        let router = FootballLeagueRouter(self)
        
        presenter.view = self
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        self.presenter = presenter
    }
    
    private func setup()
    {
        setupTeamsTableView()
    }
    
    private func setupTeamsTableView()
    {
        teamsTableView.register(nib: TeamTableViewCell.self)
        teamsTableView.tableFooterView = UIView()
    }
    
    // MARK:- Methods
    
    private func getPremierLeagueTeamsForCurrentSeason()
    {
        presenter?.getPremierLeagueTeams(for: season)
    }
    
    private func display(dataSource: TeamsListDataSource)
    {
        dataSource.delegate = self
        teamsTableView.dataSource = dataSource
        teamsTableView.delegate = dataSource
        teamsTableView.reloadData()
    }
    
    private func display(competition: CompetitionViewModel)
    {
        title = competition.name
    }
}

// MARK:- Presenter ~> View

extension LeagueTeamsViewController: LeagueTeamsPresenterToViewProtocol
{
    func display(teams dataSource: TeamsListDataSource, in competition: CompetitionViewModel)
    {
        display(dataSource: dataSource)
        display(competition: competition)
    }
    
    func display(error message: Alert)
    {
        showAlert(.app, message)
    }
}

// MARK:- DataSourceDelegate

extension LeagueTeamsViewController: DataSourceDelegate
{
    func didSelect(_ item: Any?, at indexPath: IndexPath)
    {
        guard let team = item as? TeamViewModel else { return }
        
        teamsTableView.deselectRow(at: indexPath, animated: true)
        presenter?.navigateToTeamInfo(with: team)
    }
}
