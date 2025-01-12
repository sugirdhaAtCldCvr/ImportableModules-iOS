//
//  BaseViewController.swift
//  ImportableModules_iOS
//
//  Created by Sugirdha Vaithyanathan on 11/1/25.
//


import UIKit

class BaseViewController: UIViewController {
    
    let stackView = UIStackView()
    let topView = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let contentView = UIView()
    let nextButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

}

// MARK: - Setup and Layout
extension BaseViewController {
    
    private func setup() {
        /// style
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        let btnText = NSAttributedString(string: "Continue".uppercased(), attributes: [.font: UIFont.systemFont(ofSize: 18)])
        nextButton.setAttributedTitle(btnText, for: .normal)
        var btnConfig = UIButton.Configuration.plain()
        btnConfig.imagePadding = 16
        btnConfig.imagePlacement = .trailing
        nextButton.configuration = btnConfig
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor(named: Colors.primary.rawValue)
        nextButton.layer.cornerRadius = 4
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.tintColor = .white
        
        /// functionality
        nextButton.isEnabled = false
        
        /// layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        [topView, imageView, titleLabel, descriptionLabel, contentView, nextButton].forEach(
            stackView.addArrangedSubview(_:)
        )
        
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 64),
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 20),
        ])
    }
    
}
