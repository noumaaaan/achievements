//
//  Presenter.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchAchievements(with result: Result<[Achievement], Error>, title: String)
}

class AchievementPresenter: AnyPresenter {
    
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getAchievements()
        }
    }
    var view: AnyView?
    
    func interactorDidFetchAchievements(with result: Result<[Achievement], Error>, title: String) {
//        view?.setTitle(with: title)
        switch result {
            case .success(let achievements):
                view?.update(with: achievements)
            case .failure:
                view?.update(with: "Something went wrong")
        }
    }
}
