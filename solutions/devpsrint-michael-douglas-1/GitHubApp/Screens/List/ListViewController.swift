//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {

        return ListView()
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {

        self.view = self.listView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchRepos()
    }
    
    private func fetchRepos() {

        self.service.fetchRepositoryList("devpass-tech") { repositories in
            let configuration = ListViewConfiguration(listRepositories: repositories!)
            
            DispatchQueue.main.sync {
                self.listView.updateView(with: configuration)
            }
        }
    }
}



