//
//  Gnome.swift
//  KavakTest
//
//  Created by Adrian Pascual Dominguez Gomez on 7/8/19.
//  Copyright © 2019 Adrian Pascual Dominguez Gomez. All rights reserved.
//

import UIKit

class Brastlewark: Codable{
    
    let Brastlewark: [Gnome]
    
    init(Brastlewark: [Gnome]){
        self.Brastlewark = Brastlewark
    }
    
}

class Gnome: Codable{
    
    var id: Int?
    var name: String?
    var thumbnail: String?
    var age: Int?
    var weight: Double?
    var height: Double?
    var hair_color: String?
    var professions: [String]?
    var friends: [String]?
    
    init()
    {
        
    }
    
    init(id: Int, name: String, thumbnail: String, age: Int, weight: Double, height: Double, hair_color: String, professions: [String], friends: [String])
    {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.age = age
        self.weight = weight
        self.height = height
        self.hair_color = hair_color
        self.professions = professions
        self.friends = friends
    }
}
