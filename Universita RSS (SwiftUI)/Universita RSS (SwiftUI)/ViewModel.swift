//
//  ViewModel.swift
//  Universita RSS (SwiftUI)
//
//  Created by Loris Plasson Simoni on 22/12/2020.
//

import Foundation
import FeedKit

let feedURL = URL(string: "https://actu.universita.corsica/plugins/actu/xml/ricerca_actus.xml")

class ViewModel: ObservableObject {
    
    @Published var feedItems: [UniversitaFeedItem] = []
    
    init() {
        fetchFeed()
    }
    
    func fetchFeed() {
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
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
