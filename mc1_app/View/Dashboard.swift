//
//  Dashboard.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import SwiftUI

struct Dashboard: View {
    @State private var searchQuery = ""
    
    @State var readingList: [ReadingList] = [
        ReadingList(title: "Test", image: "Test", purpose: "Test", highlights: ["Test"], actionableTakeways: ["Test"]),
        ReadingList(title: "Test", image: "Test", purpose: "Test", highlights: ["Test"], actionableTakeways: ["Test"]),
        ReadingList(title: "Test", image: "Test", purpose: "Test", highlights: ["Test"], actionableTakeways: ["Test"]),
        ReadingList(title: "Test", image: "Test", purpose: "Test", highlights: ["Test"], actionableTakeways: ["Test"])
    ]
    
    
    init() {
        UITableView.appearance().sectionFooterHeight = 0
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<10) { i in
                        Section {
                            HStack(spacing: 0) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Atomic Habit")
                                        .font(.title3)
                                    
                                    Spacer()
    
                                    Text("James Clear")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 5){
                                        TagView(tagText: "Self Improvement", tagColor: Color.purple)
                                        TagView(tagText: "+10", tagColor: Color.secondary)
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    Text("Insight 💡")
                                        .font(.subheadline)
                                    
                                    
                                    Spacer()
                                    // this is insight preview
                                    Text("\"Kejahatan adalah nafsu yang terdidik. Kepandaian, seringkali, adalah kelicikan\"")
                                        .font(.body.italic())
                                        .lineLimit(2)
                                    
                                }
                                
                                VStack {
                                    Image("atomic_habbit")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                    
                                    Spacer()
                                    
                                    Button {
                                        // go to detail view
                                        print("Go to detail view")
                                    } label: {
                                        Text("See all")
                                            .font(.footnote)
                                    }
                                } .frame(width: UIScreen.main.bounds.width * 0.2)
                            }
                            .padding(.vertical, 16)
                        } .frame(height: 200)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Reading List")
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Sort item button pressed")
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            // add reading list
                            print("Add reading list pressed")
                        } label: {
                            Text("add")
                        }
                    }
                }
            }
            
        }
        //            .frame(width: metric.size.width, height: metric.size.height) .background(Color.gray)
    }
}

struct BookCard: View {
    var body: some View {
        Text("")
    }
}


struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}



struct ExtractedView: View {
    var body: some View {
        HStack {
            Image("average-dev")
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
            VStack (alignment: .leading){
                Text("I'm an average developer 💡")
                    .fontWeight(.semibold)
                    .font(.body)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text("January 1, 2022")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
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
