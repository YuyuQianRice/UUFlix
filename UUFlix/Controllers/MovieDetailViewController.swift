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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
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
        getPoster(imageUrl: movie.poster_path!, imageView: posterImageView)
        getPoster(imageUrl: movie.backdrop_path!, imageView: backgroundImageView, pixel: 780)
        titleLabel.text = movie.title
        introLabel.text = movie.overview
        print(movie.overview)
        dateLabel.text = movie.release_date
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .black
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height)
        
        
        backgroundImageView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: scrollView.width,
                                  height: scrollView.height * 2 / 5)
        scrollView.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        
        posterImageView.frame.origin.x = 0
        posterImageView.frame.origin.y = 300
        posterImageView.frame.size.height = 200
        posterImageView.layer.shadowRadius = 10
        posterImageView.layer.shadowColor = UIColor.black.cgColor
        posterImageView.layer.shadowOpacity = 1
        posterImageView.layer.shadowOffset = CGSize.zero
        posterImageView.clipsToBounds = false
        scrollView.clipsToBounds = true

        
        scrollView.addSubview(posterImageView)
        
        titleLabel.frame = CGRect(x: posterImageView.right,
                                  y: backgroundImageView.bottom + 30,
                                  width: scrollView.width - posterImageView.right,
                                  height: 20)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        scrollView.addSubview(titleLabel)
        
        dateLabel.frame = CGRect(x: posterImageView.right,
                                  y: posterImageView.bottom - 60,
                                  width: scrollView.width - posterImageView.right,
                                  height: 20)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .left
        scrollView.addSubview(dateLabel)
        
//        introLabel.frame.origin.x = 10
//        introLabel.frame.origin.y = dateLabel.bottom
//        introLabel.frame.size.width = view.width - 10
//        introLabel.lineBreakMode = .byWordWrapping
        introLabel.frame = CGRect(x: 10,
                                  y: posterImageView.bottom,
                                  width: scrollView.width - 10,
                                  height: scrollView.height - posterImageView.bottom)
       
        introLabel.textColor = .white
        introLabel.textAlignment = .natural
//        introLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: introLabel.width, height: introLabel.height), limitedToNumberOfLines: 0)
//        introLabel.adjustsFontSizeToFitWidth = true
        introLabel.lineBreakMode = .byTruncatingTail
        introLabel.sizeToFit()
        introLabel.numberOfLines = 0
        introLabel.font = UIFont.systemFont(ofSize: 20.0)
//        introLabel.baselineAdjustment = .none
//        introLabel.contentMode = .topLeft
        scrollView.addSubview(introLabel)
        
    }
    

}
