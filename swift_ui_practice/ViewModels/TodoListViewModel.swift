//
//  TodoListViewModel.swift
//  swift_ui_practice
//
//  Created by Mac on 12/18/25.
//
import Foundation
import Observation
import SwiftData
import SwiftUI

@Observable
class TodoListViewModel {
    var modelContext: ModelContext

    var items: [TodoModel] = [
    ]

    var searchText: String = ""

    init(modelContainer: ModelContainer) {
        self.modelContext = ModelContext(modelContainer)
        loadTodos()
    }
    
    private func loadTodos() {
        let descriptor = FetchDescriptor<TodoModel>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        items=(try? modelContext.fetch(descriptor)) ?? []
    }

    func add(_ item: TodoModel) {
        items.insert(item, at: 0)
        modelContext.insert(item)
        try? modelContext.save()
    }

    func remove(_ item: TodoModel) {
        items.removeAll(where: { $0.id == item.id })
        modelContext.delete(item)
        try? modelContext.save()
    }

    func edit(_ item: TodoModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item
            try? modelContext.save()
        }
    }

    func toggleDone(_ item: TodoModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].toggleCompleted()
            try? modelContext.save()
        }
    }

    var filteredItems: [TodoModel] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if query.isEmpty {
            return items
        }
        
        let lowercasedQuery = query.lowercased()
        
        return items.filter { item in
            item.title.lowercased().contains(lowercasedQuery) ||
            item.todDesc.lowercased().contains(lowercasedQuery)
        }
    }

}
