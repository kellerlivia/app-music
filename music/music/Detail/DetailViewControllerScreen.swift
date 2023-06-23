//
//  DetailViewControllerScreen.swift
//  music
//
//  Created by Livia Keller on 22/06/23.
//

import UIKit

protocol DetailViewControllerScreenDelegate: AnyObject {
    func tappedCloseButton()
}

class DetailViewControllerScreen: UIView {
    
    var cardModel: CardViewModel?
    var navBarTopAchor: NSLayoutConstraint?
    var playerViewBottomAchor: NSLayoutConstraint?
    
    private weak var delegate: DetailViewControllerScreenDelegate?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cardView: CustomCardView = {
        let v = CustomCardView(mode: .full)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.cardContainerView.layer.cornerRadius = 0.0
        v.setupView(data: self.cardModel ?? CardViewModel())
        return v
    }()
    
    lazy var navBar: CustomNavBar = {
        let v = CustomNavBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        v.setupView(data: self.cardModel ?? CardViewModel())
        return v
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.isScrollEnabled = false
        tv.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return tv
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 15
        btn.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(self.closePressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var playerView: CustomPlayerView = {
        let pv = CustomPlayerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    @objc func closePressed() {
        self.delegate?.tappedCloseButton()
    }
    
    init(dataView:CardViewModel?) {
        super.init(frame: CGRect())
        cardModel = dataView
        DispatchQueue.main.async {
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(cardView)
        scrollView.addSubview(tableView)
        addSubview(navBar)
        addSubview(closeBtn)
        addSubview(playerView)
    }
    
    private func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
//        print(topPadding as Any)
        
        scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: -(topPadding ?? 0)),
            cardView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.widthAnchor.constraint(equalToConstant: frame.size.width),
            
            tableView.topAnchor.constraint(equalTo: cardView.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            tableView.widthAnchor.constraint(equalToConstant: frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            closeBtn.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.heightAnchor.constraint(equalToConstant: 30),
            closeBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: ((topPadding ?? 0.0) + 80)),
            
            self.playerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.playerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.playerView.heightAnchor.constraint(equalToConstant: 120)
            
        ])
        
        navBarTopAchor = navBar.topAnchor.constraint(equalTo: topAnchor, constant: -((topPadding ?? 0.0) + 60))
        navBarTopAchor?.isActive = true
        
        self.playerViewBottomAchor = self.playerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 120)
        self.playerViewBottomAchor?.isActive = true
        
    }
    
    public func configAllDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailViewScreenDelegate: DetailViewControllerScreenDelegate) {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        scrollView.delegate = scrollViewDelegate
        delegate = detailViewScreenDelegate
    }
}
