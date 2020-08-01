
//
//  Node+Header.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func header<T: Website>(for context: PublishingContext<T>,
                                   selectedSection: T.SectionID?) -> Node {
        let sectionIDs = T.SectionID.allCases
        
        return .header(
            .div(.class("wrapper"),
                 .a(.class("site-name"),
                    .h1(.text(context.site.name)),
                    .href("/")
                    // TODO: Add logo
                    //                .img(
                    //                    .class("logo"),
                    //                    .src("/")
                    //                )
                ),
                 .h4(.text(context.site.description)),
                
                // Navigation menu
                .nav(
                    .ul(
                        .forEach(sectionIDs) { section in
                            .li(.class(section == selectedSection ? "selected" : ""),
                                .a(
                                    .href(context.sections[section].path),
                                    .text(context.sections[section].title)
                                )
                            )
                        }
                    )
                )
            )
        )
    }
}
