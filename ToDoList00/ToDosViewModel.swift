//
//  ToDosViewModel.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 06/01/2024.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo]  = []
    
    init() {
        // Temp Data here. Will eventually load in saved data
        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo) {
        // if new, append to toDoVM.todos else update the toDo that was passed in from the list.
        if toDo.id == nil {
            var newTodo = toDo
            newTodo.id = UUID().uuidString
            toDos.append(newTodo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func moveToDo(indices: IndexSet, newOffset: Int) {
        toDos.move(fromOffsets: indices, toOffset: newOffset)

    }
}
