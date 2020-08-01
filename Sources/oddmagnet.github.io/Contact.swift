//
//  Contact.swift
//  
//
//  Created by Michael Brünen on 01.08.20.
//

import Foundation

struct Contact {
    let title: String
    let url: String
    let icon: String
}

struct Contacts {
    let items: [Contact]
}

let contacts = Contacts(items: [.location, .email, .github, .twitter])

extension Contact {
    static var location: Contact {
        return Contact(
            title: "Salzbergen, Germany",
            url: "https://de.wikipedia.org/wiki/Salzbergen",
            icon: "fas fa-map-marker-alt"
        )
    }
        
    static var email: Contact {
        return Contact(
            title: "Email",
            url: "mailto:mibruenen@gmail.com",
            icon: "fas fa-envelope-open-text"
        )
    }
    
    static var github: Contact {
        return Contact(
            title: "GitHub",
            url: "https://github.com/OddMagnet",
            icon: "fab fa-github-square"
        )
    }
    
    static var twitter: Contact {
        return Contact(
            title: "Twitter",
            url: "https://twitter.com/OddMagnetDev",
            icon: "fab fa-twitter-square"
        )
    }

}
