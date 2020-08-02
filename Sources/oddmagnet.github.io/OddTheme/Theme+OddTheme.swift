//
//  File.swift
//  
//
//  Created by Michael Brünen on 30.07.20.
//

import Foundation
import Publish
import Plot
import SplashPublishPlugin

extension Theme {
    static func oddTheme(contacts: Contacts, projects: Projects) -> Self {
        Theme(
            htmlFactory: OddHtmlFactory(contacts: contacts, projects: projects)
        )
    }
}

private struct OddHtmlFactory<Site: Website>: HTMLFactory {
    let contacts: Contacts
    let projects: Projects

    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, stylesheetPaths: ["OddTheme/styles.css"]),
            .body(
                .header(for: context, selectedSection: nil),
                    
                // Projects
                .div(.class("index page wrapper content clearfix "),
                     .div(.class("section-header float-container"),
                          .h1("👨🏼‍💻 Projects")
                    ),
                     .div(.class("projects-ul"),
                          .indexProjectList(for: projects.items, on: context.site)
                    )
                ),
                
                // Blog
                .div(.class("wrapper content clearfix"),
                     .div(.class("section-header float-container"),
                          .a(
                            .href("/blog"),
                            .h1("📓 Latest posts")
                        )
                    ),
                     .itemList(
                        // TODO: filter for categories
                        for: context.allItems(sortedBy: \.date, order: .descending),
                        on: context.site
                    ),
                     .a(.class("browse-all"),
                        .href("/blog"),
                        // TODO: add counter of posts
                        .text("Browse all posts")
                    )
                ),
                
                // Footer
                .footer(for: context.site)

            )
        )
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site, stylesheetPaths: ["OddTheme/styles.css"]),
            .body(
                .header(for: context, selectedSection: section.id),
                .wrapper(
                    .div(.class("Introduction"),
                         .contentBody(section.body)
                    ),
                    .itemList(
                        for: section.items.filter { $0.sectionID == section.id},
                        on: context.site
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML()
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML()
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML()
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML()
    }
}
