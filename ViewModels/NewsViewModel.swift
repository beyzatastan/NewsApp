//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by beyza nur on 28.10.2023.
//

import Foundation

class NewsViewModel {
    var articles = [Articles]()
    
    //bu fonksiyna giriyo
    func FetchNews(completion: @escaping () -> Void) {
        
        WebService.shared.FetchNews { results in
            // Sonuçların nil olup olmadığını kontrol edin
            if let results = results {
                self.articles = results
            } else {
                // Hata durumu
                print("Hata: Sonuçlar nil geldi.")
            }
            // Tamamlama işlevini çağırın
            completion()
        }
    }
}

