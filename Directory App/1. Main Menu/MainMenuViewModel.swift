//
//  MainMenuViewModel.swift
//  Directory App
//
//  Created by Kacper Cichosz on 23/07/2022.
//


class MainMenuViewModel: ViewModel, ViewModelProtocol {
    var update: ((MainMenuViewModel.UpdateType) -> Void)?
    enum UpdateType {
    }
    var error: ((MainMenuViewModel.ErrorType) -> Void)?
    enum ErrorType {
    }
    
}
