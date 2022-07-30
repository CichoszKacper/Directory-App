//
//  PersonDetailsViewModel.swift
//  Directory App
//
//  Created by Kacper Cichosz on 25/07/2022.
//

import Foundation
import UIKit


class PersonDetailsViewModel: ViewModel, ViewModelProtocol {
    var person: PeopleDataModel
    
    init (person: PeopleDataModel) {
        self.person = person
    }
    var update: ((PersonDetailsViewModel.UpdateType) -> Void)?
    enum UpdateType {
    }
    var error: ((PersonDetailsViewModel.ErrorType) -> Void)?
    enum ErrorType {
    }
    
    func profileImage(imageView: UIImageView) {
        if let url = URL(string: person.avatar) {
            imageView.set(url: url) { result in
                switch result {
                case .failure(_):
                    imageView.image = UIImage(named: "imageProfilePlaceholder")
                case .success(let image):
                    imageView.image = image
                }
            }
        }
    }
    
    func getDate() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        guard let date = formatter.date(from: self.person.createdAt),
              let day = Calendar.current.dateComponents([.day, .month, .year], from: date).day,
              let month = Calendar.current.dateComponents([.day, .month, .year], from: date).month,
              let year = Calendar.current.dateComponents([.day, .month, .year], from: date).year else {
            return ""
        }
        
        return "\(Constants.People.AccountAddedString)\(day).\(month).\(year)"
    }
}
