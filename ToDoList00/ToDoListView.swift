//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = ["Learn Swfit", "Build Apps", "Change the World", "Bring the Awesome", "Take a Vacation "]

    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
         
        }
    }
}


#Preview {
    ToDoListView()
}

