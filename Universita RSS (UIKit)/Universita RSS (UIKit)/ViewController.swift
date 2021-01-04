//
//  ViewController.swift
//  Universita RSS (UIKit)
//
//  Created by Loris Plasson Simoni on 04/01/2021.
//

import UIKit
import FeedKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    let feedURL = URL(string: "https://actu.universita.corsica/plugins/actu/xml/ricerca_actus.xml")
    var feedItems: [UniversitaFeedItem] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        fetchFeed()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsRowCell", for: indexPath) as! FeedItemRow

        cell.titleLabel?.text = feedItems[indexPath.row].title
        cell.dateLabel?.text = feedItems[indexPath.row].readableDate
        
        return cell
    }
    
    private func fetchFeed() {
        let parser = FeedParser(URL: feedURL!)
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            print(result)
            switch result {
            case .success(let feed):
                
                let fetchedFeed = feed.rssFeed!
                var newFeedItems: [UniversitaFeedItem] = []
                for item in fetchedFeed.items! {
                    let newFeedItem = UniversitaFeedItem(title: item.title!, link: URL(string: item.link!)!, description: item.description!, pubDate: item.pubDate!)
                    newFeedItems.append(newFeedItem)
                }
                
                DispatchQueue.main.async {
                    self.feedItems = newFeedItems
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
