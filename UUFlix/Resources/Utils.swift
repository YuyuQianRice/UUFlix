//
//  Utils.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/23/20.
//

import Foundation
import UIKit

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}

func getPoster(posterURL: URL, imageView: UIImageView) {
    // get data
    // conver the data to image
    // set image to image view
   
//    print(imageUrlString)
//    guard let url = URL(string: imageUrlString) else {
//        return
//    }
    
    let getDataTask = URLSession.shared.dataTask(with: posterURL,
                                                 completionHandler: {
                                                    data, _, error in
                                                    guard let data = data, error == nil else {
                                                        return
                                                    
                                                    }
                                                    DispatchQueue.main.async {
                                                        let image = UIImage(data: data)
                                                        imageView.image = image
                                                    }

                                                 })
    getDataTask.resume()
    
}

func getPoster(posterURL: URL, imageView: UIImageView, pixel: Int) {
    // get data
    // conver the data to image
    // set image to image view
   
//    print(imageUrlString)
//    guard let url = URL(string: imageUrlString) else {
//        return
//    }
    
    let getDataTask = URLSession.shared.dataTask(with: posterURL,
                                                 completionHandler: {
                                                    data, _, error in
                                                    guard let data = data, error == nil else {
                                                        return
                                                    
                                                    }
                                                    DispatchQueue.main.async {
                                                        let image = UIImage(data: data)
                                                        imageView.image = image
                                                    }

                                                 })
    getDataTask.resume()
    
}
