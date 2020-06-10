//
//  DetailViewController.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// Device detail view controller
final class DeviceDetailViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var airQualityTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = viewModel.airQualityTitle
        return label
    }()
    
    private lazy var airQualityMinLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var airQualityMaxLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var airQualityAverageLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var humidityTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = viewModel.humidityTitle
        return label
    }()
    
    private lazy var humidityMinLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var humidityMaxLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var humidityAverageLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var temperatureTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = viewModel.temperatureTitle
        return label
    }()
    
    private lazy var temperatureMinLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var temperatureMaxLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private lazy var temperatureAverageLabel: UILabel = {
        let label = UILabel()
        label.textColor = theme.color.brandLabel
        label.text = "--"
        return label
    }()
    
    private var airQualityStackView = UIStackView()
    private var humidityStackView = UIStackView()
    private var temperatureStackView = UIStackView()
    private var indicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - Properties
    
    private enum Constants {
        static let padding: CGFloat = 16
    }
    
    var viewModel: DeviceDetailViewModelProtocol!
    
    private let theme: Theme
    
    // MARK: - Initializer

    init(theme: Theme) {
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupComponents()
    }
    
    // MARK: - Private Functions
    
    private func setupComponents() {
        title = viewModel.title
        view.backgroundColor = theme.color.brandSystemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: indicator)
        
        airQualityStackView = buildStackView(with: airQualityTitleLabel,
                                             minLabel: airQualityMinLabel,
                                             maxLabel: airQualityMaxLabel,
                                             averageLabel: airQualityAverageLabel)
        
        humidityStackView = buildStackView(with: humidityTitleLabel,
                                           minLabel: humidityMinLabel,
                                           maxLabel: humidityMaxLabel,
                                           averageLabel: humidityAverageLabel)
        
        temperatureStackView = buildStackView(with: temperatureTitleLabel,
                                              minLabel: temperatureMinLabel,
                                              maxLabel: temperatureMaxLabel,
                                              averageLabel: temperatureAverageLabel)
        
        NSLayoutConstraint.activate([
            airQualityStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding),
            airQualityStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            airQualityStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            
            humidityStackView.topAnchor.constraint(equalTo: airQualityStackView.bottomAnchor, constant: Constants.padding),
            humidityStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            humidityStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            
            temperatureStackView.topAnchor.constraint(equalTo: humidityStackView.bottomAnchor, constant: Constants.padding),
            temperatureStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            temperatureStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
        ])
        
    }
    
    private func buildStackView(with titleLabel: UILabel,
                                minLabel: UILabel,
                                maxLabel: UILabel,
                                averageLabel: UILabel) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 8
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(minLabel)
        stackView.addArrangedSubview(maxLabel)
        stackView.addArrangedSubview(averageLabel)
        
        view.addSubview(stackView)
        return stackView
    }
}

// MARK: - DeviceDetailView

extension DeviceDetailViewController: DeviceDetailView {
    
    func toggleLoadingIndicator(_ isLoading: Bool) {
        if isLoading {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }
    
    func updateData() {
        airQualityMaxLabel.text = viewModel.airqualityMax > 0 ? "Max: \(viewModel.airqualityMax)" : "--"
        airQualityMinLabel.text = viewModel.airqualityMin > 0 ? "Min: \(viewModel.airqualityMin)" : "--"
        airQualityAverageLabel.text = viewModel.airqualityAverage > 0 ? "Average: \(viewModel.airqualityAverage)" : "--"
        
        humidityMaxLabel.text = viewModel.humidityMax > 0 ? "Max: \(viewModel.humidityMax)" : "--"
        humidityMinLabel.text = viewModel.humidityMin > 0 ? "Min: \(viewModel.humidityMin)" : "--"
        humidityAverageLabel.text = viewModel.humidityAverage > 0 ? "Average: \(viewModel.humidityAverage)" : "--"
        
        temperatureMaxLabel.text = viewModel.temperatureMax > 0 ? "Max: \(viewModel.temperatureMax)" : "--"
        temperatureMinLabel.text = (viewModel.temperatureMin > 0 || viewModel.temperatureMin < 0) ? "Min: \(viewModel.temperatureMin)" : "--"
        temperatureAverageLabel.text = viewModel.temperatureAverage > 0 ? "Average: \(viewModel.temperatureAverage)" : "--"
    }
    
    func showAlert(with message: String) {
        displayAlert(title: Strings.errorTitle,
                     message: message,
                     actionTitles: [Strings.retry],
                     cancelAction: true,
                     style: .alert,
                     actions: [{ [weak self ] _ in
                        guard let self = self else {
                            return
                        }
                        self.viewModel.retryFetchingReadings()
                        }])
    }
}
