//
//  Constants.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import Foundation

enum APIEndpoints: String {
    case people
    case rooms
}

struct Constants {
    struct Networking {
        static let NetworkingAPIKey = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    }
    struct Font {
        static let VirginMoneyTitleFont = "HelveticaNeue"
        static let VirginMoneyTitleFontSize = 30.0
    }
    static let VirginMoneyTitle = "VIRGIN MONEY"
    static let MainBrandColour = "#C40202"
}
