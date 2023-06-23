//
//  DetailTableViewCellScreen.swift
//  music
//
//  Created by Livia Keller on 22/06/23.
//

import UIKit

class DetailTableViewCellScreen: UIView {
    
    lazy var thumbImage: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    lazy var title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Teste Nome"
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
    }()
    
    lazy var subTitle: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Sub Titulo"
        l.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        l.textColor = .lightGray
        return l
    }()
    
    lazy var likeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
    }()
    
    lazy var moreBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(thumbImage)
        addSubview(title)
        addSubview(subTitle)
        addSubview(likeBtn)
        addSubview(moreBtn)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            thumbImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImage.heightAnchor.constraint(equalToConstant: 60),
            thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            title.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor,constant: 15),
            title.topAnchor.constraint(equalTo: topAnchor,constant: 17),
            
            subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor,constant: 15),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 4),
            
            moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            moreBtn.widthAnchor.constraint(equalToConstant: 35),
            moreBtn.heightAnchor.constraint(equalToConstant: 35),
            moreBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            likeBtn.trailingAnchor.constraint(equalTo: moreBtn.leadingAnchor,constant: -15),
            likeBtn.widthAnchor.constraint(equalToConstant: 35),
            likeBtn.heightAnchor.constraint(equalToConstant: 35),
            likeBtn.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
    public func setupCell(data: CardListModel) {
        title.text = data.listTitle
        subTitle.text = data.listSubtitle
        thumbImage.image = UIImage(named: data.listImage ?? "")
    }
}
