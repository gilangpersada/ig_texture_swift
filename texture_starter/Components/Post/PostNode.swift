//
//  PostNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class PostNode:ASCellNode{
    
    private let post:PostModel
    
    private let postHeaderNode:PostHeaderNode
    private let postInformationNode:PostInformationNode
    private let postInteractionNode:PostInteractionNode
    
    private let dividerNode:ASDisplayNode = {
       let dividerNode = ASDisplayNode()
        dividerNode.backgroundColor = .gray
        dividerNode.style.width = .init(unit: .fraction, value: 1)
        dividerNode.style.height = ASDimensionMake(0.5)
        return dividerNode
    }()
    
    private let imagePostNode:ASImageNode = {
       let imagePostNode = ASImageNode()
        imagePostNode.style.width = .init(unit: .fraction, value: 1)
        imagePostNode.style.height = .init(unit: .points, value: 300)
        return imagePostNode
    }()
    
    init(post: PostModel) {
        self.post = post
        self.postHeaderNode = PostHeaderNode(post: post)
        self.postInformationNode = PostInformationNode(post: post)
        self.postInteractionNode = PostInteractionNode()
        imagePostNode.image = UIImage(named: post.image)
        super.init()
        self.automaticallyManagesSubnodes = true
        
    }
    
    override func didLoad() {
        super.didLoad()
        self.view.backgroundColor = .white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch, children: [
            self.postHeaderNode,
            self.imagePostNode,
            self.postInteractionNode,
            self.postInformationNode,
        ])
        
       
        
        let dividedStack = ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .start, alignItems: .stretch, children: [
            finalStack,
            self.dividerNode
        ])
        
        return ASInsetLayoutSpec(insets: .init(top: 16, left: 0, bottom: 8, right: 0), child: dividedStack)
        
    }
}
