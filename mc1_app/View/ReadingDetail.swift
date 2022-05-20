//
//  ReadingDetail.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import SwiftUI

struct ReadingDetail: View {
    @Environment(\.colorScheme) var colorScheme
    
//    @Binding var readingList: ReadingList
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Atomic Habits")
                    .font(.title2)
                    .padding(.top, 10)
                
                
                Text("James Clear")
                    .font(.subheadline)
                
                HStack {
                    TagView(tagText: "Self Improvement", tagColor: .purple)
                    TagView(tagText: "Religion", tagColor: .orange)
                    TagView(tagText: "Filsafat", tagColor: .blue)
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.bottom, 26)
            .clipShape(Rectangle())
            
            .background(colorScheme == .light ? .white : .black)
            .cornerRadius(14)
            .shadow(color: .gray, radius: 1, x: 1, y: 2)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ReadingDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReadingDetail()
    }
}
