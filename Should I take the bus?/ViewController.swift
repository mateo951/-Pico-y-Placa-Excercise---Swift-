//
//  ViewController.swift
//  Should I take the bus?
//
//  Created by Mateo Villagomez on 1/1/16.
//  Copyright © 2016 Mateo Villgomez. All rights reserved.
//

import UIKit
import CoreLocation

var weekDay = Int()

class ViewController: UIViewController, UITextFieldDelegate {
    
    let freeToGo = "You can take your car!"
    let takeTheBus = "You better take your bike!"
    let limitLength = 2
    
    @IBOutlet weak var userPlateNumber: UITextField!
    
    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var hoursInput: UITextField!
    
    @IBOutlet weak var minutesInput: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func validation(sender: AnyObject) {
        if ((userPlateNumber.text != "") && (date.text != "") && (hoursInput.text != "") && (minutesInput.text != "")) {
            picoPlaca()
        }
    }
    
    func picoPlaca() {
        
        // Date
        let userDate = date.text
        func getDayOfWeek() -> Int? {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            if let todayDate = formatter.dateFromString(userDate!) {
                let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
                let myComponents = myCalendar.components(.Weekday, fromDate: todayDate)
                weekDay = myComponents.weekday
                return weekDay
            } else {
                self.resultLabel.text = "Invalid date! Please try again"
                return nil
            }
        }
        
        // Plate Number
        let plateNumber = userPlateNumber.text
        let lastNumber = plateNumber?.characters.last
        
        // Hour Converter
        func hoursToMinutes(hours: Int, minutes: Int) -> Int {
            let result = (hours * 60) + minutes
            return result
        }
        
        let hoursInt = Int(hoursInput.text!)
        let minutesInt = Int(minutesInput.text!)
        let timeResult = hoursToMinutes(hoursInt!, minutes: minutesInt!)
        
        // Day and Date Validation
        let dayOfDate = getDayOfWeek()
        if ((lastNumber!) == "1") || ((lastNumber!) == "2") {
            if (dayOfDate == 2) {
                if ((timeResult >= 420 && timeResult <= 570) || (timeResult >= 960 && timeResult <= 1180)) {
                    self.resultLabel.text = takeTheBus
                } else {
                    self.resultLabel.text = freeToGo + " Watch your watch!"
                }
            } else {
                self.resultLabel.text = freeToGo
            }
        } else if ((lastNumber!) == "3") || ((lastNumber!) == "4") {
            if (dayOfDate == 3) {
                if ((timeResult >= 420 && timeResult <= 570) || (timeResult >= 960 && timeResult <= 1180)) {
                    self.resultLabel.text = takeTheBus
                } else {
                    self.resultLabel.text = freeToGo + " Watch your watch!"
                }
            } else {
                self.resultLabel.text = freeToGo
            }
        } else if ((lastNumber!) == "5") || ((lastNumber!) == "6") {
            if (dayOfDate == 4) {
                if ((timeResult >= 420 && timeResult <= 570) || (timeResult >= 960 && timeResult <= 1180)) {
                    self.resultLabel.text = takeTheBus
                } else {
                    self.resultLabel.text = freeToGo + " Watch your watch!"
                }
            } else {
                self.resultLabel.text = freeToGo
            }
        } else if ((lastNumber!) == "7") || ((lastNumber!) == "8") {
            if (dayOfDate == 5) {
                if ((timeResult >= 420 && timeResult <= 570) || (timeResult >= 960 && timeResult <= 1180)) {
                    self.resultLabel.text = takeTheBus
                } else {
                    self.resultLabel.text = freeToGo + " Watch your watch!"
                }
            } else {
                self.resultLabel.text = freeToGo
            }
        } else if ((lastNumber!) == "9") || ((lastNumber!) == "0"){
            if (dayOfDate == 6) {
                if ((timeResult >= 420 && timeResult <= 570) || (timeResult >= 960 && timeResult <= 1180)) {
                    self.resultLabel.text = takeTheBus
                } else {
                    self.resultLabel.text = freeToGo + " Watch your watch!"
                }
            } else {
                self.resultLabel.text = freeToGo
            }
        }
    }
    
    // TextField Length
    func textField(hoursInput: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = hoursInput.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TextField Length
        hoursInput.delegate = self
        minutesInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

