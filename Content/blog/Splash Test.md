---
date: 2020-07-31 17:10
description: A test of the splash plugin for publish.
tags: Swift, Splash, Blog
---

# Splash Test

Just some Swift code to test out the Splash plugin, which should highlight the below code.

``` swift
struct Address {
	let street: String
	let city: String
	let zip: Int
}

struct Student: Person {
	let id = UUID()
	let name: String
	let age: Int
	let address: Address
}

let address = Address(street: "1 Apple Park Way", city: "Cupertino", zip: 95014)

let student = Student(name: "Tim Cook", age: 59, address: address)
```
Some more normal text
