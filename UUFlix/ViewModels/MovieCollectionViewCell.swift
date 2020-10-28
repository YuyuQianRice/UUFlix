//
//  MovieCollectionViewCell.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/28/20.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var moviePoster: UIImageView!
    
    var movie: MovieCodepath! {
        didSet {
            getPoster(imageUrl: movie.poster_path!, imageView: moviePoster)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    static func nib() -> UINib {
//
//    }
    
}
