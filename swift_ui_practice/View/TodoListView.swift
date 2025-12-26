import Observation
import SwiftData
import SwiftUI

@MainActor
struct TodoListView: View {
    @AppStorage("theme") var theme: Theme = .light
    @Environment(TodoListViewModel.self) var todoListViewModel
    @State private var isSheetShowing = false
    @State private var editingItem: TodoModel?

    var body: some View {
        @Bindable var todoListViewModel = todoListViewModel

        NavigationStack {
            ZStack {

                List(todoListViewModel.filteredItems) { item in
                    TodoItemView(
                        item: item,
                        onToggleTapped: toggleDone,
                        onEditTapped: showEditSheet,
                    )
                    .swipeActions {
                        Button(action: { remove(item) }) {
                            Image(systemName: "trash")
                        }.tint(.red)
                    }
                }
                .listStyle(.plain)
                .animation(.easeInOut, value: todoListViewModel.searchText)

                Button(action: showSheet) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
                        .frame(width: 60, height: 60)
                        .background(.tint)
                        .clipShape(Circle())

                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottomTrailing
                ).padding(10)
                    .padding(.horizontal, 20)

            }
            .searchable(
                text: $todoListViewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .navigationTitle("Todo List")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {

                    theme.toggle()

                } label: {
                    Image(
                        systemName: theme == .dark
                            ? "moon.circle.fill" : "sun.max.circle.fill"
                    )
                    .symbolRenderingMode(.hierarchical)
                    .font(.title2)
                }
            }
        }
        .sheet(
            item: $editingItem,
            onDismiss: {
                editingItem = nil
            }
        ) { item in
            AddEditTodoView(
                todoListViewModel: todoListViewModel,
                existingItem: item
            )
        }
        .sheet(isPresented: $isSheetShowing) {
            AddEditTodoView(
                todoListViewModel: todoListViewModel,
                existingItem: nil
            )
        }
        .preferredColorScheme(theme.colorScheme)
    }

    func toggleDone(_ item: TodoModel) {
        withAnimation {
            todoListViewModel.toggleDone(item)
        }
    }

    func showEditSheet(_ item: TodoModel) {
        editingItem = item
    }

    func showSheet() {
        editingItem = nil
        isSheetShowing.toggle()
    }
    func remove(_ item: TodoModel) {

        withAnimation {
            self.todoListViewModel.remove(item)
        }

    }
}

#Preview {
    TodoListView().environment(TodoListViewModel.preview())
}

extension TodoListViewModel {
    static func preview() -> TodoListViewModel {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(
            for: TodoModel.self,
            configurations: configuration
        )

        let vm = TodoListViewModel(modelContainer: container)
        vm.items = [
            TodoModel(title: "todo item"),
            TodoModel(title: "todo item", isCompleted: true),
            TodoModel(title: "todo item", todDesc: "some desc"),
        ]
        return vm
    }
}
