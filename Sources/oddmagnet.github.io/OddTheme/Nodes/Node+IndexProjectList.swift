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
                   .if(items.count > 4,
                       .forEach(0...3) { index in
                        .li(.class("li-project-item"),
                            .a(
                                .href("/projects#\(items[index].code)"),
                                .div(
                                    .img(.src(items[index].appIcon)),
                                    .br(),
                                    .text(items[index].name),
                                    .p(.class("appSubheader"),
                                       .text(items[index].subheader)
                                    )
                                )
                            )
                            
                        )
                    }
            ),
                   .if(items.count <= 4,
                       .forEach(items) { item in
                        .li(.class("li-project-item"),
                            .a(
                                .href("/projects#\(item.code)"),
                                .div(
                                    .img(.src(item.appIcon)),
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
        )
    }
}
