//
//  Dashboard.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import SwiftUI

struct Dashboard: View {
    @State private var searchQuery = ""
    
    @State var readingListManager = ReadingListManager()
   
    // reading form modal
    @State var showReadingForm: Bool = false
    
    
    init() {
        UITableView.appearance().sectionFooterHeight = 0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(readingListManager.readingLists) { readingList in
                        Section {
                            BookCardView(bookTitle: readingList.title)
                                .padding(.vertical, 16)
                        }
                        .frame(height: 200)
                        .overlay(
                            NavigationLink(destination: ReadingDetail(), label: {
                                EmptyView()
                            })
                        )
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
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newReadingList: ReadingListModel = ReadingListModel(title: "Test Only", image: "atomic_habit", purpose: "test", highlights: ["test"], actionableTakeways: ["test"])
                        // add reading list
                        print("Add reading list pressed")
                        print(newReadingList)
                        
                        
                        showReadingForm.toggle()
                        readingListManager.addReadingList(data: newReadingList)
                    } label: {
                        Text("Add")
                            .font(.title3)
                    }
                }
            }
        }
        .sheet(isPresented: $showReadingForm) {
            ReadingForm(showReadingForm: $showReadingForm)
        }
    }
}





struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}

//struct ExtractedView: View {
//    var body: some View {
//        HStack {
//            Image("average-dev")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 70)
//                .cornerRadius(4)
//            VStack (alignment: .leading){
//                Text("I'm an average developer 💡")
//                    .fontWeight(.semibold)
//                    .font(.body)
//                    .lineLimit(2)
//                    .minimumScaleFactor(0.5)
//                
//                Text("January 1, 2022")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                
//            }
//        }
//    }
//}


