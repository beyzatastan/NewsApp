//
//  NewsWebServices.swift
//  NewsApp
//
//  Created by beyza nur on 28.10.2023.
//

import Foundation

class WebService{
    static let shared=WebService()
    
    //veri çekme fonk
    func FetchNews(completion: @escaping ([Articles]?) -> Void) {
            guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=55bf61b34f6d4fb182bfdaf93a819d73") else {
                completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Hata oluştu: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    print("Veri alınamadı.")
                    completion(nil)
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(NewsModel.self, from: data)
                    completion(response.articles)
                } catch {
                    print("JSON ayrıştırma hatası: \(error.localizedDescription)")
                    completion(nil)
                }
            }.resume()
        
        print("devam")
        
    }
    
}
