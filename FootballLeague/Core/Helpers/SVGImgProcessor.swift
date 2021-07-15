//
//  SVGImgProcessor.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Kingfisher
import SVGKit

struct SVGImgProcessor:ImageProcessor
{
    var identifier: String = "com.shemy.FootballLeague"
    
    func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage?
    {
        switch item
        {
            case .image(let image): return image
                
            case .data(let data):
                let imsvg = SVGKImage(data: data)
                return imsvg?.uiImage
        }
    }
}
