//
//  RunPythonScript.swift
//  BlackJack
//
//  Created by Haider Malik on 2024-03-18.
//

import Foundation

import PythonKit

func RunPythonScript() -> PythonObject{
    let sys = Python.import("sys")
    sys.path.append("/Users/haidermalik/Documents/Code/BlackJack/BlackJack/BlackJackBackEnd/")
    let file = Python.import("BlackJackBackEnd")
    
    let response = file.hit()
    print(response)
    return response
}
