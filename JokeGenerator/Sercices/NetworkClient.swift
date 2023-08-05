//
//  NetworkClient.swift
//  JokeGenerator
//
//  Created by Виталий Хайдаров on 01.08.2023.
//

import Foundation

class NetworkClient {
    
    private weak var delegate: NetworkDelegate?
    
    init(delegate: NetworkDelegate) {
        self.delegate = delegate
    }
    
    func loadJoke() {
        var joke: JokeModel?
        let request = URLRequest(url: URL(string: "https://official-joke-api.appspot.com/random_joke")!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            // Проверяем, пришла ли ошибка
            if let error = error {
                print("Error: \(String(describing: error))")
                return
            }
            
            // Проверяем, что нам пришёл успешный код ответа
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            // Если что не так с данными
            guard let data = data else {
                print("Something wrong with data")
                return
            }
            
            do {
                joke = try JSONDecoder().decode(JokeModel.self, from: data)
                guard let joke = joke else {
                    print("Decode error 2")
                    return
                }
            } catch {
                print("Decode error")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard let controller = delegate else { return }
                guard let joke = joke else { return }
                controller.setJoke(setup: joke.setup, punchline: joke.punchline)
            }
        }
        task.resume()
    }
}
