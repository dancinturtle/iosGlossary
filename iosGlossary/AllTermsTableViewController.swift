//
//  AllTermsTableViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class AllTermsTableViewController: UITableViewController, CancelButtonDelegate, FlashCardDelegate {
    
    
    
    // all terms will be an array of all the flashcards we make in View Did Load
    var allTerms = [GlossyFlashcard]()
    
    // This will be populated by doing a search
    var filteredTerms = [GlossyFlashcard]()
    
    let searchController = UISearchController(searchResultsController: nil)

    // This flashcard is determined by tapping on the term in the tableview
    var termToDetail: GlossyFlashcard?
  
    weak var cancelButtonDelegate: CancelButtonDelegate?

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        print ("Cancel Button pressed")
        cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTerms = [
            GlossyFlashcard(term: "compiled vs interpreted", def: "Compiled languages have to be translated completely before running while interpreted languages get translated on the fly as the program is getting read. Swift is a compiled language.", plat: "Fundamentals - Swift - Playground", doc: "https://en.wikipedia.org/wiki/Swift_(programming_language)"),
            GlossyFlashcard(term:"playground", def: "Playground is an interactive environment within Xcode. The left side is the code editor and the right side shows code output.", plat: "Fundamentals - Swift - Playground", doc: "https://developer.apple.com/swift/blog/?id=35"),
            GlossyFlashcard(term:"Statically Typed", def: "Swift is statically typed so it forces the developer to be more conscious about types and it also allows the computer to run more efficiently by allocating just enough space for each variable.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309")
        ]
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
/////////////////////////////// SEARCH BAR STUFF ///////////////////////////////////////////////
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTerms.count
        }
        return allTerms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "term")
        let glossyflashcard: GlossyFlashcard
        if searchController.isActive && searchController.searchBar.text != "" {
            glossyflashcard = filteredTerms[indexPath.row]
        }
        else {
            glossyflashcard = allTerms[indexPath.row]
        }
        cell?.textLabel?.text = glossyflashcard.term
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tappedTerm: GlossyFlashcard
        if searchController.isActive && searchController.searchBar.text != "" {
            tappedTerm = filteredTerms[indexPath.row]
        }
        else {
            tappedTerm = allTerms[indexPath.row]
        }
        termToDetail = tappedTerm
        performSegue(withIdentifier: "detailsSegue", sender: tableView.cellForRow(at: indexPath))
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            print ("Details segue")
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! TermDetailsTableViewController
            controller.termObject = termToDetail
            controller.cancelButtonDelegate = self
            
        }
    }
    func cancelButtonPressedFrom(controller: UIViewController){
        dismiss(animated: true, completion: nil)
    }
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filteredTerms = allTerms.filter { glossyflashcard in
            return glossyflashcard.term.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    
    }
    func flashcard(){
        print("Delegate received the commmand")
    }
    
    
    
}

extension AllTermsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController){
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

