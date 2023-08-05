//
//  AlertPresenter.swift
//  JokeGenerator
//
//  Created by Виталий Хайдаров on 01.08.2023.
//

import UIKit

class AlertPresenter {
    
    private weak var delegate: AlertPresenterDelegate?
    
    init(delegate: AlertPresenterDelegate) {
        self.delegate = delegate
    }
}

extension AlertPresenter: AlertPresenterProtocol {
    
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            model.action()
        }
        alert.addAction(action)
        
        guard let controller = delegate as? UIViewController else {
            print("Something wrong with delegate")
            return
        }
        
        controller.present(alert, animated: true)
    }
}
