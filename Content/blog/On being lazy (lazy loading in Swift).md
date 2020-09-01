---
date: 2020-09-01 15:00
description: Lazy Loading in Swift.
tags: Swift, Blog, Syntax
---

# On being lazy (lazy loading in Swift)

It has been quite a while since my last post, so why not make a post about laziness, or rather lazy loading?

## What it means to be lazy
Imagine you have some computed property that you may or may not be used when your app is running and if it's used it might only be used a few times or a lot of times.  
Now imagine that computed property taking a lot of computational power.  
Calculating and storing it right away, that would be useful if the property gets used a lot, but a waste of cpu when it never gets used. Calculating it every time instead of storing it would be just as wasteful if it was used a lot.  
To remedy this, the `lazy` keyword is used, that way the property can be calculated and stored, but that will only happen once it's accessed the first time.

### Computed properties
For computed properties it's as simple as adding the lazy keyword in front and adding parenthesis at the end of the closure that follows the computed property.  
Why parenthesis? I think this is best explained by an example, let's imagine a simple class like: 
```
class Person {
	let name: String
 
	init(name: String) {
		self.name = name
	}
	
	lazy var favoriteFood = {
		return "Burgers"
	}()
	
	lazy var favoriteDrink = {
		return "Orange Juice"
	}
}

let oddmagnet = Person(name: "OddMagnet")
```
The now let's use those lazy computed properties, `print(oddmagnet.favoriteFood)` would print `Burgers`, while `print(oddmagnet.favoriteDrink)` would print `(Function)`.  
In other words, without the parenthesis a function is assigned to the property instead of just a value.

#### Static properties
On the topic of properties I think it's worth a quick mention that static properties are lazy by default.
```
class Food {
	/* some code omitted for brevity */
	static let localizedName = GetLocalization(for name)
}
```
In this example the `localizedName` would only be created once it's accessed the first time.  
_(This is not an ideal example, since the language settings in the device change and there are much better options for localisation, but I hope it gets the point across)_

### Methods
Most people like to structure their code, like separating properties and methods, but lazy properties are a weird middle-ground. Luckily this is very easy to fix, by simply using a method call to assign a value to the computed property instead of giving it a closure.
```
class Person {
	/* some code omitted for brevity */
	// MARK: - Properties
	lazy var favoriteFood = self.getFavoriteFood()
	
	// MARK: - Methods
	private func getFavoriteFood() -> String {
		return "Burgers"
	}
}	
```