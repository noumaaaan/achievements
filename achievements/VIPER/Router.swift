//
//  Router.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class AchievementRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        
        let router = AchievementRouter()
        
        var view: AnyView = AchievementsView()
        var presenter: AnyPresenter = AchievementPresenter()
        var interactor: AnyInteractor = AchievementInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
