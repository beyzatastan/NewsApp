//
//  NewsModel.swift
//  NewsApp
//
//  Created by beyza nur on 28.10.2023.
//

import Foundation

struct NewsModel:Codable{
    let articles:[Articles]
}

struct Articles:Codable{
    let author:String?
    let title:String?
    let url:String?
    let publishedAt:String
}

