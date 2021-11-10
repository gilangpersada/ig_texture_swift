//
//  PostInformationNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class PostInformationNode: ASDisplayNode{
    
    private let usernameNode = ASTextNode2()
    private let captionNode: ASTextNode2 = {
        let captionNode = ASTextNode2()
        captionNode.maximumNumberOfLines = 0
        captionNode.truncationMode = .byWordWrapping
        return captionNode
    }()
    private let likeNode = ASTextNode2()
    
    private let post:PostModel
    
    init(post:PostModel) {
        self.post = post
        self.usernameNode.attributedText = .init(string: post.userName, attributes: [.font:UIFont.systemFont(ofSize: 14, weight: .semibold)])
        self.captionNode.attributedText = .init(string: post.caption)
        self.likeNode.attributedText = .init(string: "\(post.likesCount) likes")
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let usernameCaptionStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            self.usernameNode,
            self.captionNode,
        ])
        
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [
            self.likeNode,
            usernameCaptionStack,
        ])
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 16, bottom: 0, right: 16), child: finalStack)
    }
}
