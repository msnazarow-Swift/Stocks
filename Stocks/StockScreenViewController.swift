//
//  StockScreenViewController.swift
//  Stocks
//
//  Created out-nazarov2-ms on 05.09.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol StockScreenViewInput: AnyObject {
    var viewController: UIViewController { get }
    var presenter: StockScreenViewOutput? { get set }
    func setCompanyName(name: String)
    func setSymbol(name: String)
    func setPrice(name: String)
    func setPriceChange(name: String)
}

class StockScreenViewController: UIViewController {
    var presenter: StockScreenViewOutput?

    var viewController: UIViewController { return self }

    let stocks = [
        "Apple": "AAPL",
        "Microsoft": "MSFT",
        "Google": "GOOG",
        "Amazon": "AMZN",
        "Facebook": "FB"
    ]
    let vStack = InfoStackView()
    let activityIndicator = UIActivityIndicatorView()
    let changeCompanyPicker = UIPickerView()
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        activityIndicator.startAnimating()
        changeCompanyPicker.dataSource = self
        changeCompanyPicker.delegate = self
        presenter?.didSelect(abbreviation: Array(stocks.values)[changeCompanyPicker.selectedRow(inComponent: 0)]) { [weak self] in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: []) {
                self?.view.backgroundColor = self?.view.backgroundColor?.withAlphaComponent(1)
            }
            self?.activityIndicator.stopAnimating()
            self?.vStack.isHidden = false
            self?.changeCompanyPicker.isHidden = false
        }
    }

    func setupUI() {
        view.backgroundColor = .init(white: 1.0, alpha: 0.7)
        view.addSubview(changeCompanyPicker)
        view.addSubview(vStack)
        view.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        changeCompanyPicker.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().offset(40)
            make.height.equalTo(300)
        }

        vStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().inset(40)
            make.bottom.equalTo(changeCompanyPicker.snp.top)
        }
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        vStack.isHidden = true
        changeCompanyPicker.isHidden = true
    }
}

extension StockScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        stocks.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Array(stocks.keys)[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: []) { [weak self] in
            self?.view.backgroundColor = self?.view.backgroundColor?.withAlphaComponent(0.7)
        }
        activityIndicator.startAnimating()
        presenter?.didSelect(abbreviation: Array(stocks.values)[row]) { [weak self] in
            UIView.animate(withDuration: 0.3, delay: 0.0, options: []) {
                self?.view.backgroundColor = self?.view.backgroundColor?.withAlphaComponent(1)
            }
            self?.activityIndicator.stopAnimating()
        }
    }
}

extension StockScreenViewController: StockScreenViewInput {
    func setCompanyName(name: String) {
        vStack.companyNameLabel.text = name
    }

    func setSymbol(name: String) {
        vStack.symbolLabel.text = name
    }

    func setPrice(name: String) {
        vStack.priceLabel.text = name
    }

    func setPriceChange(name: String) {
        vStack.priceChangeLabel.text = name
    }
}
