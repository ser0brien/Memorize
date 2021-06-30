# Memorize Game :sparkles:
###### Stanford University's course CS193p (Developing Applications for iOS using SwiftUI)

<br>
<p align="center">
  <img src="/Screenshots/screencast.gif" alt="" width="700" align="middle">
</p>
<br>

## About the game
You need to turn over the cards one by one to find the same cards. When you **find two identical cards,** you get one point and these cards will disappear. The game ends when you **find all the pairs.**

## Technology
* Swift
* SwiftUI
* MVVM

## Sample code
```swift
    struct Card: Identifiable {
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        var content: CardContent
        var id: Int
        
        // MARK: - Bonus Time
        
        // this could give matching bonus points
        // if the user matches the card
        // before a certain amount of time passes during which the card is face up
        
        // can be zero which means "no bonus available" for this card
        var bonusTimeLimit: TimeInterval = 10
        
        // how long this card has ever been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        // the last time this card was turned face up (and is still face up)
        var lastFaceUpDate: Date?
        // the accumulated  time yhis card has been face up in the past
        // (i.e. not including the current time it`s been face up if it is currently so)
        var pastFaceUpTime: TimeInterval = 0
        
        // how much time left before the bonus opportunity runs out
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        // percentage of the bonus time remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        // whether the card was matched during the bonus time period
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        // whether we are currently face up, unmatched and have not yet used up the bonus window
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        // called when the card transitions to face up state
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        // called when the card goes back face down (or gets matched)
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
    }
```

## Screenshots

<p align="center">
  <img src="/Screenshots/screenshot_01.png" alt="" height="400"> <img src="/Screenshots/screenshot_02.png" alt="" height="400"> <img src="/Screenshots/screenshot_03.png" alt="" height="400"> <img src="/Screenshots/screenshot_04.png" alt="" height="400">
</p>

## Requirements
* iOS 14.2
* Xcode 12.0
* Swift 5.3

## Install
Just open project and run :rocket:
