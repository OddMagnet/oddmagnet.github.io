//
//  Node+ProjectList.swift
//  
//
//  Created by Michael Brünen on 05.08.20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func projectList<T: Website>(for items: [Project], on site: T) -> Node {
        return .div(
            .forEach(items) { item in
                // Project row
                .div(.class("project-row"),
                     // Project column left
                    .div(.class("project-column-left"),
                         .div(.class("preview"),
                              .div(.class("preview-inner"),
                                   .if(item.previewType == PreviewType.imageOrGif,
                                       .img(.src("/Previews/" + (item.previewFile)))
                                    ),
                                   .if(item.previewType == PreviewType.video,
                                       .video(
                                        .source(
                                            .src("/Previews/" + (item.previewFile)),
                                            .attribute(named: "type", value: "video/mp4")
                                        ),
                                        .attribute(named: "autoplay"),
                                        .attribute(named: "loop"),
                                        .attribute(named: "muted"),
                                        .attribute(named: "playsinline")
                                    )
                                )
                            )
                        )
                    ),
                    // Project column right
                    .div(.class("project-column-right"),
                         .div(.class("app-row"),
                              // App column left
                            .div(.class("app-column-left"),
                                 .img(.id(item.code),
                                      .class("app_icon"),
                                      .src("/Previews/" + (item.appIcon))
                                )
                            ),
                            // App column right
                            .div(.class("app-column-right"),
                                 .h2(.class("app_name"),
                                     .text(item.name)
                                ),
                                 .h6(.class("app_header"),
                                     .text(item.subheader)
                                )
                            )
                        ),
                         .div(.class("app_description"),
                              .forEach(item.paragraphs) { paragraph in
                                .p(.text(paragraph))
                            },
                              .h4(.text("Technologies")),
                              .ul(.class("tech-list"),
                                  .forEach(item.technologies) { tech in
                                    .li(
                                        .text(tech)
                                    )
                                }
                            ),
                              .h4("Github / Appstore links"),
                              .a(
                                .img(.class("app_download"),
                                     .src("/github.svg")
                                ),
                                .href(item.link)
                            ),
                              .br()
                        )
                    )
                )
            }
        )
    }
}
