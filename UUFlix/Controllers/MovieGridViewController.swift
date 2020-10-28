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
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        // for the collection cell layout
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.itemSize = CGSize(width: view.width / 2, height: view.width * 3 / 4)
        
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
        return cell
    }
    
    
}

//extension MovieGridViewController: UICollectionViewDelegateFlowLayout {
//
//}

