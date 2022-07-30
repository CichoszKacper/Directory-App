//
//  PeopleListTableViewCell.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import UIKit

class PeopleListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var firstNameTitleLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var jobTitleTitleLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    
    override func awakeFromNib() {
        self.setupUI()
    }
    
    func setupCell(person: PeopleDataModel?) {
        guard let person = person,
              let imageURL = URL(string: person.avatar) else {
                  return
              }
        
        self.profileImageView.set(url: imageURL) { result in
            switch result {
            case .failure(_):
                self.profileImageView.image = UIImage(named: "imageProfilePlaceholder")
            case .success(let image):
                self.profileImageView.image = image
            }
        }
        self.nameLabel.text = [person.firstName, person.lastName].joined(separator: " ")
        self.emailLabel.text = person.email.lowercased()
        self.jobTitleLabel.text = person.jobtitle
    }
    
    func setupUI() {
        self.profileImageView.makeRounded(borderWidth: 3)
        self.firstNameTitleLabel.text = Constants.People.NameTitle
        self.firstNameTitleLabel.textColor = Constants.MainBrandColour
        self.emailTitleLabel.text = Constants.People.EmailTitle
        self.emailTitleLabel.textColor = Constants.MainBrandColour
        self.jobTitleTitleLabel.text = Constants.People.JobTitleTitle
        self.jobTitleTitleLabel.textColor = Constants.MainBrandColour
    }
}
