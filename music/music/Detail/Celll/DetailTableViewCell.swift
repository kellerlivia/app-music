//
//  DetailTableViewCell.swift
//  music
//
//  Created by Livia Keller on 22/06/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static public let identifier: String = "DetailTableViewCell"
    
    var screen: DetailTableViewCellScreen = DetailTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubview(screen)
    }
    
    private func setupConstraints(){
        screen.pin(to: contentView)
    }
    
    public func setupCell(data: CardListModel){
        screen.setupCell(data: data)
    }
}
