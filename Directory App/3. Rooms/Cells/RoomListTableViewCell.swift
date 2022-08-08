//
//  RoomListTableViewCell.swift
//  Directory App
//
//  Created by Kacper Cichosz on 06/08/2022.
//

import UIKit

class RoomListTableViewCell: UITableViewCell {
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var occupancyLabel: UILabel!
    @IBOutlet weak var isOccupiedLabel: UILabel!
    @IBOutlet weak var isOccupiedView: UIView!
    
    func setupUI(room: RoomsDataModel) {
        self.idView.madeRounded(borderWidth: Constants.People.ImageBorderWidth,
                                borderColor: Constants.MainBrandColour.cgColor)
        self.idLabel.text = room.id
        self.idLabel.textColor = Constants.MainBrandColour
        self.occupancyLabel.text = "Room max occupancy is: \(room.maxOccupancy)"
        self.isOccupiedLabel.text = room.isOccupied ? "Rooms is full" : "Room is empty"
        self.isOccupiedView.backgroundColor = room.isOccupied ? .systemRed : .systemGreen
    }
}
