//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPressented = false
    @EnvironmentObject var toDosVM: ToDosViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                    .font(.title2)
                }
                .onDelete(perform: toDosVM.delete)
                .onMove(perform: toDosVM.move)
//                .onDelete(perform: toDosVM.delete(indexSet:))
//                .onMove(perform: toDosVM.move(indices:newOffset:))
                
                //Traditional calls are bellow
//                .onDelete { indexSet in
//                    toDosVM.delete(indexSet: indexSet)
//                }
//                .onMove { indices, newOffset in
//                    toDosVM.move(indices: indices, newOffset: newOffset)
//                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
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
                    DetailView(toDo: ToDo(), newToDo: true) // New value
                }
            }        
        }
    }
}


#Preview {
    ToDoListView()
        .environmentObject(ToDosViewModel())
}

