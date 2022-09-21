//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Bilal Durnagöl on 19.09.2022.
//

import SwiftUI

struct NewTaskItemView: View {
    
    // MARK: - PROPERTY
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var task: String = ""
    @Binding var isShowing: Bool
    private var isButtonDisable: Bool {
        task.isEmpty
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
            
                Button {
                    addItem()
                    playSound(sound: .ding)
                    feedback.notificationOccurred(.success)
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(isButtonDisable)
                .onTapGesture {
                    if isButtonDisable {
                    playSound(sound: .tap)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisable ? Color.blue : Color.pink)
                .cornerRadius(10.0)
            } //: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background {
                Color(uiColor: .secondarySystemBackground)
            }
            .cornerRadius(16.0)
            .shadow(color: .black.opacity(0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VStack
        .padding()
    }
    
    // MARK: - Helper Function
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.id = UUID()
            newItem.task = task
            newItem.completion = false
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
}

// MARK: - PREVIEW

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.ignoresSafeArea(.all))
    }
}
