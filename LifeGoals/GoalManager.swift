//
//  GoalManager.swift
//  LifeGoals
//
//  Created by Christophe on 21/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import Foundation

class GoalManager {
    private let GOAL_LIST_KEY = "goalList"
    private var _goalList:[String]
    
    init() {
        if let loadedGoalist = UserDefaults.standard.array(forKey: GOAL_LIST_KEY) as? [String] {
            _goalList = loadedGoalist
        } else {
            _goalList = []
        }
    }
    
    func getGoalCount() -> Int{
        return _goalList.count
    }
    
    func getGoal(atIndex index: Int) -> String {
        return _goalList[index]
    }
    
    func addGoal(wihText text: String) -> Int? {
        let newIndex: Int?
        if text.count > 0 {
         _goalList.append(text)
        newIndex = _goalList.count - 1
        UserDefaults.standard.set(_goalList, forKey: GOAL_LIST_KEY)
        
        } else {
            newIndex = nil
        }
        
        return newIndex
    }
    
    func removeGoal(atIndex index: Int) {
        _goalList.remove(at: index)
        UserDefaults.standard.set(_goalList, forKey: GOAL_LIST_KEY)
    }
}
