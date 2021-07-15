//
//  Date.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension Date
{
    var year: Int { getDateComponents(for: [.year]).year ?? 1 }
    
    func getDateComponents(for components: Set<Calendar.Component>) -> DateComponents
    {
        let calendar = Calendar.current
        let result = calendar.dateComponents(components, from: self)
        return result
    }
}
