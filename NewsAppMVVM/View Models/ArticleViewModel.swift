//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by Alperen Toksöz on 9.03.2020.
//  Copyright © 2020 Alperen Toksöz. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel{
        let article = self.articles[index]
        
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel {
    init (_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description
    }
}
