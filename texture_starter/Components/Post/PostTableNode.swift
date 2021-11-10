//
//  PostTableNode.swift
//  texture_starter
//
//  Created by Gilang Persada on 09/11/2021.
//

import Foundation
import AsyncDisplayKit

final class PostTableNode:ASTableNode{
    
    private let posts:[PostModel]
    
    init(posts:[PostModel]) {
        self.posts = posts
        super.init(style: .plain)
        self.dataSource = self
        self.delegate = self
        self.style.width = .init(unit: .fraction, value: 1)
        self.style.flexGrow = 1
    }
    
    override func didLoad() {
        super.didLoad()
        self.view.separatorStyle = .none
        self.view.backgroundColor = .white
    }
}

extension PostTableNode:ASTableDataSource,ASTableDelegate{
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let post = self.posts[indexPath.row]
        return{
            PostNode(post: post)
        }
    }
}
