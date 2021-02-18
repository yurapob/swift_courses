//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()


checker.checkFirstFunction { (_ ar: [Int]) -> (Int, Int) in
    var a = 0
    var b = 0
    for i in ar{
        if i%2 == 0 { a+=1 }
        else { b+=1}
    }
    return (a,b)
}



checker.checkSecondFunction { (_ a: [Checker.Circle]) -> [Checker.Circle] in
    var white: [Checker.Circle] = []
    var black: [Checker.Circle] = []
    var blue: [Checker.Circle] = []
    var res: [Checker.Circle] = []
    
    for i in a{
        if i.color == Checker.Color.white {
            white.append(i)
        }
        else if i.color == Checker.Color.black {
            black.append(i)
            black[black.count-1].radius = 2 * black[black.count-1].radius
        }
        else if ((i.color == Checker.Color.green)||(i.color == Checker.Color.blue)){
            blue.append(i)
            blue[blue.count-1].color = Checker.Color.blue
            
        }
    }
    
    res = white + black + blue
    return res
}


checker.checkThirdFunction { (_ arr:[Checker.EmployeeData]) -> [Checker.Employee] in
    var result: [Checker.Employee] = []
    
    for step in arr {
        if (step["fullName"] != nil && step["salary"] != nil && step["company"] != nil)  && (step.count == 3){
            let addElement: Checker.Employee = Checker.Employee (fullName: step["fullName"]!, salary: step["salary"]!, company: step["company"]!)
            result.append(addElement)
        }
    }
    return result
}


checker.checkFourthFunction { (_ arr:[String]) -> [String : [String]] in
    var result: [String: [String]] = [:]

    for elem in arr {
        let start = String(elem.prefix(1))
        if  result[start] == nil {
            result[start] = [elem]
        } else {
            result[start]?.append(elem)
        }
    }
    for (elem, names) in result {
        if names.count < 2 {
            result.removeValue(forKey: elem)
        }
    }
    for (key, _) in result {
        result[key]?.sort(by: >)
    }
    return result
}
    









