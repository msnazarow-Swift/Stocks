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
  
  let stocks = ["Apple": "AAPL",
                "Microsoft": "MSFT",
                "Google": "GOOG",
                "Amazon": "AMZN",
                "Facebook": "FB"]
  let vStack = InfoStackView()

  let changeCompanyPicker = UIPickerView()
  override func loadView() {
    super.loadView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    changeCompanyPicker.dataSource = self
    changeCompanyPicker.delegate = self
    presenter?.didSelect(abbreviation: Array(stocks.values)[changeCompanyPicker.selectedRow(inComponent: 0)])
  }

  func setupUI() {
    view.backgroundColor = .white
    view.addSubview(changeCompanyPicker)
    view.addSubview(vStack)

    changeCompanyPicker.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.right.equalToSuperview().inset(40)
      make.bottom.equalToSuperview().offset(40)
      make.height.equalTo(300)
    }

    vStack.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(40)
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.right.equalToSuperview().inset(40)
      make.bottom.equalTo(changeCompanyPicker.snp.top)
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
