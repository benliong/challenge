//
//  UIImageViewExtensions.swift
//  deliveries_iOS
//
//  Created by XCodeClub on 2017-05-23.
//  Copyright © 2017 Ben Liong. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(withURL url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
    func setImage(withURLString link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        setImage(withURL:url, contentMode:contentMode)
    }
}
