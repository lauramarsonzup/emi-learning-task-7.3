//
//  ViewController.swift
//  LearningTask-7.3
//
//  Created by rafael.rollo on 16/05/2022.
//

import UIKit

class BooksListViewController: UICollectionViewController {
    
    var livrosAPI: LivrosAPI?
    
    var books: [Livro] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        loadBooks()
    }
    
    private func loadBooks() {
        guard let livrosAPI = livrosAPI else { return }
        books = livrosAPI.carregaLivros()
    }
    
}

extension BooksListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookViewCell", for: indexPath) as? BookViewCell else {
            fatalError("Não foi possível carregar célula")
        }
        
        cell.data = books[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return configureHeaderSection(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        default:
            fatalError("Não temos suporte para view: \(kind)")
        }
        
    }
    
    private func configureHeaderSection(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as? SectionHeadereView else {
            fatalError("")
        }
        
        header.setup()
        return header
    }
}

extension BooksListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Não foi possível carregar o Flow Layout")
        }
        
        let itemsPerLine: CGFloat = 2
        
        let itemsSpacing = flowLayout.minimumInteritemSpacing
        let margins = flowLayout.sectionInset
        
        let utilWidth = collectionView.bounds.width - (margins.right + margins.left) - itemsSpacing * (itemsPerLine - 1)
        let itemWidth = utilWidth / itemsPerLine
        
        return CGSize(width: itemWidth, height: itemWidth * 1.67)
    }
}
