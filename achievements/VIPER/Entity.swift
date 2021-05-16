//
//  Entity.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation

struct Response: Codable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
}

struct Overview: Codable {
    let title: String
}

struct Achievement: Codable {
    let id, progress, total: Int
    let level, bg_image_url: String
    let accessible: Bool
}
