//
//  QuoteManager.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 28/10/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation

class QuoteManager {
    private var quotes: [Quote]?

    static let shared = QuoteManager()

    private init() {
        loadQuotes()
    }

    private func loadQuotes() {
        if let path = Bundle.main.path(forResource: "quotes", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
            self.quotes = try? JSONDecoder().decode([Quote].self, from: data)
        }
    }

    func getAllQuotes() -> [Quote]? {
        return quotes
    }

    func getRandomQuote() -> Quote? {
        guard let quotes = quotes else { return nil }
        return quotes.randomElement()
    }

    func getQuote(at index: Int) -> Quote? {
        guard let quotes = quotes,
            index >= 0,
            index < quotes.endIndex else {
                return nil
        }
        return quotes[index]
    }
}
