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
//        .init(name:         "Example",
//              code:         "example",
//              subheader:    "The perfect example project",
//              status:       .published,
//              appIcon:      "/Previews/placeholderAppIcon.png",
//              previewType:  .imageOrGif,
//              previewFile:  "/Previews/placeholderAppImage.jpg",
//              link:         "github.com/OddMagnet",
//              technologies: ["SwiftUI", "Swift"],
//              paragraphs: [
//                "",
//                "",
//                ""
//            ]
//        ),
        .init(name:         "iRoll",
              code:         "iroll",
              subheader:    "An app that lets the user roll dice",
              status:       .published,
              appIcon:      "/Previews/placeholderAppIcon.png",
              previewType:  .imageOrGif,
              previewFile:  "https://raw.githubusercontent.com/OddMagnet/100-Days-of-Swift/master/095-095%20Consolidation%20VII/iRoll.gif",
              link:         "https://github.com/OddMagnet/100-Days-of-Swift/tree/master/095-095%20Consolidation%20VII",
              technologies: ["SwiftUI", "Swift", "Core Data"],
              paragraphs: [
                "Consolidation of days 79 to 94 of the 100 Days of SwiftUI Challenge.",
                "Key points were 'Functional Programming' and 'Swift's Result type'.",
                "The challenge was to create an app that lets the user roll dice it needed options for how many dices are roled and how many sides they have, to show the total rolled and store results using Core Data. Additional challenges were to add haptic feedback on roll and letting the dices 'flick' through some values before settling."
            ]
        ),
        .init(name:         "iRemember",
              code:         "iremember",
              subheader:    "An app that helps remembering peoples names",
              status:       .published,
              appIcon:      "/Previews/placeholderAppIcon.png",
              previewType:  .imageOrGif,
              previewFile:  "https://raw.githubusercontent.com/OddMagnet/100-Days-of-Swift/master/077-078%20Consolidation%20VI/iRemember3.png",
              link:         "https://github.com/OddMagnet/100-Days-of-Swift/tree/master/077-078%20Consolidation%20VI",
              technologies: ["SwiftUI", "Swift", "MapView"],
              paragraphs: [
                "Consolidation of days 62 to 76 of the 100 Days of SwiftUI Challenge.",
                "Key points were 'operator overloading' and 'custom property wrappers'.",
                "The challenge was to create an app that helps remembering peoples name by importing/taking and attach a name to it, display the collection of pictures and names in a list and show a details screen when a list item is tapped. Additionally the location where the person was first met is attached and the data is saved locally."
            ]
        ),
        .init(name:         "FriendFace",
              code:         "friendface",
              subheader:    "An app that fetches and displays JSON data",
              status:       .published,
              appIcon:      "/Previews/placeholderAppIcon.png",
              previewType:  .imageOrGif,
              previewFile:  "https://raw.githubusercontent.com/OddMagnet/100-Days-of-Swift/master/060-061%20Consolidation%20V/FriendFace1.png",
              link:         "https://github.com/OddMagnet/100-Days-of-Swift/tree/master/060-061%20Consolidation%20V",
              technologies: ["SwiftUI", "Swift", "Core Data"],
              paragraphs: [
                "Consolidation of days 49 to 59 of the 100 Days of SwiftUI Challenge.",
                "Key points were 'AnyView vs Group, type erasure', and 'Codable keys'.",
                "The challenge was to create an app that downloads JSON data, converts it to Swift types and displays it to the user. A bonus challenge was to make the whole app work with Core Data and to make Core Data conform to Codable rather than loading into structs and then into Core Data."
            ]
        ),
        .init(name:         "iTrack",
              code:         "itrack",
              subheader:    "A simple habit tracking app",
              status:       .published,
              appIcon:      "/Previews/placeholderAppIcon.png",
              previewType:  .imageOrGif,
              previewFile:  "https://raw.githubusercontent.com/OddMagnet/100-Days-of-Swift/master/047-048%20Consolidation%20IV/iTrack1.png",
              link:         "https://github.com/OddMagnet/100-Days-of-Swift/tree/master/047-048%20Consolidation%20IV",
              technologies: ["SwiftUI", "Swift"],
              paragraphs: [
                "Consolidation of days 36 to 46 of the 100 Days of SwiftUI Challenge.",
                "Key points were 'the difference between classes and structs and why it matters, 'using UserDefaults' and 'Generics'.",
                "The challenge was to create a habit-tracking app, that has a list of activities to track, a form to add new activities and can show a detail view with description of the activities and how often it was completed. Additionally it needs a way to save and load the data using Codable and UserDefaults."
            ]
        ),
        .init(name:         "iMultiply",
              code:         "imultiply",
              subheader:    "A simple multiplication game.",
              status:       .published,
              appIcon:      "/Previews/placeholderAppIcon.png",
              previewType:  .imageOrGif,
              previewFile:  "https://raw.githubusercontent.com/OddMagnet/100-Days-of-Swift/master/035-035%20Consolidation%20III/iMultiply1.png",
              link:         "https://github.com/OddMagnet/100-Days-of-Swift/tree/master/035-035%20Consolidation%20III",
              technologies: ["SwiftUI", "Swift"],
              paragraphs: [
                "Consolidation of days 26 to 34 of the 100 Days of SwiftUI Challenge.",
                "Key points were 'Ranges with ForEach and Lists', 'how strings work in Swift' and 'what flat app bundles are'.",
                "The challenge was to create an 'edutainment' app that helps practicing multiplication tables, where the player needs to select which multiplication tables they want to practice and how many questions they want to be asked. Questions should be randomly generated, within the difficulty range selected by the player."
            ]
        ),
        .init(name:         "Rock, Paper, Scissors",
              code:         "rps",
              subheader:    "A simple game of 'Rock, Paper, Scissors'",
              status:       .published,
              appIcon:      "/Previews/placeholderAppIcon.png",
              previewType:  .imageOrGif,
              previewFile:  "https://raw.githubusercontent.com/OddMagnet/100-Days-of-Swift/master/025-025%20Consolidation%20II/RockPaperScissors.png",
              link:         "https://github.com/OddMagnet/100-Days-of-Swift/tree/master/025-025%20Consolidation%20II",
              technologies: ["SwiftUI", "Swift"],
              paragraphs: [
                "Consolidation of days 26 to 34 of the 100 Days of SwiftUI Challenge.",
                "Key points were 'Structs vs Classes', 'working with ForEach' and 'working with bindings'.",
                "The challenge was to create an app that challenges the player to win at 'rock, paper, scissors', each turn the app randomly picks either rock, paper or scissors and prompts the player to either win or loose the game, if they're correct, they score a point, otherwise loose a point. The game ends after 10 questions and the score is shown."
            ]
        ),
    ]
)
