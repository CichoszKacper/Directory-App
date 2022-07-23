//
//  MainMenuViewController.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import UIKit

let MainBrandColour = "#C40202"

class MainMenuViewController: ModelledViewController<MainMenuViewModel> {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "Virgin Money"
        self.titleLabel.textColor = UIColor(hexString: MainBrandColour)
        self.backgroundView.addWaveBackground(hexColour: MainBrandColour)
    }
}
