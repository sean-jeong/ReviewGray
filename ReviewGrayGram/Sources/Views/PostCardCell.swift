//
//  PostCardCell.swift
//  ReviewGrayGram
//
//  Created by Sunny Jeong on 2017. 6. 18..
//  Copyright © 2017년 Sunny Jeong. All rights reserved.
//

import UIKit
import Alamofire


final class PostCardCell: UICollectionViewCell {

    // enum에는 생성자가 없다.
    fileprivate enum Metric {
        static let avatarViewTop: CGFloat = 0
        static let avatarViewLeft: CGFloat = 10
        static let avatarViewSize: CGFloat = 30
        
        /// avatarView의 오른쪽 간격
        static let usernameLabelLeft: CGFloat = 10
        static let usernameLabelRight: CGFloat = 10
        
        static let pictureViewTop: CGFloat = 10
        
        static let likeButtonTop: CGFloat = 10
        static let likeButtonLeft: CGFloat = 10
        static let likeButtonSize: CGFloat = 20
        
        static let likeCountLabelLeft: CGFloat = 10
        static let likeCountLabelRight: CGFloat = 10
        
        static let messageLabelTop: CGFloat = 10
        static let messageLabelLeft: CGFloat = 10
        static let messageLabelRight: CGFloat = 10
    }
    
    fileprivate enum Font {
        static let usernameLabel = UIFont.boldSystemFont(ofSize: 13)
        static let likeCountLabel = UIFont.boldSystemFont(ofSize: 13)
        static let messageLable = UIFont.boldSystemFont(ofSize: 14)
    }
    
    
    // subviews 
    fileprivate let avatarView = UIImageView()
    fileprivate let usernameLabel = UILabel()
    fileprivate let pictureView = UIImageView()
    fileprivate let likeButton = UIButton()
    fileprivate let likeCountLabel = UILabel()
    fileprivate let messageLabel = UILabel()
    
    fileprivate var post: Post?
    
    
    
    // 1. Creator 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        // avatarView 
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = Metric.avatarViewSize / 2
        
        // usernameLabel 
        usernameLabel.font = Font.usernameLabel
        usernameLabel.textColor = .black
        
        // like button 
        likeButton.setBackgroundImage(#imageLiteral(resourceName: "icon-like"), for: .normal)
        
        
    }
    
    
    // 2. Config 
    func config(post: Post) {
        self.post = post
    }
    
    // 3. Size
    class func size(width: CGFloat, post: Post) -> CGSize {
        var height: CGFloat = 0
        
        return CGSize(width: width, height: height)
    }
}


