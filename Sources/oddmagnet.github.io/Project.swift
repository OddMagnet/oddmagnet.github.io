//
//  Project.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Foundation

enum ProjectStatus: String {
    case inProgress = "In Progress"
    case published = "Published"
    case onPause = "On Pause"
    case cancelled = "Cancelled"
}

enum PreviewType {
    case imageOrGif
    case video
}

struct Project {
    let name: String
    let code: String            // the anchor tag used on the projects page
    let subheader: String
    let status: ProjectStatus
    let appIcon: String
    let previewType: PreviewType
    let previewFile: String
    let link: String            // for github or appstore
    let technologies: [String]
    let paragraphs: [String]    // Description
}

struct Projects {
    let items: [Project]
}

let projects = Projects(
    items: [
        .init(name:         "Example",
              code:         "example",
              subheader:    "The perfect example project",
              status:       .published,
              appIcon:      "placeholderAppIcon.jpg",
              previewType:  .imageOrGif,
              previewFile:  "placeholderAppImage.jpg",
              link:         "github.com/OddMagnet",
              technologies: ["SwiftUI", "Swift"],
              paragraphs: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
        ),
        .init(name:         "Example",
              code:         "example",
              subheader:    "The perfect example project",
              status:       .published,
              appIcon:      "placeholderAppIcon.jpg",
              previewType:  .imageOrGif,
              previewFile:  "placeholderAppImage.jpg",
              link:         "github.com/OddMagnet",
              technologies: ["SwiftUI", "Swift"],
              paragraphs: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
        ),
        .init(name:         "Example",
              code:         "example",
              subheader:    "The perfect example project",
              status:       .published,
              appIcon:      "placeholderAppIcon.jpg",
              previewType:  .imageOrGif,
              previewFile:  "placeholderAppImage.jpg",
              link:         "github.com/OddMagnet",
              technologies: ["SwiftUI", "Swift"],
              paragraphs: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
        ),
    ]
)
