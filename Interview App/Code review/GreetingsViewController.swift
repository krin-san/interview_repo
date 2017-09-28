//
//  GreetingsViewController.swift
//  Interview App
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import UIKit

class GreetingsViewController: UIViewController {

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let generateButton = UIButton(type: .system)

    lazy var generator = {
        return GreetingsGenerator() { [weak self] item in
            self?.titleLabel.text = item.greeting
            self?.subtitleLabel.text = item.fullName
        }
    }()

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func loadView() {
        super.loadView()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .yellow

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.backgroundColor = .white
        
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        generateButton.setTitle("Generate", for: .normal)
        generateButton.backgroundColor = .green
    }

    override func viewDidLoad() {
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(subtitleLabel)
        self.view.addSubview(generateButton)
        self.view.backgroundColor = .orange

        // Create autolayout constraints programmatically, as it's required by the tech lead.
        // All constraint constants are approved by the designer.
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true;
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true;
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true;
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        subtitleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 190).isActive = true;
        subtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true;
        subtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true;
        subtitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        
        generateButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 230).isActive = true;
        generateButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true;
        generateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true;
        generateButton.heightAnchor.constraint(equalToConstant: 20).isActive = true;
    
        generateButton.addTarget(self, action: #selector(generate), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(cleanup), name: .UIDeviceOrientationDidChange, object: nil)
    }

    @objc func cleanup() {
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    @objc func generate() {
        generator.generate()
    }
}
