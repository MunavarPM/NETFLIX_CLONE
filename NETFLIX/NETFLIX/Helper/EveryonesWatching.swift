//
//  EveryonesWatching.swift
//  Netflix
//
//  Created by alkesh s on 25/06/23.
//

import SwiftUI

struct EveryonesWatching: View {
    
    @State var movie : Movie
    @State var width : CGFloat
    @State var height : CGFloat
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
            VStack(alignment: .leading){
                viewModel.poster(poster_path: movie.poster_path, width: width, height: height)
                HStack{
                    Text(movie.title)
                    Spacer()
                    VStack{
                        Image(systemName: "paperplane")
                        Text("Share")
                            .foregroundColor(.secondary)
                    }
                    VStack{
                        Image(systemName: "plus")
                        Text("My List")
                            .foregroundColor(.secondary)
                    }
                    VStack{
                        Image(systemName: "play.fill")
                        Text("Play")
                            .foregroundColor(.secondary)
                    }
                }
                Text(movie.overview)
                    .foregroundColor(.secondary)
                
            }
            .padding(.horizontal)
            .frame(width: width,height: 400)
    }
}

struct EveryonesWatching_Previews: PreviewProvider {
    static var previews: some View {
        EveryonesWatching(movie: Movie(id: 0, overview: "", poster_path:"", release_date: "", title: ""), width: 0, height: 0)
            .environmentObject(MovieViewModel())
            .preferredColorScheme(.dark)
    }
}
