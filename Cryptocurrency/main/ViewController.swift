//
//  ViewController.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 1/8/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.identifier)
        return view
    }()
    
    private let viewModel: IMainViewModel
    
    init(vm: IMainViewModel = MainViewModel()) {
        viewModel = vm
        
        super.init(nibName: nil, bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getAllData { result in
            switch result {
            case .success(_):
                self.tableView.reloadData()
                break
            case .failure(let error):
                self.showError(error)
                break
            }
        }
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func showError(_ error: Error) {
        
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailsViewController()
        vc.model = viewModel.data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier, for: indexPath) as! CryptoCell
        cell.setLogo(logo: viewModel.data[indexPath.row].id!)
//        viewModel.getCoinLogo(id: viewModel.data[indexPath.row].id!) { result in
//            switch result {
//            case .success(let data):
//                cell.setLogo(logo: data)
//            case .failure(_):
//                cell.setLogo(logo: "error")
//            }
//        }
        cell.setData(viewModel.data[indexPath.row])
        return cell
    }
    
    
}
