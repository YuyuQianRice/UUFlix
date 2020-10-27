//
//  MovieServiceCodepath.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/27/20.
//

import Foundation


struct MovieAPI_Codepath {
    static func getMovies (completion: @escaping ([MovieCodepath]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=ce31e927bc5ad7eb240375588547655f")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
              // TODO: Get the array of movies
              let movies = dataDictionary["results"] as! [[String: Any]]
              var res:[MovieCodepath] = []
              // TODO: Store the movies in a property to use elsewhere
              for movieDict in movies {
                  let movie = MovieCodepath(dict: movieDict)
                  res.append(movie)
              }
              // TODO: Reload your table view data
                
            
            
              return completion(res)
           }
        }
        task.resume()
    }
}
