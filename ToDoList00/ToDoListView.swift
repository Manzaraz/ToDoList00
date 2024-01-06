//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPressented = false
    var toDos = ["Learn Swfit", "Build Apps", "Change the World", "Bring the Awesome", "Take a Vacation "]

    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                            .font(.title2)
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPressented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPressented) {
                NavigationStack {
                    DetailView(passedValue: "")                   
                }
            }        
        }
    }
}


#Preview {
    ToDoListView()
}

