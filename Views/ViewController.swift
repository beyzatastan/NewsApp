//
//  ViewController.swift
//  NewsApp
//
//  Created by beyza nur on 28.10.2023.
//

import UIKit
import SafariServices

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var newsModel=NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
                tableView.dataSource = self
                
                WebService.shared.FetchNews { [weak self] result in
                    if let result = result {
                        self?.newsModel.articles = result
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    }
                }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Haber", for: indexPath) as! NewsTableViewCell
        let news=newsModel.articles[indexPath.row]
        cell.dateLabel.text=news.publishedAt
        cell.newsLabel.text=news.title
        cell.tittleLabel.text=news.author
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = newsModel.articles[indexPath.row]
               
               if let urlString = selectedArticle.url, let url = URL(string: urlString) {
                   // URL açma işlemi
                   let safariViewController = SFSafariViewController(url: url)
                   present(safariViewController, animated: true, completion: nil)
               } else {
                   // URL geçerli değilse veya URL yoksa kullanıcıya hata mesajı gösterebilirsiniz.
                   let alert = UIAlertController(title: "Hata", message: "Haberin URL'si geçerli değil.", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                   present(alert, animated: true, completion: nil)
               }
    }
    
}

