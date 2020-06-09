//
//  DeviceCell.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// Cell view for the Device.
final class DeviceCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "DeviceCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func configure(with device: Device) {
        titleLabel.text = device.name
        dateLabel.text = "Hello World"
        
        if let type = device.type,
            let value = device.value,
            let firstLetterUppercased = type.first?.uppercased() {
            
            let remainingLetters = type.substring(from: 1)
            subtitleLabel.text = "\(firstLetterUppercased)\(remainingLetters): \(value)"
        }
    }
    
    // MARK: - Private Functions

    private func setupComponents() {
        addSubview(dateLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            dateLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
