//
//  PublishDelegate.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

protocol PublishDelegate {
    func publishSuccess()-> Void
    func publishFail()-> String
}
