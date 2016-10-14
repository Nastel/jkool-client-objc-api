# jKool Streaming & Query API for iOS

Welcome to jKool’s iOS streaming Api. The purpose of this Api is to allow streaming to, querying from, and subscribing to data in a jKool repository. In order to use this Api, you will need a jKool account and the account’s access token. If you do not have a jKool account, you can [register](https://www.jkoolcloud.com/signup/signup) free. 
See the example app in this Cocoa Pod which contains fully functioning code for querying, streaming, and  subscribing. This API is based on secure jKool Restful interface. See [jKool Model Guide](https://www.jkoolcloud.com/download/jkool-model.pdf) for information about data model, terms and concepts.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

jKool LLC

## License

Please refer to the LICENSE file.

##To get started:

Include this Api by putting the following in your PodFile:
```ruby
pod 'jkool-client-objc-api'
```

##Bridging for Swift:
If you wish this CocoaPod to work in a Swift app, you simply need to create a Bridge.m file and include the following headers. When creating Bridge.m, click the option to 'Create Bridging Header'. The code examples in this ReadMe are in both Swift and Objective-c.

##Initialize
Depending on which portions of the Api you wish to use, import the following into your app:

For Streaming:
```objective-c
jKoolStreaming.h //Streaming Api
```
For Querying
```objective-c
jKoolQuerying.h //Querying Api
```
For Subscribing
```objective-c
jkCallbackHandlerWebsocket.h //Subscription Api
```
jKool Objects
```objective-c
jkEvent.h //jKool Event
jkProperty.h //jKool Property
jkActivity.h //jKool Activity
jkSnapshot.h //jKool Snapshot
```
Callback Objects
```objective-c
jKoolCallbackHandler.h //Callback Interface
```

jKool Locationing
```objective-c
jkLocation.h //Import if you wish to use jKool locationing to automatically detect and store device location on jKool activities and events.
```

Define your jKool instance variables at the top of any implementation file that wishes to use the api. Do so as follows:

Obj-c
```objective-c
jKoolWebsocketClient *jkWebsocketClient; // for subscriptions
jKoolStreaming *jkStreaming ; // for streaming
jKoolQuerying *jkQuerying; // for querying
jkLocation *location; // if using jKool locationing.
```
Swift
```swift
var jkWebsocketClient:jKoolWebsocketClient; // for subscriptions
var jkStreaming:jKoolStreaming; // for streaming
var jkQuerying:jKoolQuerying; // for querying
var location:jkLocation; // if using jKool locationing.
```
## Initialize Streaming
To Stream, you will need to initialize the jKool Streaming interface and your Callback Handler as follows:

Obj-c
```objective-c
// Initialize streaming and specify callback handler.
<your-callback-handler> *cbStream = [[<your-callback-handler> alloc] initWithViewController:self];
jkStreaming = [[jKoolStreaming alloc] init];
[jkStreaming setToken:@“your-token”];
[jkStreaming initializeStream:cbStream];
```
Swift
```swift
let cbStream : jkCallback = jkCallback.init(viewController: self);
let jkStreaming : jKoolStreaming = jKoolStreaming ();
jkStreaming.token = "your-token"
jkStreaming.initializeStream(cbStream);
```
## Initialize Querying
To Query, you will need to initialize the jKool Querying interface and your Callback Handler as follows:

Obj-c
```objective-c
// Initialize Querying and specify callback handler
<your-callback-handler> *cbQuery = [[<your-callback-handler> alloc] initWithViewController:self];
jkQuerying = [[jKoolQuerying alloc] init];
[jkQuerying setToken:@“your-token”];
[jkQuerying initializeQuery:cbQuery];
```

Swift
```swift
// Initialize Querying and specify callback handler
let cbQuery : <your-callback-handler> = <your-callback-handler>.init(viewController: self);
let jkQuerying : jKoolQuerying = jKoolQuerying ();
jkQuerying.token = "your-token"
jkQuerying.initializeQuery(cbQuery);
```
## Initialize Subscribing
To Subscribe, you will need to initialize the jKool Subscription interface and your Callback Handler as follows:

Obj-c
```objective-c
// Initialize Subscription
<your-callback-handler> *cbWebsocket = [[<your-callback-handler> alloc] initWithViewController:self];
jkWebsocketClient = [[jKoolWebsocketClient alloc] init];
```
Swift
```objective-c
// Initialize Subscription
let cbWebsocket : <your-callback-handler> = <your-callback-handler>.init(viewController: self);
let jkWebsocketClient : jKoolWebsocketClient.init();
```
## Initialize jKool Locationing

Obj-c
```objective-c
To initialize jKool Locationing, do the following:
// Kick-off locationing
location = [[jkLocation alloc] init];
[location kickOffLocationing];
```
Swift
```swift
To initialize jKool Locationing, do the following:
// Kick-off locationing
let location : jkLocation.init();
location.kickOffLocationing();
```

## To Stream
Populate your jKool objects. These objects include: 
* Activities
* Events
* Properties
* Snapshots. 

Stream each of the objects as follows:

Obj-c
```objective-c
[jkStreaming stream:activity forUrl:@"activity"] ;
[jkStreaming stream:event forUrl:@“event”] ;
```
Swift
```swift
jkStreaming.stream(activity,forUrl:"activity");
jkStreaming.stream(event,forUrl:“event”);
```
(Please note that Properties and Snapshots are part of the Activities and Events)

## To Query

Obj-c
```objective-c
// Query
NSString *query = @"get events";
[jkQuerying query:query withMaxRows:50];
```
Swift
```swift
// Query
jkQuerying.query("get events", withMaxRows: 50);
```
(Please note that the query string can contain any JKQL syntax. Please refer to the [JKQL Query Language](http://www.jkoolcloud.com/download/jKQL%20User%20Guide.pdf))
## To Subscribe

Obj-c
```objective-c
[jkWebsocketClient subscribe:@"subscribe to events" withMaxRows:10 withToken:@“your-token”  withSubId:@“your-subscription-id”  forHandler:cbWebsocket];
```
Swift
```swift
jkWebsocketClient.subscribe("subscribe to events":withMaxRows:10.withToken:“your-token”,withSubId:“your-subscription-id”, forHandler:cbWebsocket);
```
(Please note that subscriptions can contain any JKQL syntax.)
## Create your Callback Handlers:
* Callback Handlers must subclass: jKoolCallbackHandler
* Callback Handlers must implement the handlejKoolResponse method.

Callback handlers can be separate objects or they can be the ViewController that is doing the streaming, querying, subscribing. If using the same ViewController, simply specify 'self' as the handler. The situation where separate callback handlers will be necessary is when you're working with multiple streams of data. The example app within this Cocoa Pod contains separate call back handlers as well as a commented out example call to a callback handler method that is within the calling ViewController (and 'self' is being used).

## Disconnecting
To close connections, please do the following:

Obj-c
```objective-c
[jkWebsocketClient unsubscribe];
[jkStreaming stopStreaming];
[jkQuerying stopQuerying];
```
Swift
```swift
jkWebsocketClient.unsubscribe();
jkStreaming.stopStreaming();
jkQuerying.stopQuerying();
```

## Seeing results
As stated above, please see the Example app in this pod. It contains a complete working app with all of the above mentioned code in it. Simply replace your access token where “your-token” is specified in order to see the app working. We recommend you do the following:
* Stream some data.
* View the streamed data in jKool by logging into your jKool repository.
* Query your streamed data with the app to see it appear in the app.
* Subscribe to your streamed data.
* With the subscription, you can see data in real time as it is streamed. If you then install the app on another device or use one of jKool several other Api’s to stream data, you will see the data being streamed in real time in the first app.
 
## Defaulted Fields
* Data Center
* Server
* Tid
* Network Address
* Application
* Geo
* Comp Code
* Severity 
* Type
* Source FQN
* Time
* Start Time
* End Time
* Elapsed Time
* Status
* Msg Charset
* Msg Encoding
* Msg Mime Type
* Msg Size
* Msg Tag

## Support
If you have any questions or concerns, please reach out to us by emailing support@jkoolcloud.com. We will get back to you as quickly as possible. 

  
