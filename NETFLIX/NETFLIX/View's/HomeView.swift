//
//  HomeView.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment:.leading){
                    ZStack {
                        if viewModel.popularMovie.isEmpty{
                            Image(systemName: "arrow.clockwise.icloud")
                                .font(.system(size: 80))
                                .frame(width: 150, height: 350)
                        } else {
                            viewModel.poster(poster_path: viewModel.popularMovie[0].poster_path, width: 400, height: 550)
                        }
                        Spacer()
                        VStack {
                            HStack(alignment: .center){
                                Spacer()
                                VStack{
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20,height: 20)
                                    Text("My List")
                                        .fontWeight(.medium)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 100,height: 40)
                                    HStack {
                                        Image(systemName: "play.fill")
                                        Text("Play")
                                    }
                                    .foregroundColor(.black)
                                }
                                Spacer()
                                VStack{
                                    Image(systemName: "info.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20,height: 20)
                                    Text("Info")
                                        .fontWeight(.medium)
                                }
                                Spacer()
                            }
                        }
                        .padding(.top, 450)
                        
                        VStack {
                            navBar
                            Spacer()
                        }
                    }
                    .background(Color.black.ignoresSafeArea(.all))
                    .padding(.bottom,50)
                    .frame(width: 400, height: 500)
                    Text("Popular Movies On Netflix")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    
                    if viewModel.popularMovie.isEmpty {
                        ProgressView()
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.system(size: 50))
                            .frame(width: 150, height: 350)
                    } else {
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.popularMovie){ movie in
                                    viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                    
                                }
                            }
                        }
                    }
                    Text("Trending Now")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    
                    if viewModel.trending.isEmpty {
                        ProgressView()
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.system(size: 50))
                            .frame(width: 150, height: 350)
                    } else {
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.trending){ movie in
                                    viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                }
                            }
                        }
                    }
                    Text("Popular TV shows")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    
                    if viewModel.popularTV.isEmpty {
                        ProgressView()
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.system(size: 50))
                            .frame(width: 150, height: 350)
                    } else {
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.popularTV) { movie in
                                    viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                }
                            }
                        }
                    }
                    Text("Top Movies")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    
                    if viewModel.topMovie.isEmpty{
                        ProgressView()
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.system(size: 50))
                            .frame(width: 150, height: 350)
                    } else {
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(Array(viewModel.topMovie.enumerated().prefix(10)),id: \.element){(index,movie) in
                                    ZStack{
                                        viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                            .padding(.leading,50)
                                        StrokeText(text: "\(index)", width: 0.5, color: .white)
                                            .foregroundColor(.black)
                                            .font(.system(size: 150, weight: .bold))
                                            .padding(.trailing,100)
                                            .padding(.top,90)
                                        
                                    }
                                    .frame(width: 200,height: 200)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear() {
                viewModel.fetchPopularMovie()
                viewModel.fetchTopMovie()
                viewModel.fetchPopularTV()
                viewModel.fetchTrending()
            }
            .ignoresSafeArea()
        }
    }
    var navBar: some View {
        VStack(spacing: 20) {
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "rectangle.badge.person.crop")
                        .font(.system(size: 30))
                        .frame(width: 50, height: 50)
                }
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 70)
            HStack(spacing: 30) {
                Button("Series", action: {})
                Button("Movie", action: {})
                Button {
                    
                } label: {
                    HStack(alignment: .firstTextBaseline) {
                        Text("Category")
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20))
                    }
                }

            }
            .font(.system(size: 25))
            .padding(.bottom, 30)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.99),.black.opacity(0.9),.black.opacity(0.8), .black.opacity(0.7), .black.opacity(0)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MovieViewModel())
    }
}

struct MovieSlide: View {
    @EnvironmentObject var viewModel: MovieViewModel
    @State var list : [Movie]
    var body: some View {
        if list.isEmpty{
            Text("Empty")
        } else {
            ScrollView(.horizontal){
                HStack{
                    ForEach(list){ movie in
                        viewModel.poster(poster_path: movie.poster_path, width: 150,height: 200)
                    }
                }
            }
        }
    }
}
