//
//  StoryCollectionNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class StoryCollectionNode:ASCollectionNode{
    
    private let collectionViewFlowLayout:UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
//        collectionViewFlowLayout.minimumInteritemSpacing = 8
        collectionViewFlowLayout.scrollDirection = .horizontal
        return collectionViewFlowLayout
    }()
    
    private let stories:[StoryModel]
    
    init(stories: [StoryModel]) {
        self.stories = stories
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout, layoutFacilitator: nil)
        self.automaticallyManagesSubnodes = true
        self.showsHorizontalScrollIndicator = false
        self.dataSource = self
        self.style.width = .init(unit: .fraction, value: 1)
        self.style.height = .init(unit: .points, value: 84)
        
    }
}

extension StoryCollectionNode:ASCollectionDataSource{
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let story = stories[indexPath.row]
        return {
            StoryNode(story: story)
        }
    }
}
