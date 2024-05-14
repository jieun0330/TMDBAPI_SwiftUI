//
//  MovieModel.swift
//  TMDBAPI_SwiftUI
//
//  Created by 박지은 on 5/14/24.
//

import Foundation

struct MovieModel: Hashable, Decodable {
    let results: [Movie]
}

struct Movie: Hashable, Decodable {
    let id: Int
    let title: String
    let overview: String // 설명
    let poster_path: String // 포스터 이미지
}
