//
//  File.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
}
