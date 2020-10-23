//
//  ViewController.swift
//  UUFlix
//
//  Created by Yuyu Qian on 10/22/20.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let movieService = MovieStore.shared
    
    var movies: [Movie]?
    var isLoading: Bool = false
    var error: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        scrollView.frame = CGRect(x: 10,
                                  y: 30,
                                  width: view.width - 20,
                                  height: view.height - 50)
        
        scrollView.backgroundColor = .darkGray
        view.addSubview(scrollView)
        
        
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: scrollView.width,
                                 height: scrollView.height)
        tableView.backgroundColor = .white
        scrollView.addSubview(tableView)
        
        
        
        scrollView.delegate = self;
        tableView.delegate = self;
        tableView.dataSource = self;
        getMovieData()
    }
        

    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getMovieData() {
//        API.getRestaurants() { (completionRestaurants) in
//            guard let restaurants = completionRestaurants else {
//                return
//            }
//            self.restaurantsArray = restaurants
//            self.tableView.reloadData()
//        }
        
        movieService.fetchMovies(from: .popular) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            
            case .success(let response):
                self.movies = response.results
                self.tableView.reloadData()//reload table
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
        
        
    }
        

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

//        cell.textLabel?.text = self.movies![indexPath.row].title
        let curMovie = self.movies![indexPath.row]
        
        cell.movieTitle.text = curMovie.title
        cell.movieIntro.text = curMovie.overview
        let imageUrlString = curMovie.posterURL.absoluteString
        getPoster(imageUrlString: imageUrlString, imageView: cell.moviePoster)
        
        cell.movieTitle.frame = CGRect(x: cell.moviePoster.width,
                                       y: 0,
                                       width: tableView.width - cell.moviePoster.width,
                                       height: 40)
        
        cell.movieTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        cell.movieTitle.textAlignment = .left
        
        cell.movieIntro.frame = CGRect(x: cell.moviePoster.width,
                                       y: 25,
                                       width: tableView.width - cell.moviePoster.width,
                                       height: cell.height - 40)
//        cell.movieIntro.lineBreakMode = .byWordWrapping
        cell.movieIntro.numberOfLines = 0
        cell.movieIntro.textColor = .darkGray
        
        return cell
    }
}


func getPoster(imageUrlString: String, imageView: UIImageView) {
    // get data
    // conver the data to image
    // set image to image view
   
//    print(imageUrlString)
    guard let url = URL(string: imageUrlString) else {
        return
    }
    
    let getDataTask = URLSession.shared.dataTask(with: url,
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
