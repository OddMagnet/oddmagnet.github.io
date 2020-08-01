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

    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body(
                .header(for: context, selectedSection: nil)
                    
                    // short intro

            )
        )
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML()
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
