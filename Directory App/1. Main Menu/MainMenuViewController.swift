//
//  MainMenuViewController.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import UIKit

class MainMenuViewController: ModelledViewController<MainMenuViewModel> {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.navigationController?.pushViewController(PeopleListViewController(viewModel: PeopleListViewModel()), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.backgroundView.addWaveBackground(hexColour: Constants.MainBrandColour)
    }
    
    private func setupUI() {
        self.titleLabel.text = Constants.VirginMoneyTitle
        self.titleLabel.textColor = UIColor(hexString: Constants.MainBrandColour)
        self.titleLabel.font = UIFont(name: Constants.Font.VirginMoneyTitleFont, size: Constants.Font.VirginMoneyTitleFontSize)
    }
}
