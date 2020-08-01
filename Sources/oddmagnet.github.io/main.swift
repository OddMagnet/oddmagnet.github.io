import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct OddWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case blog
        case about
        case projects
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://oddmagnet.github.io")!
    var name = "OddWebsite"
    var description = "Hi, I'm Michael, a 💻 programmer, 🎸 music lover, and  enthusiast."
    var language: Language { .english }
    // TODO: add favicon image
    var imagePath: Path? { nil }
    var contactLinks: [Contact] = [.location, .email, .github, .twitter]
}

// This will generate your website using my theme:
try OddWebsite().publish(
    withTheme: .oddTheme(contacts: contacts, projects: projects),
    additionalSteps: [
        .deploy(using: .gitHub("OddMagnet/oddmagnet.github.io", useSSH: false))
    ],
    plugins: [
        .splash(withClassPrefix: "")
    ]
)
