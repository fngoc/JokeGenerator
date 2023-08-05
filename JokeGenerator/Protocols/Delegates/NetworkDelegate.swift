//
//  File.swift
//  JokeGenerator
//
//  Created by Виталий Хайдаров on 01.08.2023.
//

import Foundation

protocol NetworkDelegate: AnyObject {
    
    func setJoke(setup: String, punchline: String)
}
