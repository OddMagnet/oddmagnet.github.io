---
date: 2020-08-09 15:00
description: Some notes on pattern matching in Swift.
tags: Swift, Blog
---

# Some notes on pattern matching in Swift
When using pattern matching in Swift most tasks can be accomplished with the basics, sometimes there are ways for a more succinct solutions and in a few cases the basics won't suffice.  
In this post I'm going over a few things I learned that I personally would classify as intermediate to advanced pattern matching.

## Tuples
Even though I rarely use tuples, the idea of using them in pattern matching is quite interesting to me.  
Since it's possible to ignore parts of a tuple, code like this is possible:
```
let tuple = (artist: "Metallica", album: "Master of Puppets")

switch tuple {
	case ("Metallica", "Master of Puppets"):
		print("This album was released in 1986")
	case ("Metallica", _):
		print("Metallica's first album was released in 1983, their latest in 2016")
	case (_, "St. Anger"):
		print("This Metallica album was released in 2003)
}
```

Additionally tuples can also be used with computed values, e.g. the classic _FizzBuzz_ challenge can be solved like this:
```
switch (input % 3 == 0, input % 5 == 0) {
	case (true, false):
		print("Fizz")
	case (false, true):
		print("Buzz")
	case (true, true):
		print("FizzBuzz")
} 
```
## Ranges
More often than not when I see ranges in pattern matching it looks something like this:
```
if 1980..<2000 = year { ... }
```
Which is sad, because since the above creates an instance of the __Range__ type, it also has access to it's methods, which makes code like this possible:
```
let year = 1992

switch year {
	case (1946..<1965).containts(year):
		print("You're a baby boomer")
	case (1965..<1980).containts(year):
		print("You're a Gen X'er")
	case (1980..<1995).containts(year):
		print("You're a Millenial")
}
```
This becomes even more useful when used in combination with associated values of an Enum:
```
enum MusicType {
	case headphones
	case speakers
	case live(audienceLoudness: Int)
}

let concert = MusicType.live(audienceLoudness: 100)

switch concert {
	case .headphones:
		print("Keeping it to yourself")
	case .speakers:
		print("Listening with friends")
	case .concert(let loudness) where (1..<30).contains(loudness):
		print("A pretty lousy concert")
	case .concert(let loudness) where (30..<60).contains(loudness):
		print("A decent concert")
	case .concert(let loudness) where (60..<80).contains(loudness):
		print("A great concert")
	case .concert(let loudness) where (80...100).contains(loudness):
		print("One of the best concerts ever")
}
```