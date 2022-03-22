//
//  User.swift
//  AULA11_Network
//
//  Created by SP11601 on 21/03/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
