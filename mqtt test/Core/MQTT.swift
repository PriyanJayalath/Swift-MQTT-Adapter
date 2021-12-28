//
//  MQTT.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

protocol MQTT {
    func connect(delegate:ConnectDelegate,broker:String)-> String
    func subscribe(delegate:SubscribeDelegate,topic:String)-> Void
    func publish(delegate:PublishDelegate,topic:String,payload:String)-> Void
    func disconnect(delegate:DisconnectDelegate)-> Void
}
