//
//  File.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Foundation

extension DateFormatter {
    static var blog: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}
