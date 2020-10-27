//
//  MovieCell.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/23/20.
//


import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieIntro: UILabel!
    
    var movie: MovieCodepath! {
        didSet {
            getPoster(posterURL: movie.poster_path!, imageView: moviePoster)
            movieTitle.text = movie.title
            movieIntro.text = movie.overview

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}


