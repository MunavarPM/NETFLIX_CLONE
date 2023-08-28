//
//  MovieViewModel.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import Foundation
import SwiftUI

@MainActor
class MovieViewModel: ObservableObject {
    
    @Published var popularMovie : [Movie] = []
    @Published var trending : [TV] = []
    @Published var popularTV : [TV] = []
    @Published var topMovie : [Movie] = []
    @Published var upComing : [Movie] = []
    @Published var search : [Movie] = []
    
    func fetchTrending(){
        let trendingURL = URL(string:"https://api.themoviedb.org/3/trending/all/day?language=en-US&api_key=\(APIKey)")!
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: trendingURL)
                let movieResult = try JSONDecoder().decode(TVResult.self, from: data)
                trending = movieResult.results
            }catch{
                print(error.localizedDescription+"trending")
            }
        }
    }
    
    func fetchPopularMovie(){
        let popularMovieURL = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=\(APIKey)")!
        Task{
            do{
                let (data,_) = try  await URLSession.shared.data(from: popularMovieURL)
                let movieResult = try JSONDecoder().decode(MovieResult.self, from: data)
                popularMovie = movieResult.results
            }catch{
                print(error.localizedDescription+"popmovie")
            }
        }
    }
    
    func fetchPopularTV(){
        let popularTVURL = URL(string: "https://api.themoviedb.org/3/trending/tv/day?language=en-US&api_key=\(APIKey)")!
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: popularTVURL)
                let movieResult = try JSONDecoder().decode(TVResult.self, from: data)
                popularTV = movieResult.results
            }catch{
                print(error.localizedDescription+"poptv")
            }
        }
    }
    
    func fetchTopMovie(){
        let topMovieURL = URL(string:"https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=\(APIKey)")!
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: topMovieURL)
                let movieResult = try JSONDecoder().decode(MovieResult.self, from: data)
                topMovie = movieResult.results
            }catch{
                print(error.localizedDescription+"top")
            }
        }
    }
    
    func fetchComingSoon(){
        let comingSoonMovieURL = URL(string:"https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=\(APIKey)")!
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: comingSoonMovieURL)
                let movieResult = try JSONDecoder().decode(UpcomingMovieResult.self, from: data)
                upComing = movieResult.results
            }catch{
                print(error.localizedDescription+"upcoming")
            }
        }
        
    }
    
    func search(keyword:String){
        let seachURL = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(keyword)&api_key=\(APIKey)")!
        print(seachURL)
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: seachURL)
                let movieResult = try JSONDecoder().decode(MovieResult.self, from: data)
                search = movieResult.results
            }catch{
                print(error.localizedDescription+"upcoming")
            }
        }
    }
    
    func poster(poster_path:String,width:CGFloat,height:CGFloat)->some View{
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
        return AsyncImage(url: url)
        { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width,height: height)
                .clipped()
                .cornerRadius(10)
        } placeholder: {
            ProgressView()
        }
    }
    
    
  
    func getDateMonth(dateString:String)->(String,Int){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            
            let monthSymbol = dateFormatter.monthSymbols[calendar.component(.month, from: date) - 1]
            let day = calendar.component(.day, from: date)
            
            return(monthSymbol,day)
            //print(formattedDate) // Outputs: "July 3"
        } else {
            print("Invalid date string")
            return ("0",0)
        }
    }
    
}
