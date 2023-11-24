//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Artyom on 22.11.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var avatarImageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        avatarImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        avatarImageView.tintColor = .lightGray
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarImageView)
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 800)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let titleView = navigationController?.navigationBar.subviews.first(where: { $0.description.contains("UINavigationBarLargeTitleView") }) else { return }
        
        titleView.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 36),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.trailingAnchor, constant: -1 * (titleView.subviews.first { $0 is UILabel }?.frame.origin.x ?? 16)),
            avatarImageView.centerYAnchor.constraint(equalTo: titleView.subviews.first { $0 is UILabel }?.centerYAnchor ?? titleView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        
        if offsetY > navigationBarHeight {
            title = "Avatar"
            avatarImageView.isHidden = true
        } else {
            title = "Avatar"
            avatarImageView.isHidden = false
        }
    }
}
