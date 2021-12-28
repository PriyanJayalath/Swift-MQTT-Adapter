//
//  ConnectDelegate.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

protocol ConnectDelegate {
    func connectionSuccess()-> String
    func connectionFail()-> Void
}
