//
//  MovieCodepath.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/27/20.
//

import Foundation

class MovieCodepath {
    var poster_path: String?
    var backdrop_path: String?
    var vote_count: Int
    var popularity: Double
    var adult: Bool
    var original_language: String
    var original_title: String
    var title: String
    var vote_average: Double
    var overview: String
    var release_date: String
    
    init(dict: [String: Any]) {
//        poster_path = URL(string: "https://image.tmdb.org/t/p/w500\(dict["poster_path"] ?? "")")!
        poster_path = dict["poster_path"] as! String
//        backdrop_path = URL(string: "https://image.tmdb.org/t/p/w500\(dict["backdrop_path"] ?? "")")!
        backdrop_path = dict["backdrop_path"] as! String
        vote_count = dict["vote_count"] as! Int
        popularity = dict["popularity"] as! Double
        adult = dict["adult"] as! Bool
        original_language = dict["original_language"] as! String
        original_title = dict["original_title"] as! String
        title = dict["title"] as! String
        vote_average = dict["vote_average"] as! Double
        overview = dict["overview"] as! String
        release_date = dict["release_date"] as! String
    }
}
