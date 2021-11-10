//
//  PostHeaderNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class PostHeaderNode:ASDisplayNode{
    
    private let usernameNode = ASTextNode2()
    private var locationNode:ASTextNode2?
    
    private let threeDotNode:ASImageNode = {
        let threeDotNode = ASImageNode()
        threeDotNode.image = UIImage(named: "threedot")
        threeDotNode.style.preferredSize = .init(width: 20, height: 20)
        return threeDotNode
    }()
    
    private let avatarNode:ASImageNode = {
        let avatarNode = ASImageNode()
        avatarNode.style.preferredSize = .init(width: 40, height: 40)
        avatarNode.onDidLoad { (node) in
            node.layer.cornerRadius = 20
        }
        
        return avatarNode
    }()
    
    private let post:PostModel
    
    init(post:PostModel) {
        self.post = post
        super.init()
        self.usernameNode.attributedText = .init(string: post.userName, attributes: [.font:UIFont.systemFont(ofSize: 14, weight: .semibold)])
        self.avatarNode.image = UIImage(named: post.userAvatar)
        if let location = post.location{
            self.locationNode = ASTextNode2()
            self.locationNode?.attributedText = .init(string: location)
        }
        
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var usernameLocationStack = ASLayoutSpec()
        if let locationNode = self.locationNode{
            usernameLocationStack = ASStackLayoutSpec(direction: .vertical, spacing: 4, justifyContent: .start, alignItems: .start, children: [
                self.usernameNode,
                locationNode
            ])
        } else {
            usernameLocationStack = ASWrapperLayoutSpec(layoutElement: self.usernameNode)
        }
        
        let leftStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            self.avatarNode,
            usernameLocationStack
        ])
        
        let finalStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [
            leftStack,
            self.threeDotNode
        ])
        
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 16, bottom: 0, right: 16), child: finalStack)
    }
}
