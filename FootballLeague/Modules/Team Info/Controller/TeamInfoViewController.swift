//
//  TeamInfoViewController.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Wed 14 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class TeamInfoViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var noPlayersLabel: UILabel!
    
    // MARK:- Properties
    
    private let team: TeamViewModel
    var presenter: TeamInfoViewToPresenterProtocol?
    
    // MARK:- init
    
    init(team: TeamViewModel)
    {
        self.team = team
        super.init(nibName: Self.identifier, bundle: nil)
        setupComponants()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("use init(teamID: Int)")
    }
    
    // MARK:- Life Cycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
        display(team: team)
        getTeamInfo()
        addWebsiteNavigationItem()
    }
    
    // MARK:- Setup
    
    private func setupComponants()
    {
        let presenter = TeamInfoPresenter()
        let interactor = TeamInfoInteractor()
        
        presenter.view = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        self.presenter = presenter
    }
    
    private func setup()
    {
        setupPlayersTableView()
    }
    
    private func setupPlayersTableView()
    {
        playersTableView.register(class: PlayerTableViewCell.self)
        playersTableView.tableFooterView = UIView()
    }
    
    // MARK:- Methods
    
    private func addWebsiteNavigationItem()
    {
        let websiteItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(websiteButtonDidTapped))
        navigationItem.rightBarButtonItem = websiteItem
    }
    
    private func getTeamInfo()
    {
        presenter?.getTeamInfo(by: team.id)
    }
    
    private func display(team info: TeamViewModel)
    {
        teamLogoImageView.setImage(from: info.crestUrl)
        title = info.name
    }
    
    private func display(player dataSource: PLayersDataSource)
    {
        dataSource.cellHeight = 32
        playersTableView.dataSource = dataSource
        playersTableView.delegate = dataSource
        playersTableView.reloadData()
        
        noPlayersLabel.isHidden = !dataSource.isEmpty
    }
    
    private func openTeamWebsite()
    {
        guard let url = URL(string: team.website) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK:- Action
    
    @objc func websiteButtonDidTapped(_ sender: Any)
    {
        openTeamWebsite()
    }
}

// MARK:- Presenter ~> View

extension TeamInfoViewController: TeamInfoPresenterToViewProtocol
{
    func display(team info: TeamViewModel, players dataSource: PLayersDataSource)
    {
        display(team: info)
        display(player: dataSource)
    }
    
    func display(error message: Alert)
    {
        showAlert(.app, message)
    }
}
