//
//  AddNewTag.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 21/05/22.
//

import SwiftUI

struct AddNewCategory: View {
    @State var newCategory: String = ""
    @State var newTagColor: Color = Color.orange
    @State var showColorPicker: Bool = false
    @State var isColorPicked: Bool = false
    
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    TextField("New Category", text: $newCategory)
                }
                Section {
                    HStack(spacing: 6) {
                        Rectangle()
                            .foregroundColor(newTagColor)
                            .cornerRadius(14)
                            .frame(width: 82, height: 82)
                        Spacer()
                        VStack() {
                            Spacer()
                            HStack() {
                                
                                CircleCategoryColorPicker(circleColor: .orange, newTagColor: $newTagColor, isPicked: $isColorPicked)
                                Spacer()
                                CircleCategoryColorPicker(circleColor: .green, newTagColor: $newTagColor, isPicked: $isColorPicked)
                                Spacer()
                                CircleCategoryColorPicker(circleColor: .blue, newTagColor: $newTagColor, isPicked: $isColorPicked)
                                Spacer()
                                CircleCategoryColorPicker(circleColor: .green, newTagColor: $newTagColor, isPicked: $isColorPicked)
                            }
                            Spacer()
                            HStack() {
                                CircleCategoryColorPicker(circleColor: .blue, newTagColor: $newTagColor, isPicked: $isColorPicked)
                                Spacer()
                                CircleCategoryColorPicker(circleColor: .green, newTagColor: $newTagColor, isPicked: $isColorPicked)
                                Spacer()
                                CircleCategoryColorPicker(circleColor: .blue, newTagColor: $newTagColor, isPicked: $isColorPicked)
                                Spacer()
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 30, height: 30)
                                    .onTapGesture {
                                        self.showColorPicker.toggle()
                                    }
                                    .overlay(
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                    )
                            }
                            Spacer()
                            
                            
                        }
                        
                    }
                }
                if showColorPicker {
                    Section {
                        
                        VStack {
                            ColorPicker("Custom category tag color", selection: $newTagColor, supportsOpacity: false)
                                
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
//                .navigationTitle("New Category")
//                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

struct CircleCategoryColorPicker: View {
    let circleColor: Color
    @Binding var newTagColor: Color
    @Binding var isPicked: Bool

    
    

    var body: some View {
        Circle()
            .foregroundColor(circleColor)
            .frame(width: 30, height: 30)
            .if(isPicked, transform: { view in
                view.overlay(IsPicked(circleColor: circleColor))
            })
            .onTapGesture {
                self.isPicked.toggle()
                newTagColor = circleColor
                
                if newTagColor == circleColor {
                    isPicked = true
                } else {
                    isPicked = false
                }
            }
    }
}

struct AddNewTag_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCategory()
    }
}

struct IsPicked: View {
    let circleColor: Color
    
    var body: some View {
        Circle()
            .foregroundColor(.white)
            .frame(width: 25, height: 25)
            .overlay(
                Circle()
                    .foregroundColor(circleColor)
                    .scaledToFit()
                    .frame(width: 20)
            )
    }
}


extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
