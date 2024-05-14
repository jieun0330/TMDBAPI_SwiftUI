//
//  RowView.swift
//  TMDBAPI_SwiftUI
//
//  Created by 박지은 on 5/14/24.
//

import SwiftUI

struct RowView: View {
    
    let data: Movie
    
    var body: some View {
        VStack {
            Text(data.title)
            
//            Text(data.overview)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.yellow)
    }
}

//#Preview {
//    RowView()
//}
