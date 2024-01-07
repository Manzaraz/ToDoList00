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
        loadData()
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
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(indices: IndexSet, newOffset: Int) {
        toDos.move(fromOffsets: indices, toOffset: newOffset)
        saveData()
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) // try? means if error is thrown, data = nil
        
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
}
