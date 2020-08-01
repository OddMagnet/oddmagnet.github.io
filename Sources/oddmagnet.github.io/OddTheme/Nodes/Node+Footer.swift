//
//  Node+Footer.swift
//  
//
//  Created by Michael Brünen on 02.08.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Written in Swift, made with "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                ),
                .text(" & "),
                .a(
                    .text("Splash"),
                    .href("https://github.com/JohnSundell/SplashPublishPlugin")
                ),
                .text(".")
            ),
            .p(
                .text("©2020 Michael Brünen")
            )
        )
    }
}
