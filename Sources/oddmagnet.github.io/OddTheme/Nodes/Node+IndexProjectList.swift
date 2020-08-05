//
//  Node+IndexProjectList.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func indexProjectList<T: Website>(for items: [Project],
                                             on site: T) -> Node {
        return .ul(.class("ul-project-container"),
                   .forEach(items) { item in
                    .li(.class("li-project-item"),
                        .a(
                            .href("/projects#\(item.code)"),
                            .div(
                                .img(.src("/Previews/" + (item.appIcon))),
                                .br(),
                                .text(item.name),
                                .p(.class("appSubheader"),
                                   .text(item.subheader)
                                )
                            )
                        )
                        
                    )
            }
        )
    }
}
