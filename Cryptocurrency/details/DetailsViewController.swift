//
//  File.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {

    private let namelabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 20)
        
        return view
    }()
    
    private let cryptoImage: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    

    var model: Crypto? {
        didSet {
            
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
        
    }
    
    private func setupConstraints() {
        
    }
}
