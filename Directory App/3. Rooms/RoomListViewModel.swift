//
//  RoomListViewModel.swift
//  Directory App
//
//  Created by Kacper Cichosz on 06/08/2022.
//

import Foundation

class RoomListViewModel: ViewModel, ViewModelProtocol {
    var rooms: [RoomsDataModel]?
    var filteredRooms: [RoomsDataModel]?
    
    var update: ((RoomListViewModel.UpdateType) -> Void)?
    enum UpdateType {
        case reload
    }
    var error: ((RoomListViewModel.ErrorType) -> Void)?
    enum ErrorType {
    }
    
    func downloadRoomData() {
        NetworkManager().downloadData(classType: [RoomsDataModel].self,
                                      settingsKey: Constants.Networking.NetworkingAPIKey,
                                      substitution: APIEndpoints.rooms.rawValue) { [weak self] roomsData, _, error in
            guard error == nil else {
                return
            }
            
            self?.filteredRooms = roomsData
            self?.rooms = roomsData
            self?.update?(.reload)
        }
    }
    
    func freeRooms() {
        self.filteredRooms = self.filteredRooms?.filter {!$0.isOccupied}
        self.update?(.reload)
    }
    
    func allRooms() {
        self.filteredRooms = self.rooms
        self.update?(.reload)
    }
}
