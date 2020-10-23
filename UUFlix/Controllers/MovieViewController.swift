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
        tableView.backgroundColor = .black
        scrollView.addSubview(tableView)
        
        scrollView.delegate = self;
        tableView.delegate = self;
        tableView.dataSource = self;
        
    }
        
        

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    
    
}

