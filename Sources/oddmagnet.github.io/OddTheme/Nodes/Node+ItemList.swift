//
//  Node+ItemList.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func itemList<T: Website>(for items: [Item<T>],
                                     on site: T) -> Node {
        return .ul(.class("item-list"),
                   .forEach(items) { item in
                    .li(
                        .article(
                            .h1(
                                .a(
                                    .href(item.path),
                                    .text(item.title)
                                )
                            ),
                            .tagList(for: item, on: site),
                            .p(.text(item.description))
                        )
                    )
            }
        )
    }
}
