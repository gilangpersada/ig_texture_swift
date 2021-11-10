//
//  PostInteractionNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class PostInteractionNode: ASDisplayNode{
    
    private let heartNode:ASImageNode = {
        let heartNode = ASImageNode()
        heartNode.image = UIImage(named: "heart")
        heartNode.style.preferredSize = .init(width: 20, height: 20)
        return heartNode
    }()
    
    private let messengerNode:ASImageNode = {
        let messengerNode = ASImageNode()
        messengerNode.image = UIImage(named: "messenger")
        messengerNode.style.preferredSize = .init(width: 20, height: 20)
        return messengerNode
    }()
    
    private let dmNode:ASImageNode = {
        let dmNode = ASImageNode()
        dmNode.image = UIImage(named: "dm")
        dmNode.style.preferredSize = .init(width: 20, height: 20)
        return dmNode
    }()
    
    private let saveNode:ASImageNode = {
        let saveNode = ASImageNode()
        saveNode.image = UIImage(named: "saved")
        saveNode.style.preferredSize = .init(width: 20, height: 20)
        return saveNode
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let leftStack = ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [
            self.heartNode,
            self.messengerNode,
            self.dmNode,
        ])
        
        let finalStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [leftStack,self.saveNode])
        
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 16, bottom: 0, right: 16), child: finalStack)
            
    }
}
