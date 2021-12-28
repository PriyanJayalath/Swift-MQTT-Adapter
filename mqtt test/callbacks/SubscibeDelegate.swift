//
//  SubscibeDelegate.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

protocol SubscribeDelegate {
    func subscriptionSuccess()-> Void
    func subscriptionFail()-> Void
    func messageReceived(payload:String)-> Void
}
