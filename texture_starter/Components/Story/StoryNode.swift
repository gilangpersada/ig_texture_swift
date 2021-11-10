//
//  StoryNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class StoryNode: ASCellNode{
    
    private let story:StoryModel
    
    private let avatarNode:ASImageNode = {
       let avatarNode = ASImageNode()
        avatarNode.style.preferredSize = .init(width: 60, height: 60)
        avatarNode.onDidLoad { (node) in
            node.layer.cornerRadius = 30
        }
        
        return avatarNode
    }()
    
    private let usernameNode:ASTextNode2 = {
        let usernameNode = ASTextNode2()
        usernameNode.maximumNumberOfLines = 1
        usernameNode.truncationMode = .byTruncatingTail
        usernameNode.style.maxWidth = ASDimensionMake(56)
        
        return usernameNode
    }()
    
    
    
    init(story: StoryModel) {
        self.story = story
        usernameNode.attributedText = .init(string: story.userName)
        avatarNode.image = UIImage(named: story.userAvatar)
        
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            self.avatarNode,
            self.usernameNode
        ])
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 8, bottom: 0, right: 0), child: finalStack)
    }
}
