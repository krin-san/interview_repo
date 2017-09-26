//
//  GreetingsViewController.swift
//  Interview App
//
//  Created by Viktar Kalinchuk on 9/26/17.
//  Copyright © 2017 Inteview Sinergy. All rights reserved.
//

import UIKit

class GreetingsViewController: UIViewController {

    var overlay: UIView?
    var titleLabel: UILabel?
    var subtitleLabel: UILabel?
    var generateButton: UIButton!

    var generator: GreetingsGenerator!

    deinit {

    }

    override func loadView() {
        super.loadView()
        overlay = UIView()
        overlay?.translatesAutoresizingMaskIntoConstraints = false
        overlay?.backgroundColor = UIColor.orange
        titleLabel = UILabel()
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.backgroundColor = UIColor.yellow
        subtitleLabel = UILabel()
        subtitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel?.backgroundColor = UIColor.white
        generateButton = UIButton(type: .system)
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        generateButton.setTitle("Generate", for: .normal)
        generateButton.backgroundColor = UIColor.green

        generator = GreetingsGenerator() { item in
            self.titleLabel?.text = item.title
            self.subtitleLabel?.text = item.subtitlePart1 + " " + item.subtitlePart2
        }
    }

    override func viewDidLoad() {

        if let overlay = overlay {
            if let titleLabel = titleLabel {
                if let subtitleLabel = subtitleLabel {
                    view.addSubview(overlay)
                    overlay.addSubview(titleLabel)
                    overlay.addSubview(subtitleLabel)
                    overlay.addSubview(generateButton)

                    // Create autolayout constraints programmatically, as it's required by the tech lead.
                    // All constraint constants are approved by the designer.
                    overlay.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
                    overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true;
                    overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true;
                    overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true;

                    titleLabel.topAnchor.constraint(equalTo: overlay.topAnchor, constant: 150).isActive = true;
                    titleLabel.leadingAnchor.constraint(equalTo: overlay.leadingAnchor, constant: 8).isActive = true;
                    titleLabel.trailingAnchor.constraint(equalTo: overlay.trailingAnchor, constant: -8).isActive = true;
                    titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true;

                    subtitleLabel.topAnchor.constraint(equalTo: overlay.topAnchor, constant: 190).isActive = true;
                    subtitleLabel.leadingAnchor.constraint(equalTo: overlay.leadingAnchor, constant: 8).isActive = true;
                    subtitleLabel.trailingAnchor.constraint(equalTo: overlay.trailingAnchor, constant: -8).isActive = true;
                    subtitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true;

                    generateButton.topAnchor.constraint(equalTo: overlay.topAnchor, constant: 230).isActive = true;
                    generateButton.leadingAnchor.constraint(equalTo: overlay.leadingAnchor, constant: 40).isActive = true;
                    generateButton.trailingAnchor.constraint(equalTo: overlay.trailingAnchor, constant: -40).isActive = true;
                    generateButton.heightAnchor.constraint(equalToConstant: 20).isActive = true;
                }
            }
        }

        generateButton.addTarget(self, action: #selector(generate), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(cleanup), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

    @objc func cleanup(_ sender: Any) {
        titleLabel?.text = nil
        subtitleLabel?.text = nil
    }

    @objc func generate(sender: Any) {
        if let generator = generator {
            generator.generate()
        }
    }
}
