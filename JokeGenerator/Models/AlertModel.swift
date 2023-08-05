//
//  AlertModel.swift
//  JokeGenerator
//
//  Created by Виталий Хайдаров on 01.08.2023.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let action: () -> Void
}
