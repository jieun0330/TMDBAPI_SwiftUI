//
//  MediaViewModel.swift
//  TMDBAPI_SwiftUI
//
//  Created by 박지은 on 5/12/24.
//

import Foundation
import Combine

class MovieViewModel: ViewModelType {
    
    var cancellables = Set<AnyCancellable>()
    
    var input = Input()
    
    @Published var output = Output()

    init() {
        transform()
    }
}

extension MovieViewModel {
    struct Input {
        var viewOnAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var movieList: [Movie] = []
    }
    
    func transform() {
        input.viewOnAppear
            .sink { [weak self] _ in
                guard let self else { return }
                    Task {
                        await self.fetchMovie()
                    }
            }
            .store(in: &cancellables)
    }
    
    func fetchMovie() async {
        do {
            output.movieList = try await Network.shared.requestTMDBAPI().results
        } catch {
            output.movieList = []
        }
    }
}
