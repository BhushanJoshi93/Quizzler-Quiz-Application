//
//  Questions.swift
//  Quizzler
//
//  Created by Bhushan Joshi on 2018-02-02.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    //the init keyword is used to initialize the variables of our class. It is just like a constructor.
    //so , when u make object of the Question class , it would call the init method and ask for the parameters.
    init(text : String , correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
