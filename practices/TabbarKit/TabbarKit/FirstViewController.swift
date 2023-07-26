//
//  ViewController.swift
//  TabbarKit
//
//  Created by 아라 on 2023/07/19.
//

import UIKit

class FirstViewController: UIViewController {
    var resultLabel = UILabel()
    var addOneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
        setLayout()
    }

    func componentInit() {
        view.backgroundColor = .white
        
        resultLabel.text = "0"
        resultLabel.textAlignment = .center
        resultLabel.textColor = .black
        resultLabel.font = .boldSystemFont(ofSize: 56)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addOneButton.setTitle("+1", for: .normal)
        addOneButton.setTitleColor(.blue, for: .normal)
        addOneButton.addTarget(self, action: #selector(addOneBtnDidTap), for: .touchUpInside)
        addOneButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        view.addSubview(resultLabel)
        view.addSubview(addOneButton)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            addOneButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            addOneButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc func addOneBtnDidTap() {
        guard let number = Int(resultLabel.text ?? "") else { return }
        
        resultLabel.text = String(number + 1)
    }
}

