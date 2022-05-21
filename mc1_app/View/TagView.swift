//
//  TagView.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 20/05/22.
//

import Foundation
import SwiftUI

struct TagViewPlacement: View {
    let tagItems: [String]
    let tagColor: [Color]
    
    
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    
    init(items: [String], color: [Color]) {
        self.tagItems = items
        self.tagColor = color
        self.groupedItems = createGroupedItems(tagItems)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]]{
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] = [String]()
        var width: CGFloat = 0
        
        for word in items {
            let label = UILabel()
            
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 14) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
        }
        
        groupedItems.append(tempItems)
        return groupedItems
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(groupedItems, id: \.self) { subItems in
                HStack() {
                    ForEach(subItems, id: \.self) { word in
                        TagView(tagText: word, tagColor: .secondary)
                    }
                }
            }
            
            Spacer()
        }
    }
}


struct TagView: View {
    let tagText: String
    let tagColor: Color
    
    var body: some View {
        Text(tagText)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Capsule().fill(tagColor))
    }
}
