//
//  File.swift
//  NewsAppMVVM
//
//  Created by Alperen Toksöz on 9.03.2020.
//  Copyright © 2020 Alperen Toksöz. All rights reserved.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}
