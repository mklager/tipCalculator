# Pre-work - Tip Calculator App

Tip is a tip calculator application for iOS.

Submitted by: Mark Lagusker

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [*] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [*] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [*] UI animations
* [*] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/3ohk2pTqLfAFuJi4py/giphy.gif ' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** This was very interesting experience so far. Interface builder allows fast creation of interfaces for any application. Drag and drop functionality helps a lot in that case. The platforms seems to have good mix of visual representation of elements and code editing IDE part. Autocompletion and suggestions are very helpful to get around but might be a bit overwhelming for the first time users.

Any object(text field, button, label, etc.) in a view can have an outlet that provides a controller with ability to communicate with that object. Through outlets a controller can fetch data from the view's objects or set a value to them. Action is a method in the controller that monitors view’s events. Whenever any event happens in the view, the controller get notification about it through an action.  

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** Strong reference cycle for closures is very similar to regular strong reference cycle with the difference in that instead of binding two classes it binds a class instance and a closure. It occurs when a closure uses “self” to reference a property of the enclosing class instance in the body and that create strong reference to that class instance. So since Automatic Reference Counting (ARC) cannot deallocate memory of any object that has more then zero strong references, even breaking strong reference between a class variable and that class instance doesn’t allow ARC to deallocate memory for that class instance. 


## License

Copyright 2017 Mark Lagusker

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
