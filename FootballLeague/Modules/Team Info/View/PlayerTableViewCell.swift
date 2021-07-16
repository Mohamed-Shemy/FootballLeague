//
//  PlayerTableViewCell.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class PlayerTableViewCell: ConfigurableTableViewCell
{
    func configure(_ player: PlayerViewModel, at indexPath: IndexPath)
    {
        textLabel?.text = player.name
    }
}
