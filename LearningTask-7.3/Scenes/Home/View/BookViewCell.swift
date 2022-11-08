//
//  BookViewCell.swift
//  LearningTask-7.3
//
//  Created by Laura Pinheiro Marson on 08/11/22.
//

import UIKit

protocol BookViewCellData {
    var titulo: String { get }
    var imagem: String { get }
}

class BookViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var data: BookViewCellData? {
        didSet {
            guard let data = data else { return }
            
            bookImageView.image = .init(named: data.imagem)
            titleLabel.text = data.titulo
        }
    }
}
