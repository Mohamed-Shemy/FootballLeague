//
//  Int.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension Int
{
    var stringValue: String { "\(self)" }
    
    func inRange<T>(of array: Array<T>) -> Bool
    {
        guard self >= 0 else { return false }
        
        return 0..<array.count ~= self
    }
}
