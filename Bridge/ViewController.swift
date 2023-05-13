//
//  ViewController.swift
//  Bridge
//
//  Created by Марк Фокша on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayPicker: DayPickerView!
    
    private var days = ["Mn", "Tu", "Wd", "Thr", "Fr", "St", "Sn"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayPicker.dataSource = self
    }


}

extension ViewController: DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, _ indexPath: IndexPath) -> String {
        days[indexPath.row]
    }
    
    
}

