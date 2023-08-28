//
//  MovieDataModel.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import Foundation


import Foundation

let APIKey = "0e6e9f8743ac3144e0a43faa485fe233"

struct MovieResult : Decodable {
    let page : Int
    let results : [Movie]
    let total_pages : Int
    let total_results : Int
}
struct TVResult : Decodable {
    let page : Int
    let results : [TV]
    let total_pages : Int
    let total_results : Int
}
struct Movie: Hashable, Decodable, Identifiable {
    var id : Int
    var overview : String
    var poster_path : String
    var release_date :String
    var title : String
}

struct TV:Decodable,Identifiable{
    var id : Int
    var poster_path : String
}
///For movies in new

//coming soon
struct UpcomingMovieResult : Decodable {
    let dates : Dates
    let page : Int
    let results : [Movie]
    let total_pages : Int
    let total_results : Int
}

struct Dates:Decodable{
    var maximum : String
    var minimum :String
}



