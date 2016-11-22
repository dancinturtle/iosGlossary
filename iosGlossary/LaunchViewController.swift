//
//  ViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CancelButtonDelegate {
    
    // Put all the terms here on launch view controller. This controller can pass the deck around to where it needs to go.
    
    
    let menuItems = ["Fundamentals", "iOS Basics", "iOS Intermediate", "iOS Advanced", "Review all terms"]
    var stringForTitle: String?
    
    
    // all terms will be an array of all the flashcards we make in View Did Load
    var allTerms = [GlossyFlashcard]()
    
   
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        allTerms = [
            GlossyFlashcard(term: "compiled vs interpreted", def: "Compiled languages have to be translated completely before running while interpreted languages get translated on the fly as the program is getting read. Swift is a compiled language.", plat: "Fundamentals - Swift - Playground", doc: "https://en.wikipedia.org/wiki/Swift_(programming_language)"),
            GlossyFlashcard(term:"playground", def: "Playground is an interactive environment within Xcode. The left side is the code editor and the right side shows code output.", plat: "Fundamentals - Swift - Playground", doc: "https://developer.apple.com/swift/blog/?id=35"),
            GlossyFlashcard(term:"Statically Typed", def: "Swift is statically typed so it forces the developer to be more conscious about types and it also allows the computer to run more efficiently by allocating just enough space for each variable.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term:"let", def:"Swift constants must be declared with the let keyword. Constants hold data that does not vary.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term:"var", def: "Swift variables must be declared with the var keyword. Variables hold data that varies.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term: "logical operators", def: "&& - Both conditions must be true (AND)\n|| - One of the conditions must be true (OR)\n! - true becomes false, false becomes true", plat : "Fundamentals - Swift - Conditionals", doc : "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-ID60"),
             GlossyFlashcard(term: "int", def: "A type of integer. Swift provides an integer type, Int, which has the same size as the current platform’s native word size:\nOn a 32-bit platform, Int is the same size as Int32.\nOn a 64-bit platform, Int is the same size as Int64.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term: "uint32", def: "A type of integer, which is unsigned. Swift provides the unsigned integer type, UInt, which has the same size as the current platform’s native word size:\nOn a 32-bit platform, UInt is the same size as UInt32.\nOn a 64-bit platform, UInt is the same size as UInt64.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term: "double", def: "Floating-point numbers are numbers with a fractional component. Double represents a 64-bit floating-point number.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term: "float", def: "Floating-point numbers are numbers with a fractional component. Float represents a 32-bit floating-point number.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term: "array", def: "An array stores values of the same type in an ordered list.", plat: "Fundamentals - Swift - Arrays", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105"),
             GlossyFlashcard(term: "for-in loops closed range", def: "A for-in loop performs a set of code in a specific range, sequence, or collection. Inclusive for-in loops use the closed range operator (...).", plat: "Fundamentals - Swift - Loops", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID121"),
             GlossyFlashcard(term: "for-in loops half-open range", def: "A for-in loop performs a set of code in a specific range, sequence, or collection. Half-open range for-in loops use the half-open range operator (..<).", plat: "Fundamentals - Swift - Loops", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID121"),
             GlossyFlashcard(term : "string interpolation", def: "String interpolation lets users insert constants, variables, literals, and expressions into longer strings.", plat: "Fundamentals - Swift - Swift Fundamentals I", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285"),
             GlossyFlashcard(term: "optionals", def: "Optionals say either “there is a value, and it equals x” or there isn’t a value at all.“ In other words, an optional is a type that could either hold nil or a value of a specific type.", plat: "Fundamentals - Swift - Optionals", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"),
             GlossyFlashcard(term: "dictionaries", def: "Dictionaries are unordered collections of key-value associations. A key maps to a value just like a word in a dictionary maps to a definition.", plat : "Fundamentals - Swift - Dictionaries", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105"),
             GlossyFlashcard(term: "function", def: "A block of code that we can use by calling it by name and passing it any input it requires. A function may return an output or it can alter the program without returning anything. A function call is equal to whatever the function returns.", plat: "Fundamentals - Swift - Functions", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158"),
             GlossyFlashcard(term: "class", def: "A way to create your own types. The class is the blueprint for the type, definining its properties and methods. We can then create instances of the class. A class is a reference type and supports inheritance.", plat: "Fundamentals - Swift - Classes", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82"),
             GlossyFlashcard(term: "struct", def: "A way to create your own types that hold a collection of values, much like classes. A struct is a value type and does not support inheritance.", plat: "Fundamentals - Swift - Structs", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82"),
             GlossyFlashcard(term: "value type", def: "Value types are copied when they are assigned to a variable or constant or passed into a function. Changing the value of the copy does not change the original.", plat: "Fundamentals - Swift - Value vs Reference Types", doc: "https://developer.apple.com/swift/blog/?id=10"),
             GlossyFlashcard(term: "reference type", def: "Reference types are not copied when they are assigned to a variable or constant or passed into a function. Instead, their memory address location is passed. Changing the value of a reference type will change all the pointers that refer to that object.", plat: "Fundamentals - Swift - Value vs Reference Types", doc: "https://developer.apple.com/swift/blog/?id=10"),
             GlossyFlashcard(term: "inheritance", def: "A class may inherit properties, methods, and other characteristics from another class.", plat: "Fundamentals - Swift - Inheritance", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html#//apple_ref/doc/uid/TP40014097-CH17-ID193"),
             GlossyFlashcard(term: "initialization", def: "The process of preparing an instance of a class, struct, or enumeration for use, such as setting the initial value for each stored property on that instance.", plat: "Fundamentals - Swift - Inheritance", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203"),
             GlossyFlashcard(term: "super.init", def: "When creating a subclass which inherits from another class, this allows us to call upon the parent class' initialization method. It must be called after the initialization of the child class' properties.", plat: "Fundamentals - Swift - Inheritance", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html"),
             GlossyFlashcard(term: "init", def: "To have more control of how an instance of a type is created, we write our own initializer. The function is not called explicitly. It is called when creating an instance using initialization syntax.", plat: "Fundamentals - Swift - Classes", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html"),
             GlossyFlashcard(term: "parameter", def: "We declare the parameters' names and types when writing a function. The parameters are the expected input the user must supply for the function to run.", plat: "Fundamentals - Swift - Functions", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158"),
             GlossyFlashcard(term: "argument", def: "Arguments are the input values we pass to a function when we call it.", plat: "Fundamentals - Swift - Functions", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158"),
             GlossyFlashcard(term: "arc4random_uniform()", def: "A function that takes in a parameter of the UInt32 type and returns a random number of UInt32type that is less than the provided argument.", plat: "Fundamentals - Swift - Swift Fundamentals III", doc: "https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man3/arc4random.3.html"),
             GlossyFlashcard(term: "object oriented programming", def: "The paradigm of creating your own types and instantiating them.", plat: "Fundamentals - Swift - Classes", doc: "https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/OOP_ObjC/Articles/ooOOP.html")
        ]

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem")
        cell?.textLabel?.text = menuItems[indexPath.row]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAll"{
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! AllTermsTableViewController
            controller.cancelButtonDelegate = self
    
            controller.allTerms = allTerms
            
            
            print ("Going to see all terms")
        }
        else if segue.identifier == "flashcardsSegue"{
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! FlashcardsViewController
            controller.cancelButtonDelegate = self
//            controller.flashcardDelegate = FlashCardDelegate(AllTermsTableViewController)
            controller.navBarTitle = stringForTitle
            controller.allTerms = allTerms
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath == [0,4]{
            performSegue(withIdentifier: "toAll", sender: tableView.cellForRow(at: indexPath))
        }
        else {
            if indexPath == [0,0]{
                stringForTitle = "Fundamentals"
            }
            else if indexPath == [0,1]{
                stringForTitle = "iOS Basics"
            }
            else if indexPath == [0,2]{
                stringForTitle = "iOS Intermediate"
            }
            else if indexPath == [0,3]{
                stringForTitle = "iOS Advanced"
            }
            performSegue(withIdentifier: "flashcardsSegue", sender: tableView.cellForRow(at: indexPath))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelButtonPressedFrom(controller: UIViewController){
        dismiss(animated: true, completion: nil)
    }
    
    

}

