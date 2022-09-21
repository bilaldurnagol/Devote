//
//  ListRowItemView.swift
//  Devote
//
//  Created by Bilal Durnagöl on 19.09.2022.
//

import SwiftUI

struct ListRowItemView: View {
    
    // MARK: - PROPERTY
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item
    
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.completion)
        } //: Toggle
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { value in
            if self.viewContext.hasChanges {
                try? viewContext.save()
            }
        }
    }
}
