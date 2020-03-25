//
//  SocketManager.swift
//  SocketManager
//
//  Created by Santhosh Kumar on 27/02/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    
    static let manager = SocketManager(socketURL: URL(string: SocketIOManager.getSocketBaseUrl())!, config: [.log(true), .connectParams(["token" : SocketIOManager.getToken()])])
    static let socket = manager.defaultSocket

    ///start socket connection
    class func establishConnection() {
        socket.connect()
    }

    ///close socket connection
    class func closeConnection() {
        socket.disconnect()
    }

    ///emit data to socket
    class func emitLocationInfo(_ emitDict: [String: Any], completionHandler: @escaping (_ data: [String: Any]) -> Void) {
        socket.emit("location", emitDict)
    }
    
    ///listen near me jobs
    class func listenNearMeJobs(completionHandler: @escaping (_ data: Any) -> Void) {
        socket.on("get_jobs") { (responseData, socketAck) -> Void in
            completionHandler(responseData as (Any))
        }
    }
    
    ///off event with id
    class func socketOffWithID(_ offID: String) {
        socket.off(offID)
    }
    
    ///get socket status
    class func getSocketStatus() -> SocketIOStatus {
        return socket.status
    }
    
    ///get socket base url
    class func getSocketBaseUrl() -> String {
        return "http://qa.api.logisticsolved.com"
    }

    ///get access token
    class func getToken() -> String {
        return "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODI2OTc4ODEsIm5iZiI6MTU4MjY5Nzg4MSwianRpIjoiMTg1ODIzZjgtMTg1MS00NDcxLTkxY2QtNjZiMjY4MzQ3Njk0IiwiZXhwIjoxNTg1Mjg5ODgxLCJpZGVudGl0eSI6eyJpZCI6OCwiZmlyc3RfbmFtZSI6IlNhbnRob3NoIiwibGFzdF9uYW1lIjoiSyIsImVtYWlsIjoic2FudGhvc2hrQHdla2FuY29kZS5jb20iLCJtb2RlbCI6ImRyaXZlciIsImRldmljZV9pZCI6NTA1fSwiZnJlc2giOmZhbHNlLCJ0eXBlIjoiYWNjZXNzIiwidXNlcl9jbGFpbXMiOnsicm9sZSI6ImRyaXZlciJ9fQ.zzCgSxyBLGJMRTir2L9IbdAaMv74xyP15aKD-sHWWnE"
    }
}
