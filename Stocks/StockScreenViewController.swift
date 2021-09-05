//
//  StockScreenViewController.swift
//  Stocks
//
//  Created out-nazarov2-ms on 05.09.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol StockScreenViewInput: class {
  var viewController: UIViewController { get }
  var presenter: StockScreenViewOutput? { get set }
  func setCompanyName(name: String)
  func setSymbol(name: String)
  func setPrice(name: String)
  func setPriceChange(name: String)
}

class StockScreenViewController: UIViewController{
  var presenter: StockScreenViewOutput?

  var viewController: UIViewController { return self }
  let stocks = ["Apple": "APPL",
                "Microsoft": "MSFT",
                "Google": "GOOG",
                "Amazon": "AMZN",
                "Facebook": "FB"]
  let companyNameLabel = UILabel()
  let symbolLabel = UILabel()
  let priceLabel = UILabel()
  let priceChange = UILabel()

  let changeCompanyPicker = UIPickerView()
  override func loadView() {
    super.loadView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    changeCompanyPicker.dataSource = self
    changeCompanyPicker.delegate = self
  }
  func setupUI() {
    view.backgroundColor = .white
    view.addSubview(changeCompanyPicker)
    view.addSubview(companyNameLabel)
    view.addSubview(symbolLabel)
    view.addSubview(priceLabel)
    view.addSubview(priceChange)
    changeCompanyPicker.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.right.equalToSuperview().inset(40)
      make.bottom.equalToSuperview().offset(40)
      make.height.equalTo(300)
    }
    companyNameLabel.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.right.equalToSuperview().inset(40)
      make.top.equalToSuperview().offset(40)
    }
    symbolLabel.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.right.equalToSuperview().inset(40)
      make.top.equalTo(companyNameLabel.snp.bottom).offset(40)
    }
    priceLabel.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.right.equalToSuperview().inset(40)
      make.top.equalTo(symbolLabel.snp.bottom).offset(40)
    }
    priceChange.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.right.equalToSuperview().inset(40)
      make.top.equalTo(priceLabel.snp.bottom).offset(40)
    }

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
    presenter?.didSelect(abbreviation: Array(stocks.values)[row])
  }
}
extension StockScreenViewController: StockScreenViewInput {
  func setCompanyName(name: String) {
    companyNameLabel.text = name
  }

  func setSymbol(name: String) {
    symbolLabel.text = name
  }

  func setPrice(name: String) {
    priceLabel.text = name
  }

  func setPriceChange(name: String) {
    priceChange.text = name
  }


}
