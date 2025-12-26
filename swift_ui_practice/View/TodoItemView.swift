import SwiftUI

struct TodoItemView: View {
    let item: TodoModel
    let onToggleTapped: (TodoModel) -> Void
    let onEditTapped: (TodoModel) -> Void

    var body: some View {

        HStack(alignment: .center, spacing: 12) {
            Image(
                systemName: item.isCompleted
                    ? "checkmark.circle.fill" : "circle"
            )
            .foregroundColor(item.isCompleted ? .green : .gray)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .strikethrough(item.isCompleted)
                    .font(.headline)
                    .foregroundStyle(.primary)
                 
                if !item.todDesc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(item.todDesc)
                        .strikethrough(item.isCompleted)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .truncationMode(.tail)
                }
            }

            Spacer()

            Button(action: {
                onEditTapped(item)
            }) {
                Image(systemName: "pencil.circle.fill")
                    .frame(width: 30, height: 30)
            }.buttonStyle(.plain)
        }

        .padding()
        .background(.background)
        .cornerRadius(15)
        .shadow(color: .primary.opacity(0.1), radius: 5, x: 0, y: 5)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .onTapGesture {
            onToggleTapped(item)
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())

    }
}

#Preview {
    
    TodoItemView(
        item: TodoModel(title: "todo item", todDesc: ""),
        onToggleTapped: { imte in },
        onEditTapped: { item in }
    )


    TodoItemView(
        item: TodoModel(title: "todo item", todDesc: "Some decription"),
        onToggleTapped: { imte in },
        onEditTapped: { item in }
    )

    TodoItemView(
        item: TodoModel(
            title: "todo item",
            todDesc: "Some decription",
            isCompleted: true
        ),
        onToggleTapped: { imte in
        },
        onEditTapped: { item in }
    )
}
