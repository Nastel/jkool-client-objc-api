# jKooliOSStreaming

Welcome to jKool’s iOS streaming Api. The purpose of this Api is to allow streaming to, querying from, and subscribing to data in a jKool repository. In order to use this Api, you will need a jKool account and the account’s access token. If you do not have a jKool account, you can register for one for free at this link … This Readme describes how to use the Api. Please see the example app in this Cocoa Pod which contain fully functioning code for querying, streaming, and  subscribing. This Api is based on jKools Restful interface. You can see details about this interface and design your streamed data to use it by reading the documentation at this link …. When using this Api, many fields will be defaulted for you. If you wish not to have the defaulted values please set them yourself. What the fields are defaulted to can be found at the bottom of this Readme.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

jKool LLC

## License

Please refer to the LICENSE file.

##To get started:

Include this Api by putting the following in your PodFile:
```ruby
pod 'jKooliOSStreaming'
```

##Initialize
Depending on which portions of the Api you wish to use, import the following into your app:

For Streaming:
```objective-c
jKoolStreaming.h //Streaming Api
jkCallbackHandlerStreaming.h //Streaming Callback Handler Interface
```
For Querying:
```objective-c
jKoolQuerying.h //Querying Api
jkCallbackHandlerQuery.h //Querying Callback Handler Interface
```
For Subscribing:
```objective-c
jkCallbackHandlerWebsocket.h //Subscription Api
jKoolWebsocketClient.h //Subscription Callback Handler Interface
```
jKool Objects:
```objective-c
jkEvent.h //jKool Event
jkProperty.h //jKool Property
jkActivity.h //jKool Activity
jkSnapshot.h //jKool Snapshot
```
jKool Locationing:
```objective-c
jkLocation.h //Import if you wish to use jKool locationing to automatically detect and store device location on jKool activities and events.
```

Define static variables at the top of any implementation file that wishes to use the api. Do so as follows:
```objective-c
static jKoolWebsocketClient *jkWebsocketClient; // for subscriptions
static jKoolStreaming *jkStreaming ; // for streaming
static jKoolQuerying *jkQuerying; // for querying
static jkLocation *location; // if using jKool locationing.
```
## Initialize Streaming
To Stream, you will need to initialize the jKool Streaming interface and your Callback Handler as follows:
```objective-c
// Initialize streaming and specify callback handler.
[jKoolStreaming setToken:@“your-token”];
NSObject *cbStream = [[<your-callback-handler> alloc] initWithViewController:self];
jkStreaming = [[jKoolStreaming alloc] init];
[jkStreaming initializeStream:cbStream];
```
## Initialize Querying
To Query, you will need to initialize the jKool Querying interface and your Callback Handler as follows:
```objective-c
// Initialize Querying and specify callback handler
[jKoolQuerying setToken:@“your-token”];
NSObject *cbQuery = [[<your-callback-handler> alloc] initWithViewController:self];
jkQuerying = [[jKoolQuerying alloc] init];
[jkQuerying initializeQuery:cbQuery];
```
## Initialize Subscribing
To Subscribe, you will need to initialize the jKool Subscription interface and your Callback Handler as follows:
```objective-c
// Initialize Subscription
NSObject *cbWebsocket = [[<your-callback-handler> alloc] initWithViewController:self];
jkWebsocketClient = [[jKoolWebsocketClient alloc] init];
```
## Initialize jKool Locationing
```objective-c
To initialize jKool Locationing, do the following:
// Kick-off locationing
location = [[jkLocation alloc] init];
[location kickOffLocationing];
```
## To Stream:
Populate your jKool objects. These objects include: 
* Activities
* Events
* Properties
* Snapshots. 

Stream each of the objects as follows:
```objective-c
[jkStreaming stream:activity forUrl:@"activity"] ;
[jkStreaming stream:event forUrl:@“event”] ;
```
(Please note that Properties and Snapshots are part of the Activities and Events)

## To Query:
```objective-c
// Query
NSString *query = @"get events";
[jkQuerying query:query withMaxRows:50];
```
(Please note that the query string can contain any JKQL syntax. Please refer to the JKQL Query Language here ...)
## To Subscribe:
```objective-c
[jkWebsocketClient subscribe:@"subscribe to events" withMaxRows:10 withToken:@“your-token”  withSubId:@“your-subscription-id”  forHandler:cbWebsocket];
```
(Please note that subscriptions can contain any JKQL syntax.)
## Create your Callback Handlers:
* Callback Handlers must subclass: jKoolCallbackHandler
* Callback Handlers must implement the handlejKoolResponse method.

As stated above, please see the Example app in this pod. It contains a complete working app with all of the above mentioned code in it. Simply replace your access token where “your-token” is specified in order to see the app working. We recommend you do the following:
* Stream some data.
* View the streamed data in jKool by logging into your jKool repository.
* Query your streamed data with the app to see it appear in the app.
* Subscribe to your streamed data.
* With the subscription, you can see data in real time as it is streamed. If you then install the app on another device or use one of jKool several other Api’s to stream data, you will see the data being streamed in real time in the first app.
 
## Defaulted Fields
*Data Center
*Server
*Tid
*Network Address
*Application
*Geo
*Comp Code
*Severity 
*Type
*Source FQN
*Time
*Start Time
*End Time
*Elapsed Time
*Status
*Msg Charset
*Msg Encoding
*Msg Mime Type
*Msg Size
*Msg Tag

## Support
If you have any questions or concerns, please reach out to us by emailing support@jkoolcloud.com. We will get back to you as quickly as possible. 

  
