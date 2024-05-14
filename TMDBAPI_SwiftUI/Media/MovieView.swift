//
//  BookView.swift
//  TMDBAPI_SwiftUI
//
//  Created by 박지은 on 5/12/24.
//

import SwiftUI

struct MovieView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    private var column: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: column) {
                ForEach(viewModel.output.movieList, id: \.id) { item in
                    RowView(data: item)
                }
            }
        }
        .task {
            viewModel.input.viewOnAppear.send(())
        }
    }
}

#Preview {
    MovieView()
}
