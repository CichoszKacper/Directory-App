//
//  Constants.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import Foundation
import UIKit

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
    struct People {
        static let NameTitle = "Name:"
        static let EmailTitle = "Email:"
        static let JobTitleTitle = "Job Title:"
        static let ImageCornerRadius = 15.0
        static let ImageBorderWidth = 5.0
        static let DetailsViewCornerRadius = 15.0
        static let AccountAddedString = "Account added: "
        static let imagePlaceholder = UIImage(named: "imageProfilePlaceholder")!
        
    }
    static let VirginMoneyTitle = "VIRGIN MONEY"
    static let MainBrandColour = UIColor(hexString: "#C40202")
}
