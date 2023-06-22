//
//  CardActionView.swift
//  music
//
//  Created by Livia Keller on 21/06/23.
//

import UIKit

class CardActionView: UIView {
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var downloadView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var notInterestedView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var playView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var likeView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var moreView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var downloadBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var notInterestedBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var playBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 35
        btn.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var likeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var moreBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(notInterestedView)
        stackView.addArrangedSubview(playView)
        stackView.addArrangedSubview(likeView)
        
        downloadView.addSubview(downloadBtn)
        notInterestedView.addSubview(notInterestedBtn)
        playView.addSubview(playBtn)
        likeView.addSubview(likeBtn)
        moreView.addSubview(moreBtn)
    }
    
    
    private func setupContraints() {
        
        stackView.pin(to: self)
        
        NSLayoutConstraint.activate([
            
            downloadBtn.centerXAnchor.constraint(equalTo: downloadView.centerXAnchor),
            downloadBtn.centerYAnchor.constraint(equalTo: downloadView.centerYAnchor),
            downloadBtn.widthAnchor.constraint(equalToConstant: 45),
            downloadBtn.heightAnchor.constraint(equalToConstant: 45),
            
            notInterestedBtn.centerXAnchor.constraint(equalTo: notInterestedView.centerXAnchor),
            notInterestedBtn.centerYAnchor.constraint(equalTo: notInterestedView.centerYAnchor),
            notInterestedBtn.widthAnchor.constraint(equalToConstant: 45),
            notInterestedBtn.heightAnchor.constraint(equalToConstant: 45),
            
            playBtn.centerXAnchor.constraint(equalTo: playView.centerXAnchor),
            playBtn.centerYAnchor.constraint(equalTo: playView.centerYAnchor),
            playBtn.widthAnchor.constraint(equalToConstant: 70),
            playBtn.heightAnchor.constraint(equalToConstant: 70),
            
            likeBtn.centerXAnchor.constraint(equalTo: likeView.centerXAnchor),
            likeBtn.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            likeBtn.widthAnchor.constraint(equalToConstant: 45),
            likeBtn.heightAnchor.constraint(equalToConstant: 45),
            
            moreBtn.centerXAnchor.constraint(equalTo: moreView.centerXAnchor),
            moreBtn.centerYAnchor.constraint(equalTo: moreView.centerYAnchor),
            moreBtn.widthAnchor.constraint(equalToConstant: 45),
            moreBtn.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    public func updateLayout(for mode: ViewMode) {
        if mode == .full {
            downloadView.isHidden = false
            moreView.isHidden = false
            stackView.addArrangedSubview(downloadView)
            stackView.addArrangedSubview(notInterestedView)
            stackView.addArrangedSubview(playView)
            stackView.addArrangedSubview(likeView)
            stackView.addArrangedSubview(moreView)
        } else {
            downloadView.isHidden = true
            moreView.isHidden = true
            stackView.removeArrangedSubview(downloadView)
            stackView.removeArrangedSubview(moreView)
        }
    }
}
