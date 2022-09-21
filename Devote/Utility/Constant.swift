//
//  Constant.swift
//  Devote
//
//  Created by Bilal Durnagöl on 19.09.2022.
//

import SwiftUI

// MARK: - Formatter

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI

var backgroundGradient = LinearGradient(
    colors: [.pink, .blue],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)


// MARK: - UX

let feedback = UINotificationFeedbackGenerator()
