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
    
    
    // reading form
    @State var bookTitle: String = ""
    @State var bookAuthor: String = ""
    @State var bookCategory: String = ""
    
    
    init() {
        UITableView.appearance().sectionFooterHeight = 0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(readingListManager.readingLists) { readingList in
                        Section {
                            BookCardView(bookTitle: readingList.title, bookAuthor: readingList.author)
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
                        // ketika di klik
                        showReadingForm.toggle()
                    } label: {
                        Text("Add")
                            .font(.title3)
                    }
                }
            }
        }
        .sheet(isPresented: $showReadingForm) {
            ReadingForm(showReadingForm: $showReadingForm, readingListManager: $readingListManager, bookTitle: $bookTitle, bookAuthor: $bookAuthor, bookCategory: $bookCategory)
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


