//
//  SettingsPageVC.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 26.08.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import UIKit

class SettingsPageVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var selectedDateFormat: String?
    var dateFormatList = ["EEEE, MMM d, yyyy", "MM-dd-yyyy HH:mm", "MMM d, h:mm a"]
    
    @IBOutlet weak var dateTypeTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPickerView()
        initPickerValue()
    }
    
    @IBAction func actionSave(_ sender: Any) {
        UserDefaults.standard.set(selectedDateFormat, forKey: "SelectedDateFormat")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateFormatList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dateFormatList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDateFormat = dateFormatList[row]
        dateTypeTextFiled.text = selectedDateFormat
        
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        dateTypeTextFiled.inputView = pickerView
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        dateTypeTextFiled.inputAccessoryView = toolBar
    }
    
    func initPickerValue() {
        if let selectedValue = UserDefaults.standard.string(forKey: "SelectedDateFormat"), selectedValue != "" {
            dateTypeTextFiled.text = selectedValue
        } else {
            dateTypeTextFiled.text = dateFormatList[0]
        }
    }
    
    @objc func action() {
       view.endEditing(true)
    }

}
