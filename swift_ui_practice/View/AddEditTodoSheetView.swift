import SwiftUI

struct AddEditTodoView: View {
    let todoListViewModel: TodoListViewModel
    var existingItem: TodoModel?

    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var description: String = ""

    var isEditing: Bool {
        existingItem != nil
    }

    var body: some View {
        VStack(spacing: 24) {

            VStack(spacing: 8) {
                Text(isEditing ? "Edit Todo" : "New Todo")
                    .font(.title2.bold())

                Text("Keep it short and meaningful")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            TextField("Title", text: $title)
                .textFieldStyle(.plain)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.secondarySystemBackground))
                )

            TextField("Description", text: $description)
                .textFieldStyle(.plain)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.secondarySystemBackground))
                )

            Spacer().layoutPriority(2)
            VStack(spacing: 12) {
                Button(action: save) {
                    Text(isEditing ? "Save Changes" : "Add Todo")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(title.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .disabled(title.isEmpty)

                Button("Cancel") {
                    dismiss()
                }
                .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(24)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
        .presentationBackground(.regularMaterial)
        .onAppear {
            title = existingItem?.title ?? ""
            description = existingItem?.todDesc ?? ""
        }
    }

    private func save() {
        guard !title.isEmpty else { return }

        withAnimation {
            if let todo = existingItem {
                todo.title = title
                todo.todDesc = description
                
                todoListViewModel.edit(todo)
            } else {
                let todo = TodoModel(
                    title: title,
                    todDesc: description,
                )
                
                todoListViewModel.add(todo)
            }
        }
        
        dismiss()
    }
}



