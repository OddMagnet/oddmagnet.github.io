//
//  File.swift
//  
//
//  Created by Michael Brünen on 02.08.20.
//

import Foundation
import Publish

extension Item {
    
    func dateString(
        dateStyle: DateFormatter.Style = .full,
        timeStyle: DateFormatter.Style = .none
    ) -> String {
        DateFormatter.localizedString(
            from: self.date,
            dateStyle: dateStyle,
            timeStyle: timeStyle
        )
    }
}
