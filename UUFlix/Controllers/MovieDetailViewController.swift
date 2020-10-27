//
//  MovieDetailViewController.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/27/20.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var introLabel: UILabel!
    
    var movie: MovieCodepath!
//    var movie: MovieCodepath! {
//        didSet {
//            print(movie.title)
//            getPoster(posterURL: movie.poster_path!, imageView: posterImageView)
//            getPoster(posterURL: movie.backdrop_path!, imageView: backgroundImageView)
//            titleLabel.text = movie.title
//            introLabel.text = movie.overview
//            dateLabel.text = movie.release_date
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPoster(posterURL: movie.poster_path!, imageView: posterImageView)
        getPoster(posterURL: movie.backdrop_path!, imageView: backgroundImageView)
        titleLabel.text = movie.title
        introLabel.text = movie.overview
        dateLabel.text = movie.release_date
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .black
        backgroundImageView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height * 2 / 5)
        view.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        
        posterImageView.frame.origin.x = 0
        posterImageView.frame.origin.y = 300
        posterImageView.frame.size.height = 200
        posterImageView.layer.shadowRadius = 10
        posterImageView.layer.shadowColor = UIColor.black.cgColor
        posterImageView.layer.shadowOpacity = 1
        posterImageView.layer.shadowOffset = CGSize.zero
        posterImageView.clipsToBounds = false
        view.clipsToBounds = true

        
        view.addSubview(posterImageView)
        
        titleLabel.frame = CGRect(x: posterImageView.right,
                                  y: backgroundImageView.bottom + 10,
                                  width: view.width - posterImageView.right,
                                  height: 20)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        
        dateLabel.frame = CGRect(x: posterImageView.right,
                                  y: posterImageView.bottom - 10,
                                  width: view.width - posterImageView.right,
                                  height: 20)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .left
        
        introLabel.frame = CGRect(x: 10,
                                  y: posterImageView.bottom + 10,
                                  width: view.width - 10,
                                  height: view.height - posterImageView.bottom + 10)
        introLabel.numberOfLines = 0
        introLabel.textColor = .white
    }
    

}