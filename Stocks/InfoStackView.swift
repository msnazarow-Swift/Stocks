//
//  InfoStackView.swift
//  Stocks
//
//  Created by out-nazarov2-ms on 06.09.2021.
//

import UIKit

class InfoStackView: UIStackView {
  private
  let company: UILabel = {
    let label = UILabel()
    label.text = "Company name"
    return label
  }()
  
  private
  let symbol: UILabel = {
    let label = UILabel()
    label.text = "Symbol"
    return label
  }()
  
  private
  let price: UILabel = {
    let label = UILabel()
    label.text = "Price"
    return label
  }()
  
  private
  let priceChange: UILabel = {
    let label = UILabel()
    label.text = "Price change"
    return label
  }()
  
  let companyNameLabel = UILabel()
  let symbolLabel = UILabel()
  let priceLabel = UILabel()
  let priceChangeLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addArrangedSubview({
      let stack = UIStackView(arrangedSubviews: [company, companyNameLabel])
      stack.distribution = .equalSpacing
      return stack
    }())
    
    addArrangedSubview({
      let stack = UIStackView(arrangedSubviews: [symbol,symbolLabel])
      stack.distribution = .equalSpacing
      return stack
    }())
    
    addArrangedSubview({
      let stack = UIStackView(arrangedSubviews: [price,priceLabel])
      stack.distribution = .equalSpacing
      return stack
    }())
    
    addArrangedSubview({
      let stack = UIStackView(arrangedSubviews: [priceChange,priceChangeLabel])
      stack.distribution = .equalSpacing
      return stack
    }())
    
    axis = .vertical
    distribution = .fillEqually
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
