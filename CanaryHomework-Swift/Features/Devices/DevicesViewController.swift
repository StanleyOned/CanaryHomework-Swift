//
//  DevicesViewController.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// View controller that will show a list of Devices.
final class DevicesViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = theme.color.brandSystemBackground
        tableView.register(DeviceCell.self, forCellReuseIdentifier: DeviceCell.identifier)
        return tableView
    }()
    
    private var indicator = UIActivityIndicatorView(style: .medium)
    
    private let theme: Theme
    var viewModel: DevicesViewModelProtocol!
    
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
        view.addSubview(tableView)
        let barButtonItem = UIBarButtonItem(customView: indicator)
        navigationItem.rightBarButtonItem = barButtonItem
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - DevicesView

extension DevicesViewController: DevicesView {
    func reloadData() {
        tableView.reloadData()
    }
    
    func toggleLoadingIndicator(_ isLoading: Bool) {
        if isLoading {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
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
                       self.viewModel.retryFetchingDevices()
                    }])
    }
}

// MARK: - UITableViewDelegate

extension DevicesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectDevice(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension DevicesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceCell.identifier, for: indexPath) as? DeviceCell else {
            return UITableViewCell()
        }
        let device = viewModel.device(at: indexPath)
        cell.configure(with: device)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

