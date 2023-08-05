//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Виталий Хайдаров on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Firs stack
    @IBOutlet private weak var jokeIdStackView: UIStackView!
    @IBOutlet private weak var jokeIdTextLabel: UILabel!
    @IBOutlet private weak var jokeIdLabel: UILabel!

    // Second stack
    @IBOutlet private weak var typeStackView: UIStackView!
    @IBOutlet private weak var typeTextLabel: UILabel!
    @IBOutlet private weak var typeNameLabel: UILabel!
    
    // Third stack
    @IBOutlet private weak var jokeStackView: UIStackView!
    @IBOutlet private weak var setupTextLabel: UILabel!
    @IBOutlet private weak var jokeInsideStackView: UIStackView!
    @IBOutlet private weak var borderTopView: UIView!
    @IBOutlet private weak var jokeTextLabel: UILabel!
    @IBOutlet weak var borderButtonView: UIView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var reloadJokeButton: UIButton!
    @IBOutlet weak var showPunchlineButton: UIButton!
    
    private var alertPresenter: AlertPresenterProtocol?
    private var networkClient: NetworkClient?
    private var punchline: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alertPresenter = AlertPresenter(delegate: self)
        self.networkClient = NetworkClient(delegate: self)
        networkClient?.loadJoke()
        
        // First stack config
        jokeIdStackView.isLayoutMarginsRelativeArrangement = true
        jokeIdStackView.directionalLayoutMargins.leading = 24
        jokeIdStackView.directionalLayoutMargins.trailing = 24
        jokeIdStackView.layer.cornerRadius = 8
        jokeIdStackView.layer.borderWidth = 2
        jokeIdStackView.layer.borderColor = UIColor.black.cgColor
        
        // Second stack config
        typeStackView.isLayoutMarginsRelativeArrangement = true
        typeStackView.directionalLayoutMargins.leading = 24
        typeStackView.directionalLayoutMargins.trailing = 24
        typeStackView.layer.cornerRadius = 8
        typeStackView.layer.borderWidth = 2
        typeStackView.layer.borderColor = UIColor.black.cgColor
        
        // Third stack config
        jokeStackView.isLayoutMarginsRelativeArrangement = true
        jokeStackView.directionalLayoutMargins.leading = 24
        jokeStackView.directionalLayoutMargins.trailing = 24
        jokeStackView.directionalLayoutMargins.top = 24
        jokeStackView.directionalLayoutMargins.bottom = 24
        jokeStackView.layer.cornerRadius = 8
        jokeStackView.layer.borderWidth = 2
        jokeStackView.layer.borderColor = UIColor.black.cgColor
        
        // Fore stack config
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        reloadJokeButton.layer.cornerRadius = 8
        reloadJokeButton.layer.borderWidth = 2
        reloadJokeButton.layer.borderColor = UIColor.black.cgColor
        showPunchlineButton.layer.cornerRadius = 8
        showPunchlineButton.layer.borderWidth = 2
        showPunchlineButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction private func showPunchlineAction(_ sender: UIButton) {
        alertPresenter?.showAlert(model: AlertModel(
            title: "Punchline",
            message: self.punchline!) { [weak self] in
                guard let self = self else { return }
                self.networkClient?.loadJoke()
            }
        )
    }
}

extension ViewController: AlertPresenterDelegate {
}

extension ViewController: NetworkDelegate {
    
    func setJoke(setup: String, punchline: String) {
        self.jokeTextLabel.text = setup
        self.punchline = punchline
    }
}
