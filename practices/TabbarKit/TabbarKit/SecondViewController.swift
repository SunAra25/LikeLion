//
//  ViewController.swift
//  TabbarKit
//
//  Created by 아라 on 2023/07/19.
//

import UIKit

class SecondViewController: UIViewController {
    var resultLabel = UILabel()
    var addTwoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
        setLayout()
    }

    func componentInit() {
        view.backgroundColor = .white
        
        resultLabel.text = "0"
        resultLabel.textColor = .black
        resultLabel.font = .boldSystemFont(ofSize: 56)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addTwoButton.setTitle("+2", for: .normal)
        addTwoButton.setTitleColor(.blue, for: .normal)
        addTwoButton.addTarget(self, action: #selector(addTwoBtnDidTap), for: .touchUpInside)
        addTwoButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        view.addSubview(resultLabel)
        view.addSubview(addTwoButton)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            addTwoButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            addTwoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc func addTwoBtnDidTap() {
        guard let number = Int(resultLabel.text ?? "") else {
            return
        }
        
        resultLabel.text = String(number + 2)
    }
}

