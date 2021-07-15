//
//  BaseAPIParametersProtocol.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya

protocol BaseAPIParametersProtocol{}

extension BaseAPIParametersProtocol
{
    var baseDomain: String { "https://api.football-data.org/v2/" }
    var baseURL: URL { URL(string: baseDomain)! }
    
    var headers: [String: String]
    {
        [
            "Content-type": "application/json",
            "X-Auth-Token": "283a2f1bb3904520b9949c5e6a0b0a28"
        ]
    }
    
    var authorizationType: AuthorizationType?
    {
        .custom("API Key")
    }
}
