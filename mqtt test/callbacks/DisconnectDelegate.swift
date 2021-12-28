//
//  DisconnectDelegate.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

protocol DisconnectDelegate {
    func disconnectSuccess()-> Void
    func disconnectFail()-> Void
}
