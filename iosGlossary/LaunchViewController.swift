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
            GlossyFlashcard(term: "Compiled vs Interpreted", def: "Compiled languages have to be translated completely before running while interpreted languages get translated on the fly as the program is getting read. Swift is a compiled language.", plat: "Fundamentals - Swift - Playground", doc: "https://en.wikipedia.org/wiki/Swift_(programming_language)", section: "Fundamentals"),
            GlossyFlashcard(term:"Playground", def: "Playground is an interactive environment within Xcode. The left side is the code editor and the right side shows code output.", plat: "Fundamentals - Swift - Playground", doc: "https://developer.apple.com/swift/blog/?id=35", section: "Fundamentals"),
            GlossyFlashcard(term:"Statically Typed", def: "Swift is statically typed so it forces the developer to be more conscious about types and it also allows the computer to run more efficiently by allocating just enough space for each variable.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term:"let", def:"Swift constants must be declared with the let keyword. Constants hold data that does not vary.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term:"var", def: "Swift variables must be declared with the var keyword. Variables hold data that varies.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term: "Logical Operators", def: "&& - Both conditions must be true (AND)\n|| - One of the conditions must be true (OR)\n! - true becomes false, false becomes true", plat : "Fundamentals - Swift - Conditionals", doc : "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-ID60", section: "Fundamentals"),
             GlossyFlashcard(term: "int", def: "A type of integer. Swift provides an integer type, Int, which has the same size as the current platform’s native word size:\nOn a 32-bit platform, Int is the same size as Int32.\nOn a 64-bit platform, Int is the same size as Int64.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term: "uint32", def: "A type of integer, which is unsigned. Swift provides the unsigned integer type, UInt, which has the same size as the current platform’s native word size:\nOn a 32-bit platform, UInt is the same size as UInt32.\nOn a 64-bit platform, UInt is the same size as UInt64.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term: "double", def: "Floating-point numbers are numbers with a fractional component. Double represents a 64-bit floating-point number.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term: "float", def: "Floating-point numbers are numbers with a fractional component. Float represents a 32-bit floating-point number.", plat: "Fundamentals - Swift - Numerical Types", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term: "array", def: "An array stores values of the same type in an ordered list.", plat: "Fundamentals - Swift - Arrays", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105", section: "Fundamentals"),
             GlossyFlashcard(term: "for-in loops closed range", def: "A for-in loop performs a set of code in a specific range, sequence, or collection. Inclusive for-in loops use the closed range operator (...).", plat: "Fundamentals - Swift - Loops", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID121", section: "Fundamentals"),
             GlossyFlashcard(term: "for-in loops half-open range", def: "A for-in loop performs a set of code in a specific range, sequence, or collection. Half-open range for-in loops use the half-open range operator (..<).", plat: "Fundamentals - Swift - Loops", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID121", section: "Fundamentals"),
             GlossyFlashcard(term : "String Interpolation", def: "String interpolation lets users insert constants, variables, literals, and expressions into longer strings.", plat: "Fundamentals - Swift - Swift Fundamentals I", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285", section: "Fundamentals"),
             GlossyFlashcard(term: "Optionals", def: "Optionals say either “there is a value, and it equals x” or there isn’t a value at all.“ In other words, an optional is a type that could either hold nil or a value of a specific type.", plat: "Fundamentals - Swift - Optionals", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309", section: "Fundamentals"),
             GlossyFlashcard(term: "Dictionaries", def: "Dictionaries are unordered collections of key-value associations. A key maps to a value just like a word in a dictionary maps to a definition.", plat : "Fundamentals - Swift - Dictionaries", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105", section: "Fundamentals"),
             GlossyFlashcard(term: "function", def: "A block of code that we can use by calling it by name and passing it any input it requires. A function may return an output or it can alter the program without returning anything. A function call is equal to whatever the function returns.", plat: "Fundamentals - Swift - Functions", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158", section: "Fundamentals"),
             GlossyFlashcard(term: "class", def: "A way to create your own types. The class is the blueprint for the type, definining its properties and methods. We can then create instances of the class. A class is a reference type and supports inheritance.", plat: "Fundamentals - Swift - Classes", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82", section: "Fundamentals"),
             GlossyFlashcard(term: "struct", def: "A way to create your own types that hold a collection of values, much like classes. A struct is a value type and does not support inheritance.", plat: "Fundamentals - Swift - Structs", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82", section: "Fundamentals"),
             GlossyFlashcard(term: "Value Type", def: "Value types are copied when they are assigned to a variable or constant or passed into a function. Changing the value of the copy does not change the original.", plat: "Fundamentals - Swift - Value vs Reference Types", doc: "https://developer.apple.com/swift/blog/?id=10", section: "Fundamentals"),
             GlossyFlashcard(term: "Reference Type", def: "Reference types are not copied when they are assigned to a variable or constant or passed into a function. Instead, their memory address location is passed. Changing the value of a reference type will change all the pointers that refer to that object.", plat: "Fundamentals - Swift - Value vs Reference Types", doc: "https://developer.apple.com/swift/blog/?id=10", section: "Fundamentals"),
             GlossyFlashcard(term: "Inheritance", def: "A class may inherit properties, methods, and other characteristics from another class.", plat: "Fundamentals - Swift - Inheritance", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html#//apple_ref/doc/uid/TP40014097-CH17-ID193", section: "Fundamentals"),
             GlossyFlashcard(term: "Initialization", def: "The process of preparing an instance of a class, struct, or enumeration for use, such as setting the initial value for each stored property on that instance.", plat: "Fundamentals - Swift - Inheritance", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203", section: "Fundamentals"),
             GlossyFlashcard(term: "super.init", def: "When creating a subclass which inherits from another class, this allows us to call upon the parent class' initialization method. It must be called after the initialization of the child class' properties.", plat: "Fundamentals - Swift - Inheritance", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html", section: "Fundamentals"),
             GlossyFlashcard(term: "init", def: "To have more control of how an instance of a type is created, we write our own initializer. The function is not called explicitly. It is called when creating an instance using initialization syntax.", plat: "Fundamentals - Swift - Classes", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html", section: "Fundamentals"),
             GlossyFlashcard(term: "Parameter", def: "We declare the parameters' names and types when writing a function. The parameters are the expected input the user must supply for the function to run.", plat: "Fundamentals - Swift - Functions", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158", section: "Fundamentals"),
             GlossyFlashcard(term: "Argument", def: "Arguments are the input values we pass to a function when we call it.", plat: "Fundamentals - Swift - Functions", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158", section: "Fundamentals"),
             GlossyFlashcard(term: "arc4random_uniform()", def: "A function that takes in a parameter of the UInt32 type and returns a random number of UInt32type that is less than the provided argument.", plat: "Fundamentals - Swift - Swift Fundamentals III", doc: "https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man3/arc4random.3.html", section: "Fundamentals"),
             GlossyFlashcard(term: "Object Oriented Programming", def: "The paradigm of creating your own types and instantiating them.", plat: "Fundamentals - Swift - Classes", doc: "https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/OOP_ObjC/Articles/ooOOP.html", section: "Fundamentals"),
             GlossyFlashcard(term:"Xcode", def:"An Integrated Development Environment (IDE) developed by Apple that contains the software development tools for macOS, iOS, WatchOS and tvOS.", plat:"iOS Basics - Xcode", doc:"https://developer.apple.com/xcode/ide/", section:"iOS Basics"),
             GlossyFlashcard(term:"Single View Application", def:"A template to start your project that sets you up with one view controller already installed as the main window's root view controller.", plat:"iOS Basics - Xcode", doc:"https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson2.html", section:"iOS Basics"),
             GlossyFlashcard(term:"Storyboard", def:"A visual representation of the user interface, which allows the developer to create the UI before hooking it up to code by laying out elements such as buttons and text fields.", plat:"iOS Basics - Storyboards", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/Storyboard.html", section:"iOS Basics"),
             GlossyFlashcard(term:"View Controller", def:"The view controller is where you write your code! It manages a scene and the views, or components, that make up that scene, as well as the interactions between the interface and the underlying data.", plat:"iOS Basics - Storyboards", doc:"https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/", section:"iOS Basics"),
             GlossyFlashcard(term:"Outlet", def:"An outlet wires up a view placed on your storyboard with the code in your view controller. This is necessary to write code that references your views.", plat:"iOS Basics - Connections I", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/CocoaEncyclopedia/Outlets/Outlets.html", section:"iOS Basics"),
             GlossyFlashcard(term:"Action", def:"An action connects the user's interactions with the views to the code in your view controller. This way, the user may trigger parts of your code to be executed.", plat:"iOS Basics - Connections II", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html", section:"iOS Basics"),
             GlossyFlashcard(term:"IB", def:"Interface Builder", plat:"iOS Basics - Storyboards", doc:"https://developer.apple.com/xcode/interface-builder/", section:"iOS Basics"),
             GlossyFlashcard(term:"Auto Layout", def:"Auto Layout is a constraint-based layout system. It allows developers to create an adaptive interface that responds appropriately to changes in screen size and device orientation.", plat:"iOS Basics - Auto Layout", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/", section:"iOS Basics"),
             GlossyFlashcard(term:"viewDidLoad()", def:"viewDidLoad() is called only once during the life of the view controller object. It's a great place to do any view initialization or setup that is not in the Storyboard.", plat:"iOS Basics - Connections I", doc:"https://developer.apple.com/reference/uikit/uiviewcontroller/1621495-viewdidload", section:"iOS Basics"),
             GlossyFlashcard(term:"Stack View", def:"The UIStackView class provides a streamlined interface for laying out a collection of views in either a column or a row. Stack views let you leverage the power of Auto Layout, creating user interfaces that can dynamically adapt to the device’s orientation, screen size, and any changes in the available space.", plat:"iOS Basics - Stack Views", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html", section:"iOS Basics"),
             GlossyFlashcard(term:"Scene", def:"A scene has a single view controller and many views, or components, on the page.", plat:"iOS Basics - Storyboards", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/Storyboard.html", section:"iOS Basics"),
             GlossyFlashcard(term:"Table View", def:"Table views are versatile user interface objects frequently found in iOS apps. A table view presents data in a scrollable list of multiple rows that may be divided into sections.", plat:"iOS Intermediate - Table View", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/CreateConfigureTableView/CreateConfigureTableView.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Plain Type TableView", def:"A table view in the plain (or regular) style displays rows that stretch across the screen. A plain table view can have one or more sections, sections can have one or more rows, and each section can have its own header or footer title.", plat:"iOS Intermediate - Table View", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/TableViewStyles/TableViewCharacteristics.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Grouped Type TableView", def:"A grouped table view also displays a list of information, but it groups related rows in visually distinct sections. Each section may have text or an image for its header or footer to provide some context or summary for the section. A grouped table works well for displaying the detailed information.", plat:"iOS Intermediate - Table View", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/TableViewStyles/TableViewCharacteristics.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Prototype Cell", def:"The prototype cell is the template for the other cells; the design and behavior you give this cell will be used by the other cells in the table view.", plat:"iOS Intermediate - Table View", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/TableViewCells/TableViewCells.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Protocol", def:"Protocols declare the methods expected to be used for a particular situation. In OOP, it’s important to define a set of behavior that is expected of an object. As an example, a table view expects to be able to communicate with a data source object in order to find out what it is required to display.", plat:"iOS Intermediate - Protocols", doc:"https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithProtocols/WorkingwithProtocols.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Table View Controller", def:"The UITableViewController class creates a controller object that manages a table view. You create a custom subclass of UITableViewController for each table view that you want to manage.", plat:"iOS Intermediate - Beast List (Delete)", doc:"https://developer.apple.com/reference/uikit/uitableviewcontroller", section:"iOS Interm"),
             GlossyFlashcard(term:"Navigation Controller", def:"A navigation controller manages a stack of view controllers.", plat:"iOS Intermediate - Beast List (Delete)", doc:"https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html", section:"iOS Interm"),
             GlossyFlashcard(term:"cellForRowAtIndexPath", def:"Required for Table Views. Asks the data source for a cell to insert in a particular location of the table view.", plat:"iOS Intermediate - Bucket List (Add)", doc:"https://developer.apple.com/reference/uikit/uitableview/1614983-cellforrow", section:"iOS Interm"),
             GlossyFlashcard(term:"numberOfRowsInSection", def:"Required for Table Views. Returns the number of rows (table cells) in a specified section.", plat:"iOS Intermediate - Bucket List (Add)", doc:"https://developer.apple.com/reference/uikit/uitableviewdatasource/1614931-tableview", section:"iOS Interm"),
             GlossyFlashcard(term:"UITableViewDataSource", def:"The UITableViewDataSource protocol is adopted by an object that mediates the application’s data model for a UITableView object. The data source provides the table-view object with the information it needs to construct and modify a table view.", plat:"iOS Intermediate - More Protocols", doc:"https://developer.apple.com/reference/uikit/uitableviewdatasource", section:"iOS Interm"),
             GlossyFlashcard(term:"UITableViewDelegate", def:"The delegate of a UITableView object must adopt the UITableViewDelegate protocol. Optional methods of the protocol allow the delegate to manage selections, configure section headings and footers, help to delete and reorder cells, and perform other actions.", plat:"iOS Intermediate - More Protocols", doc:"https://developer.apple.com/reference/uikit/uitableviewdelegate", section:"iOS Interm"),
             GlossyFlashcard(term:"Delegate", def:"Delegation is a simple and powerful pattern in which one object in a program acts on behalf of, or in coordination with, another object. The delegating object keeps a reference to the other object—the delegate—and at the appropriate time sends a message to it.", plat:"iOS Intermediate - More Protocols", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Segue", def:"Use segues to define the flow of your app’s interface. A segue defines a transition between two view controllers in your app’s storyboard file.", plat:"iOS Intermediate - Bucket List (Add)", doc:"https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html#//apple_ref/doc/uid/TP40007457-CH15-SW1", section:"iOS Interm"),
             GlossyFlashcard(term:"prepareForSegue", def:"Notifies the view controller that a segue is about to be performed.", plat:"iOS Intermediate - Bucket List (Add)", doc:"https://developer.apple.com/reference/uikit/uiviewcontroller/1621490-prepareforsegue", section:"iOS Interm"),
             GlossyFlashcard(term:"commitEditingStyle", def:"Asks the data source to commit the insertion or deletion of a specified row in the receiver.", plat:"iOS Intermediate - Bucket List crUD", doc:"https://developer.apple.com/reference/uikit/uitableviewdatasource/1614871-tableview", section:"iOS Interm"),
             GlossyFlashcard(term:"performSegueWithIdentifier", def:"Initiates the segue with the specified identifier from the current view controller's storyboard file.", plat:"iOS Intermediate - Bucket List crUD", doc:"https://developer.apple.com/reference/uikit/uiviewcontroller/1621413-performseguewithidentifier", section:"iOS Interm"),
             GlossyFlashcard(term:"Data Persistence", def:"Data survives after the creation process has ended. A data store is persistent if it writes to non-volatile storage.", plat:"iOS Intermediate - Data Persistence", doc:"https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Core Data", def:"Core Data is an object graph and persistence framework for iOS and macOS.", plat:"iOS Intermediate - Data Persistence", doc:"https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/", section:"iOS Interm"),
             GlossyFlashcard(term:"Entity", def:"A Core Data entity is very similar to a table in a database.", plat:"iOS Intermediate - Core Data Basics", doc:"https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/KeyConcepts.html#//apple_ref/doc/uid/TP40001075-CH30-SW10", section:"iOS Interm"),
             GlossyFlashcard(term:"Attribute", def:"Core Data attributes are similar to the columns of a table in a database. Attributes store the values of a Core Data record.", plat:"iOS Intermediate - Core Data Basics", doc:"https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/KeyConcepts.html#//apple_ref/doc/uid/TP40001075-CH30-SW10", section:"iOS Interm"),
             GlossyFlashcard(term:"managedObjectContext", def:"A managed object context represents a single object space, or scratch pad, in a Core Data application. Its primary responsibility is to manage a collection of managed objects.", plat:"iOS Intermediate - Core Data Basics", doc:"https://developer.apple.com/reference/coredata/nsmanagedobject/1506677-managedobjectcontext", section:"iOS Interm"),
             GlossyFlashcard(term:"NSFetchRequest", def:"A description of search criteria used to retrieve data from a persistent store. Retreive your data.", plat:"iOS Intermediate - Core Data Basics", doc:"https://developer.apple.com/reference/coredata/nsfetchrequest", section:"iOS Interm"),
             GlossyFlashcard(term:"Custom Cell", def:"Table view cells come with predefined behavior. Create a custom cell for custom behaviors and styles.", plat:"iOS Intermediate - Custom Cell", doc:"https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/TableViewCells/TableViewCells.html", section:"iOS Interm"),
             GlossyFlashcard(term:"Tab Bar Controller", def:"A tab bar interface provides different perspectives on the same set of data or in situations where you want to organize your app along functional lines. The key component of a tab bar interface is the presence of a tab bar view along the bottom of the screen.", plat:"iOS Intermediate - Tab Bar Controller", doc:"https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/TabBarControllers.html", section:"iOS Interm"),
             GlossyFlashcard(term:"viewWillAppear", def:"Notifies the view controller that its view is about to be added to a view hierarchy.", plat:"iOS Intermediate - Tab Bar Controller", doc:"https://developer.apple.com/reference/uikit/uiviewcontroller/1621510-viewwillappear", section:"iOS Interm"),
             GlossyFlashcard(term:"NS", def:"NextSTEP. Anything that starts with NS indicates that it is coming from a NextSTEP library written in Objective-C.", plat:"", doc:"http://arstechnica.com/apple/2012/12/the-legacy-of-next-lives-on-in-os-x/", section:"iOS Interm"),
             GlossyFlashcard(term:"Info.plist", def:"Information Property List. A text file with the configurations and settings for your application, such as privacy settings and permissions to access other applications.", plat:"iOS Advanced - iOS Front-End", doc:"https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html", section:"iOS Advanced"),
             GlossyFlashcard(term:"App Transport Security Settings", def:"A key in the info.plist file that determines whether the application is able to request data via HTTP.", plat:"iOS Advanced - iOS Front-End", doc:"https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html", section:"iOS Advanced"),
             GlossyFlashcard(term:"NSURL", def:"A class that allows an app to manipulate URLs and the resources they refer to, whether on a server or in local memory.", plat:"iOS Advanced - iOS Front-End", doc:"https://developer.apple.com/reference/foundation/nsurl", section:"iOS Advanced"),
             GlossyFlashcard(term:"NSURLSession.sharedSession()", def:"This creates a session that we can use to transfer data over HTTP.", plat:"iOS Advanced - iOS Front-End", doc:"https://developer.apple.com/reference/foundation/urlsession", section:"iOS Advanced"),
             GlossyFlashcard(term:"dataTaskWithURL", def:"This sets up a task to request data from the provided URL.", plat:"iOS Advanced - iOS Front-End", doc:"https://developer.apple.com/reference/foundation/nsurlsession/1410330-datataskwithurl", section:"iOS Advanced"),
             GlossyFlashcard(term:"NSJSONSerialization", def:"You use the NSJSONSerialization class to convert JSON to Foundation objects and convert Foundation objects to JSON.", plat:"iOS Advanced - JSON Data in Swift", doc:"https://developer.apple.com/reference/foundation/nsjsonserialization", section:"iOS Advanced"),
             GlossyFlashcard(term:"Type Casting", def:"Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.", plat:"iOS Advanced - JSON Data in Swift", doc:"https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TypeCasting.html", section:"iOS Advanced"),
             GlossyFlashcard(term:"Downcasting", def:"A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (as? or as!).", plat:"iOS Advanced - JSON Data in Swift", doc:"https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TypeCasting.html", section:"iOS Advanced"),
             GlossyFlashcard(term:"Grand Central Dispatch", def:"The main thread must be free for user interface and user interactions. Any time-consuming or CPU demanding tasks should run on concurrent or background queues using the GCD. GCD provides and manages FIFO queues to which your application can submit tasks.", plat:"iOS Advanced - Faster UI", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html", section:"iOS Advanced"),
             GlossyFlashcard(term:"dispatch_async(dispatch_get_main_queue(),{})", def:"Submits a block for asynchronous execution on a dispatch queue and returns immediately. This moves a task off the main thread.", plat:"iOS Advanced - Faster UI", doc:"https://developer.apple.com/library/content/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html", section:"iOS Advanced"),
             GlossyFlashcard(term:"Completion Handler", def:"The code inside a completion handler is run as soon as a response is received from another method.", plat:"iOS Advanced - iOS Front-End", doc:"https://developer.apple.com/reference/corespotlight/cssearchquery/1649312-completionhandler", section:"iOS Advanced")
             
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
                stringForTitle = "iOS Interm"
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

