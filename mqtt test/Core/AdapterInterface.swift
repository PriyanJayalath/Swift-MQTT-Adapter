//
//  AdapterInterface.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

class AdapterInterface {

    func connect(delegate:ConnectDelegate,broker:String) -> String {
        return "general Connect"
    }
    func disconnect(delegate:DisconnectDelegate) -> Void {
        
    }
    func subscribe(delegate:SubscribeDelegate,topic:String) -> Void {
        
    }
    func publish(delegate:PublishDelegate,topic:String,payload:String) -> Void {
        
    }
}
