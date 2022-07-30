//
//  PersonDetailsViewController.swift
//  Directory App
//
//  Created by Kacper Cichosz on 25/07/2022.
//

import UIKit

class PersonDetailsViewController: ModelledViewController<PersonDetailsViewModel> {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailsBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var colourLabel: UILabel!
    @IBOutlet weak var accountDateLabel: UILabel!
    @IBOutlet var detailsTitleLabels: [UILabel]!
    @IBOutlet var detailsViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        for label in self.detailsTitleLabels {
            label.textColor = Constants.MainBrandColour
        }
        for view in self.detailsViews {
            view.layer.cornerRadius = 15
        }
        self.detailsBackgroundView.backgroundColor = Constants.MainBrandColour
        self.imageView.makeRounded(borderWidth: 5)
        self.viewModel.profileImage(imageView: self.imageView)
        self.nameLabel.text = [self.viewModel.person.firstName, self.viewModel.person.lastName].joined(separator: " ")
        self.emailLabel.text = self.viewModel.person.email.lowercased()
        self.jobTitleLabel.text = self.viewModel.person.jobtitle
        self.colourLabel.text = self.viewModel.person.favouriteColor.capitalized
        self.accountDateLabel.text = self.viewModel.getDate()
    }
}
