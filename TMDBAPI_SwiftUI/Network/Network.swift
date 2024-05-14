//
//  Network.swift
//  TMDBAPI_SwiftUI
//
//  Created by 박지은 on 5/14/24.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    private init() { }
    
    func requestTMDBAPI() async throws -> MovieModel {
        
        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/week?language=ko-KR")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMmVkZDcwYzQyOTdmYzdlMDRjN2E4MWM2ZWEwZmM2MSIsInN1YiI6IjY1YTY1NzFhOTdhNGU2MDEyMjRmNzI1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4P8liPEvxHDORdxA1pbuKeiE0yPwdAtEraVn3HW1eTU", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.unknown
        }
        
        let decodedData = try JSONDecoder().decode(MovieModel.self, from: data)
        return decodedData
    }
}
