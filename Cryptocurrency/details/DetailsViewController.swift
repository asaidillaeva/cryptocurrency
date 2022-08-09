//
//  File.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation
import UIKit
import SnapKit

class DetailsViewController: UIViewController {

    private let namelabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 20)
        view.textColor = .white
        return view
    }()
    
    private let symbolLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 35)
        view.textColor = .white
        return view
    }()
    
    private let cryptoImage: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.textColor = .blue
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    private let volumeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    private let changeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .green
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    private let viewSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let lastView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    var model: Crypto? {
        didSet {
            cryptoImage.kf.setImage(with: URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(model?.id ?? 1).png"))
            namelabel.text = model?.name
            symbolLabel.text = model?.symbol
            priceLabel.text = String.init(format: "Price  %.2f", model?.quote?.currency?.price ?? 0)
            volumeLabel.text = String.init(format: "Volume for 24h  %.2f", model?.quote?.currency?.volume_24h ?? 0)
            changeLabel.text = String.init(format: "Change for 24h: %.2f", model?.quote?.currency?.percent_change_24h ?? 0)
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .black
        view.addSubview(cryptoImage)
        view.addSubview(namelabel)
        view.addSubview(symbolLabel)
        view.addSubview(priceLabel)
        view.addSubview(volumeLabel)
        view.addSubview(changeLabel)
        view.addSubview(viewSeperator)
        view.addSubview(lastView)
    }
    
    private func setupConstraints() {
        symbolLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(100)
        }
        
        cryptoImage.snp.makeConstraints { make in
            make.leading.equalTo(symbolLabel.snp.trailing).offset(25)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        viewSeperator.snp.makeConstraints { make in
            make.top.equalTo(cryptoImage.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(15)
            make.height.equalTo(1)
        }
        
        namelabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(viewSeperator.snp.bottom).offset(15)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(namelabel.snp.bottom).offset(5)
            
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            
        }
        
        changeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(volumeLabel.snp.bottom).offset(5)
        }
        lastView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(changeLabel.snp.bottom).offset(5)
            make.bottom.trailing.equalToSuperview()
        }
    }
}
