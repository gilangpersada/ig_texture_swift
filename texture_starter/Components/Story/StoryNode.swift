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
    
    private let plusNode:ASImageNode = {
        let plusNode = ASImageNode()
        plusNode.style.preferredSize = .init(width: 25, height: 25)
        plusNode.image = UIImage(systemName: "plus.circle.fill")?.withTintColor(.systemBlue)
        plusNode.imageModificationBlock = ASImageNodeTintColorModificationBlock(.systemBlue)
        
        return plusNode
    }()
    
    
    
    private let usernameNode:ASTextNode2 = {
        let usernameNode = ASTextNode2()
        usernameNode.maximumNumberOfLines = 1
        usernameNode.truncationMode = .byTruncatingTail
        usernameNode.style.maxWidth = ASDimensionMake(56)
        
        return usernameNode
    }()
    
    let firstIndex:Bool
    let lastIndex:Bool
    
    init(story: StoryModel, firstIndex:Bool, lastIndex:Bool) {
        self.story = story
        self.firstIndex = firstIndex
        self.lastIndex = lastIndex
        if firstIndex{
            usernameNode.attributedText = .init(string: "Yours")
//            avatarNode.addSubnode(self.plusNode)
        } else {
            usernameNode.attributedText = .init(string: story.userName)
            
        }
        avatarNode.image = UIImage(named: story.userAvatar)
        
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let firstStory = ASCornerLayoutSpec(child: self.avatarNode, corner: self.plusNode, location: .topRight)
        firstStory.offset = .init(x: -10, y: 10)
        firstStory.wrapsCorner = true
        
        
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            firstIndex ? firstStory:self.avatarNode,
            self.usernameNode
        ])
        return ASInsetLayoutSpec(insets: .init(top: 0, left: firstIndex ? 16:4, bottom: 0, right:lastIndex ? 16:4 ), child: finalStack)
    }
}
