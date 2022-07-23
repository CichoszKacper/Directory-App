//
//  UIImageViewExtension.swift
//  Directory App
//
//  Created by Kacper Cichosz on 24/07/2022.
//

import UIKit

extension UIImageView {
    func set(url: URL, completion: ((Result<UIImage, NetworkError>) -> Void)? = nil) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion?(.success(image))
                    self.image = image
                }
            } else {
                DispatchQueue.main.async {
                    completion?(.failure(.canNotProcessData))
                }
            }
        }
    }
}
