//
//  TeamTableViewCell.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class TeamTableViewCell: ConfigurableTableViewCell
{
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        reset()
    }
    
    func configure(_ team: TeamViewModel, at indexPath: IndexPath)
    {
        teamLogoImageView.setImage(from: team.crestUrl, hideIfNil: true)
        teamNameLabel.text = team.name
    }
    
    private func reset()
    {
        teamLogoImageView.image = nil
        teamNameLabel.text = ""
    }
}
