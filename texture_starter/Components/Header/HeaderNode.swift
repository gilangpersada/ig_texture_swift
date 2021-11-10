//
//  HeaderNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class HeaderNode: ASDisplayNode {
    
    private let titleNode:ASTextNode2={
        let titleNode = ASTextNode2()
        
        titleNode.attributedText = .init(string: "IGTexture", attributes:[.font:UIFont.systemFont(ofSize: 18, weight: .bold)])
        
        return titleNode
    }()
    
    private let heartNode:ASImageNode={
        let heartNode = ASImageNode()
        heartNode.image = UIImage(named: "heart")
        heartNode.style.preferredSize = .init(width: 25, height: 25)
        return heartNode
    }()
    
    
    
    private let messengerNode:ASImageNode={
        let messengerNode = ASImageNode()
        messengerNode.image = UIImage(named: "messenger")
        messengerNode.style.preferredSize = .init(width: 25, height: 25)
        return messengerNode
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let buttonStack = ASStackLayoutSpec(direction: .horizontal, spacing: 24, justifyContent: .start, alignItems: .center, children: [
            self.heartNode,
            self.messengerNode,
        ])
        
        return ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [
            self.titleNode,
            buttonStack,
        ])
    }
}
