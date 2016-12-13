//
//  CompleteGlossary.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import Foundation

class GlossyFlashcard {
    var term : String
    var def : String
    var plat: String
    var doc : String
    var section : String
    
    init(term: String, def: String, plat: String, doc: String, section: String){
        self.term = term
        self.def = def
        self.plat = plat
        self.doc = doc
        self.section = section
    }
}
