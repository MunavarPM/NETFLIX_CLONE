//
//  SearchList.swift
//  Netflix
//
//  Created by alkesh s on 30/06/23.
//

import SwiftUI

struct SearchList: View {
    
    @State var movie : Movie
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        List(viewModel.popularMovie, rowContent: {movie in
            SearchList(movie: movie)
        })
        .listStyle(.plain)
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(movie:  Movie(id: 0, overview: "", poster_path: "", release_date: "", title: ""))
            .environmentObject(MovieViewModel())
            .preferredColorScheme(.dark)
    }
}
