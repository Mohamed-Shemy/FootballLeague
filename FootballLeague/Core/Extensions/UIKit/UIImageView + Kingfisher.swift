//
//  UIImageView + Kingfisher.swift
//  FootballLeague
//
//  Created by Mohamed Shemy on Thu 15 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Kingfisher

extension UIImageView
{
    func setImage(from path: String, placeholder: UIImage? = nil, hideIfNil: Bool = false)
    {
        let url = URL(string: path)
        kf.indicatorType = .activity
        kf.setImage(with: url, placeholder: placeholder, options: [.processor(SVGImgProcessor())])
        { [weak self] result in
            
            if case let .success(result) = result
            {
                self?.image = result.image
            }
            else
            {
                self?.image = placeholder
            }
            
            self?.isHidden = self?.image == nil && hideIfNil
        }
    }
}
