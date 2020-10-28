//
//  MovieGridViewController.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/28/20.
//

import UIKit

class MovieGridViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [MovieCodepath]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // for the collection cell layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: self.collectionView.width / 2 , height: self.collectionView.width * 3 / 4)
//        layout.itemSize = CGSize(width: 200 , height: 300)
//        layout.itemSize = CGSize(width: 50, height: 50 * 3 / 2)
        view.addSubview(collectionView)
        getMovieData()
        // Do any additional setup after loading the view.
    }
    
    func getMovieData() {
        MovieAPI_Codepath.getMovies_Superhero(completion: {
            competionMovies in
            guard let competionMovies = competionMovies else {
                return
            }
            self.movies = competionMovies
            self.collectionView.reloadData()
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieGridViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionViewCell
                
        cell.movie = self.movies![indexPath.row]
        cell.moviePoster.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let movie = movies![indexPath.row]
            let detailVC = segue.destination as! MovieDetailViewController
            detailVC.movie = movie
        }
    }
    
}

//// to controll the size of grid
//extension MovieGridViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.collectionView.width / 2 , height: self.collectionView.width * 3 / 4)
//    }
//}

