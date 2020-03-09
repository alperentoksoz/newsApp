//
//  NewsListTableViewController.swift
//  NewsAppMVVM
//
//  Created by Alperen Toksöz on 9.03.2020.
//  Copyright © 2020 Alperen Toksöz. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    private var articleListVM : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "http://newsapi.org/v2/top-headlines?country=tr&apiKey=bf68a28867a4477b8194669a6428f7af")!
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowSection(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Cell error")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    

    
}
