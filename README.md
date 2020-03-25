# Socket Manager

### Install Pod ###

    pod 'Socket.IO-Client-Swift', '~> 15.2.0'.

#### Integration of Socket.io client ####

- Go to SocketManager.swift class and import  SocketIO framework. It provides the necessary libraries for integration.

        import SocketIO
            
- add Socket base url and token in SocketManager.swift class below methods

        SocketIOManager.getSocketBaseUrl()
        SocketIOManager.getToken()
    
- Let’s define two methods now that will make use of the above socket property. The first one connects the app to the server, and the second makes the disconnection.

        ///start socket connection
        class func establishConnection() {
            socket.connect()
        }

        ///close socket connection
        class func closeConnection() {
            socket.disconnect()
        }
        
-  We are going to establish a connection to the server whenever the app becomes active, and we’ll close that connection when app will terminate. Simple enough, so open the AppDelegate.swift file and in the delegate method you see next call the first one defined above:

        func applicationDidBecomeActive(a_ pplication: UIApplication) {
            SocketIOManager.establishConnection()
        }
        
- Similarly, make the disconnection:

        func applicationWillTerminate(_ application: UIApplication) {
            SocketIOManager.closeConnection()
        }
        
- Go to ViewController.swift class and call emit and listen methods
