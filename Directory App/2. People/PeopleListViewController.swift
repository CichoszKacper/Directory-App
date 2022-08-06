//
//  PeopleListViewController.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//

import UIKit

class PeopleListViewController: ModelledViewController<PeopleListViewModel> {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.downloadPeopleData()
        self.tableView.register(UINib(nibName: "PeopleListTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "PeopleListTableViewCell")
    }
    
    override func updateView(_ type: PeopleListViewModel.UpdateType) {
        switch type {
        case .reload:
            self.tableView.reloadOnMainThread()
        }
    }
}

extension PeopleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.peopleData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleListTableViewCell", for: indexPath) as! PeopleListTableViewCell
        cell.setupCell(person: self.viewModel.peopleData?[indexPath.row])
        return cell
    }
}

extension PeopleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let people = self.viewModel.peopleData {
            self.navigationController?.pushViewController(PersonDetailsViewController(viewModel: PersonDetailsViewModel(person: people[indexPath.row], people: people)),
                                                          animated: true)
        }
    }
}
