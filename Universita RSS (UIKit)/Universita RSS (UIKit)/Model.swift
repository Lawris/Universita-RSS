//
//  Model.swift
//  Universita RSS (UIKit)
//
//  Created by Loris Plasson Simoni on 04/01/2021.
//

import Foundation

struct UniversitaFeedItem: Hashable {
    var title: String
    var link: URL
    var description: String
    var pubDate: Date
    
    var readableDate: String {
        get {
            let date = pubDate
            let dateFormatter = DateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "fr-FR") as Locale
            dateFormatter.dateFormat = "d MMMM yyyy"
            return dateFormatter.string(from: date)
        }
    }
}
