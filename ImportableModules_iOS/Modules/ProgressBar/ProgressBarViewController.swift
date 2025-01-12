//
//  ProgressBarViewController.swift
//  ImportableModules_iOS
//
//  Created by Sugirdha Vaithyanathan on 11/1/25.
//

import UIKit

class ProgressBarViewController: UIViewController {

    var progressConstant: Float = 0.0
    
    let showProgressButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.setTitle("Show ProgressBar", for: .normal)
        return btn
    }()

    let barView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }

    func layout() {
        barView.translatesAutoresizingMaskIntoConstraints = false

        showProgressButton.translatesAutoresizingMaskIntoConstraints = false
        showProgressButton.addTarget(self, action: #selector(showProgressButtonTapped), for: .touchUpInside)

        [barView, showProgressButton].forEach(view.addSubview(_:))

        NSLayoutConstraint.activate([
            barView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            barView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            barView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            barView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            barView.heightAnchor.constraint(equalToConstant: 100),

            showProgressButton.heightAnchor.constraint(equalToConstant: 24),
            showProgressButton.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 48),
            showProgressButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            showProgressButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    @objc func showProgressButtonTapped() {
        barView.displayProgressBar(progress: progressConstant)
        if progressConstant >= 1.0 {
            showProgressButton.isEnabled = false
        }
        progressConstant += 0.1
        showProgressButton.setTitle("Update Progress", for: .normal)
        }


}
