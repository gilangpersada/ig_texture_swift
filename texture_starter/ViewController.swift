

import UIKit
import AsyncDisplayKit

class ViewController: ASDKViewController<ASScrollNode> {

    private let rootNode:ASScrollNode = {
        let rootNode = ASScrollNode()
        rootNode.backgroundColor = .white
        rootNode.automaticallyManagesSubnodes = true
        rootNode.automaticallyManagesContentSize = true
        rootNode.scrollableDirections = [.up,.down]
        return rootNode
    }()
    
    private let headerNode:HeaderNode
    private let storyCollectionNode:StoryCollectionNode
    private let postTableNode:PostTableNode
    
    override init() {
        self.headerNode = HeaderNode()
        self.storyCollectionNode = StoryCollectionNode(stories: DataGenerator.generateDummyStories())
        self.postTableNode = PostTableNode(posts: DataGenerator.generateDummyPosts())
        
        super.init(node: rootNode)
        
        rootNode.layoutSpecBlock = { [weak self] _, _ -> ASLayoutSpec in
            guard let self = self else {return .init()}
            
            let insettedHeaderNode = ASInsetLayoutSpec(insets: .init(top: 40, left: 16, bottom: 0, right: 16), child: self.headerNode)
            let insettedStoryCollectionNode = ASInsetLayoutSpec(insets: .init(top: 0, left: 16, bottom: 0, right:16), child: self.storyCollectionNode)
           
            
            return ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .start, alignItems: .stretch, children: [
                insettedHeaderNode,
                insettedStoryCollectionNode,
                self.postTableNode
            ])
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

