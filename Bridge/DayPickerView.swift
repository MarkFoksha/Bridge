//
//  DayPickerView.swift
//  Bridge
//
//  Created by Марк Фокша on 13.05.2023.
//

import UIKit

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}


protocol DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, _ indexPath: IndexPath) -> String
}

class DayPickerView: UIControl {
    public var dataSource: DayPickerViewDataSource? {
        didSet {
           setupView()
        }
    }
    
    private var stackView: UIStackView!
    private var buttons: [UIButton] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.frame = bounds
    }
    
    func setupView() {
        let count = dataSource?.dayPickerCount(self)
        guard let count = count else { return }
        
        for item in 0..<count {
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath)
            
            setupButton(withTag: item, title)
        }
        
        setupStackView()
    }
    
    func setupButton(withTag tag: Int, _ title: String?) {
        let button = UIButton(type: .system)
        button.tag = tag
        button.setTitle(title, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
        buttons.append(button)
        addSubview(button)
    }
    
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
    }
    
    
    
    
    @objc func selectedButton(sender: UIButton) {
        for i in buttons {
            i.isSelected = false
        }
        
        let index = sender.tag
        let button = buttons[index]
        
        button.isSelected = true
    }
}
