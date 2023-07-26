//
//  ViewController.swift
//  TabbarKit
//
//  Created by 아라 on 2023/07/19.
//

import UIKit

class FourthViewController: UIViewController {
    var resultLabel = UILabel()
    var inputTextField = UITextField()
    var changeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
        setLayout()
    }

    func componentInit() {
        view.backgroundColor = .white
        
        resultLabel.text = "결과"
        resultLabel.textColor = .black
        resultLabel.font = .boldSystemFont(ofSize: 56)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        changeButton.setTitle("화씨온도로", for: .normal)
        changeButton.setTitleColor(.blue, for: .normal)
        changeButton.addTarget(self, action: #selector(calculateTemperature), for: .touchUpInside)
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        
        inputTextField.placeholder = "섭씨온도를 입력해주세용"
        inputTextField.textAlignment = .center
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        view.addSubview(resultLabel)
        view.addSubview(changeButton)
        view.addSubview(inputTextField)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            inputTextField.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            inputTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            changeButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 50),
            changeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc func calculateTemperature() {
        guard let number = Double(inputTextField.text ?? "") else { return }
        resultLabel.text = String(round((number - 32) / 1.8 * 1000)/1000)
    }
}

