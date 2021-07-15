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
    // MARK:- Properties
    
    private let team: TeamViewModel
    
    init(team: TeamViewModel)
    {
        self.team = team
        super.init(nibName: Self.identifier, bundle: nil)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("use init(teamID: Int)")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = team.name
    }
}
