//
//  ViewController.swift
//  GooseNet
//
//  Created by aviatoali on 07/09/2019.
//  Copyright (c) 2019 aviatoali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel: ViewModel
    private let button = UIButton()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()

        self.setupButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    private func setupButton() {
        button.setTitle("Send Request", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 55),
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -60),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
    }
    
    @objc func buttonPressed(_ sender: UIButton!) {
        self.viewModel.OnButtonPress()
    }
}

