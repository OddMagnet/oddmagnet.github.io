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
            htmlFactory: OddHtmlFactory(contacts: contacts, projects: projects),
            resourcePaths: ["Resources/OddTheme/styles.css"]
        )
    }
}

private struct OddHtmlFactory<Site: Website>: HTMLFactory {
    let contacts: Contacts
    let projects: Projects
    
    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                                
                // TODO: Idea, give wrapper necessary classes so projects and posts don't need their own
                .wrapper(
                    // small about section
                    .div(.class("smallAbout"),
                        .img(.class("avatar"), .src("avatar.jpg")),
                        .div(.class("introduction"),
                             .contentBody(index.body)
                        )
                    ),

                    // small showcase for projects
                    // TODO: classes for project showcase
                    .if(projects.items.count > 0,
                        .div(.class(""),
                             // TODO: classes for project H1
                            .div(.class(""),
                                 .a(
                                    .href("/projects"),
                                    .h1("👨🏼‍💻 Projects")
                                )
                            ),
                            // TODO: classes for projects unordered list
                            .div(.class(""),
                                 .indexProjectList(for: projects.items, on: context.site)
                            )
                        )
                    ),
                    
                    
                    // posts
                    // TODO: classes for posts
                    .div(.class(""),
                         // TODO: classes for H1
                         .div(.class(""),
                              .a(
                                .href("/blog"),
                                .h1("📓 Latest content")
                            )
                        ),
                         .itemList(
                            for: context.allItems(sortedBy: \.date, order: .descending),
                            on: context.site
                        )
                    ),
                    
                    // footer
                    .footer(for: context.site)
                )
            )
        )
    }

    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body(
                .header(for: context, selectedSection: section.id),
                .wrapper(
                    .h1(.text(section.title)),
                    .itemList(for: section.items, on: context.site)
                ),
                .footer(for: context.site)
            )
        )
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .class("item-page"),
                .header(for: context, selectedSection: item.sectionID),
                .wrapper(
                    .article(
                        .div(
                            .class("content"),
                            .contentBody(item.body)
                        ),
                        .span("Tagged with: "),
                        .tagList(for: item, on: context.site)
                    )
                ),
                .footer(for: context.site)
            )
        )
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .wrapper(.contentBody(page.body)),
                .footer(for: context.site)
            )
        )
    }

    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .wrapper(
                    .h1("Browse all tags"),
                    .ul(
                        .class("all-tags"),
                        .forEach(page.tags.sorted()) { tag in
                            .li(
                                .class("tag"),
                                .a(
                                    .href(context.site.path(for: tag)),
                                    .text(tag.string)
                                )
                            )
                        }
                    )
                ),
                .footer(for: context.site)
            )
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .wrapper(
                    .h1(
                        "Tagged with ",
                        .span(.class("tag"), .text(page.tag.string))
                    ),
                    .a(
                        .class("browse-all"),
                        .text("Browse all tags"),
                        .href(context.site.tagListPath)
                    ),
                    .itemList(
                        for: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }

    static func header<T: Website>(
        for context: PublishingContext<T>,
        selectedSection: T.SectionID?
    ) -> Node {
        let sectionIDs = T.SectionID.allCases

        return .header(
            .wrapper(
                .a(.class("site-name"), .href("/"), .text(context.site.name)),
                .if(sectionIDs.count > 1,
                    .nav(
                        .ul(.forEach(sectionIDs) { section in
                            .li(.a(
                                .class(section == selectedSection ? "selected" : ""),
                                .href(context.sections[section].path),
                                .text(context.sections[section].title)
                            ))
                        })
                    )
                )
            )
        )
    }

    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                    .p(
                        .class("item-date"),
                        .text(DateFormatter.localizedString(from: item.date, dateStyle: .medium, timeStyle: .none))
                    ),
                    .tagList(for: item, on: site),
                    .p(.text(item.description))
                ))
            }
        )
    }

    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(.class("tag-list"), .forEach(item.tags) { tag in
            .li(.a(
                .href(site.path(for: tag)),
                .text(tag.string)
            ))
        })
    }

    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            ),
            .p(.a(
                .text("RSS feed"),
                .href("/feed.rss")
            ))
        )
    }
    
    // MARK: Custom nodes
    static func indexProjectList<T: Website>(for items: [Project], on site: T) -> Node {
        // TODO: CSS for projects container
        return .ul(.class("ul-project-container"),
                   .forEach(items) { item in
                    // TODO: classes for the project items
                    .li(.class(""),
                        .a(
                            .href("projects#\(item.code)"),
                            // small project info box
                            .div(
                                .img(.src(item.appIcon ?? "defaultAppIcon.jpg")),
                                .br(),
                                .text(item.name),
                                // TODO: class for project subheader
                                .p(.class(""),
                                   .text(item.subheader)
                                )
                            )
                        )
                    )
            }
        )
    }
}

