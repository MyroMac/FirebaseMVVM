//
//  ViewModelProtocol.swift
//  FirebaseMVVM
//
//  Created by MacMini on 7.03.2022.
//

import Foundation
import UIKit




protocol ViewModel {
    
    /**
     Generic request model, mandatory for ever view model
     any value conforming to 'Codable' protocol can be injected into 'ViewModel'
     */
    associatedtype RequestModel : Codable
    
     /**
      Generic response model, mandatory for ever view model
      */
    associatedtype ResponseModel : Codable
    
    associatedtype View : UIViewController
    
    
    /**
     inject a RequestModel as input into 'connect' function and return  a result as ResponseModel
     */
    func connect(with model: RequestModel)
    
    var view : View? { get set}
    
}


