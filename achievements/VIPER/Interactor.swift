//
//  Interactor.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func getAchievements()
}

class AchievementInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getAchievements() {
        let filename = "achievements"
        
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonData = try JSONDecoder().decode(Response.self, from: data)
                let title = jsonData.overview.title
                
                if (jsonData.success && jsonData.status == 200) {
                    let entities = jsonData.achievements
                    self.presenter?.interactorDidFetchAchievements(with: entities, title: title)
                } else {
                    print("Error decoding JSON data")
                }
            } catch {
                self.presenter?.showError(error: "Something went wrong")
                print("Something went wrong")
            }
            
        } else {
            print("Unable to find \(filename).json")
        }
        
    }
    
}
