//
//  Presenter.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchAchievements(with result: [Achievement], title: String)
    func showError(error: String)
}

class AchievementPresenter: AnyPresenter {
    
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getAchievements()
        }
    }
    var view: AnyView?
    
    func interactorDidFetchAchievements(with result: [Achievement], title: String) {
        view?.setTitle(with: title)
        
        view?.update(with: result)
    }
    
    func showError(error: String) {
        view?.displayError(with: error)
    }
}
