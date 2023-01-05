//
//  Clases.swift
//  Plinko
//
//  Created by Aaron  Price on 1/3/23.
//

import Foundation

class User {
    var email : String = "email"
    var username : String = "user"
    var totalPoints : Int = 0
    var lastPlayTime : Date? = nil
    var lastPlayScore : Int = 0
    var totalPlays : Int = 0
    var allPlayScores = [Int]()
    var allPlayTimes = [Date?]()
}

class Play {
    var username : String = "user"
    var score : Int = 0
    var bucketLanded : Int = 0
    var timestamp : Date = Date()
    var activelyPlaying : Bool = false
}
