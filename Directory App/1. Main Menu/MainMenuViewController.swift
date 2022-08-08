//
//  MainMenuViewController.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.backgroundView.addWaveBackground(colour: Constants.MainBrandColour)
    }
    
    private func setupUI() {
        self.titleLabel.text = Constants.VirginMoneyTitle
        self.titleLabel.textColor = Constants.MainBrandColour
        self.titleLabel.font = UIFont(name: Constants.Font.VirginMoneyTitleFont, size: Constants.Font.VirginMoneyTitleFontSize)
    }
}
