//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Alperen Toksöz on 9.03.2020.
//  Copyright © 2020 Alperen Toksöz. All rights reserved.
//

import Foundation

struct ArticleList : Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
