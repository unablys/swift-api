# SwiftAPI

<div align = "center">
  <a href="http://cocoapods.org/pods/SwiftAPI">
    <img src="https://img.shields.io/cocoapods/v/SwiftAPI.svg?style=flat" />
  </a>
</div>
<div align = "center">
  <a href="http://cocoapods.org/pods/SwiftAPI" target="blank">
    <img src="https://img.shields.io/cocoapods/p/SwiftAPI.svg?style=flat" />
  </a>
  <a href="http://cocoapods.org/pods/SwiftAPI">
    <img src="https://img.shields.io/badge/compatible-swift%203.0%20-orange.svg" />
  </a>
  <a href="http://cocoapods.org/pods/SwiftAPI" target="blank">
    <img src="https://img.shields.io/cocoapods/l/SwiftAPI.svg?style=flat" />
  </a>
  <br>
  <br>
</div>

**Swift API** was born as idea of having very light, very fast, written in swift, easy to update and ready to use out of the box library for communication through network. Now that idea is real as cocoapod library.


## Installation

Swift-API is available through [CocoaPods](http://cocoapods.org/pods/SwiftAPI). To install it, simply add the following line to your Podfile
```
pod "SwiftAPI"
```
and run
```
pod install
```


## Usage

At the beginning, import library by adding
```swift
import SwiftAPI
```
then you can create instance of ApiService
```swift
let apiService = ApiService()
```
or RestService
```swift
let rootURL = URL(string:"https://API.SERVER.ADDRESS.COM")
let apiPath = "/v1.0"
let restService = RestService(baseUrl: rootURL, apiPath: apiPath, headerFields: nil)
```
and now you can start sending requests.

To get familiar with more advanced usage please take a look at usage example available with library.


## Authors

- Marek Kojder, marek.kojder@xsolve.pl
- Sławomir Zagórski, slawomir.zagorski@xsolve.pl
- Radosław Budzik, radoslaw.budzik@xsolve.pl


## License

SwiftAPI is available under the MIT license. See the LICENSE file for more info.
