//
//  ArticleViewModel.swift
//  buyNFTs
//
//  Created by Gustavo Araujo Santos on 03/10/22.
//

import Foundation

class ArticleViewModel {

    // MARK: - Public properties

    @Published var articles: [Article] = []
    @Published var error: String?

    // MARK: - Private properties

    private var listArticlesUseCase: ListArticlesUseCaseProtocol

    // MARK: - Initialization

    init(listArticlesUseCase: ListArticlesUseCaseProtocol) {
        self.listArticlesUseCase = listArticlesUseCase
    }

    deinit {
        print("ArticleViewModel deinit")
    }

    // MARK: - Methods

    func getArticles() {
        Task {
            do {
                let articlesResult = try await listArticlesUseCase.execute()
                self.articles = articlesResult
            } catch {
                self.error = error.localizedDescription
            }
        }
    }

}
