//
//  PeopleListViewModel.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import Foundation

class PeopleListViewModel: ViewModel, ViewModelProtocol {
    var peopleData: [PeopleDataModel]? {
        didSet {
            self.update?(.reload)
        }
    }
    
    var update: ((PeopleListViewModel.UpdateType) -> Void)?
    enum UpdateType {
        case reload
    }
    var error: ((PeopleListViewModel.ErrorType) -> Void)?
    enum ErrorType {
    }
    
    func downloadPeopleData() {
        NetworkManager().downloadData(classType: [PeopleDataModel].self,
                                      settingsKey: Constants.Networking.NetworkingAPIKey,
                                      substitution: APIEndpoints.people.rawValue) { [weak self] peopleData, _, error in
            guard error == nil else {
                return
            }

            self?.peopleData = peopleData
        }
    }
}
