//
//  CryptoCell.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation
import UIKit
import Kingfisher

class CryptoCell: UITableViewCell {
    private let cryptoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let changeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .green
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: Crypto) {
        symbolLabel.text = data.symbol
        nameLabel.text = data.name
        priceLabel.text = String(format: "%.2f",data.quote?.currency?.price ?? 0)
        let change: Double = data.quote?.currency?.percent_change_24h ?? 0
        changeLabel.text = String(format: "%.2f", change)
        if(change < 0) {
            changeLabel.textColor = .red
        } else {
            changeLabel.textColor = .green
        }
    }
    
    func setLogo(logo: Int) {
        let path =  "https://s2.coinmarketcap.com/static/img/coins/64x64/\(logo).png"
        cryptoImageView.kf.setImage(with: URL(string: path))
        print(path)
    }
    
    private func setup(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        contentView.addSubview(cryptoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changeLabel)
        contentView.addSubview(symbolLabel)
        
    }
    
    private func setupConstraints() {
        cryptoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(25)
            make.top.bottom.equalToSuperview().inset(15)
            make.width.equalTo(40)
        }
        symbolLabel.snp.makeConstraints { make in
            make.leading.equalTo(cryptoImageView.snp.trailing).offset(20)
            make.top.equalToSuperview().inset(15)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.top.equalTo(symbolLabel.snp.bottom).offset(5)
            make.leading.equalTo(cryptoImageView.snp.trailing).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(25)
        }
        
        changeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(25)
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
        }
    }
}


extension UITableViewCell {
    
    var identifier: String {
        .init(describing: self)
    }
    
    static var identifier: String {
        .init(describing: self)
    }
}
