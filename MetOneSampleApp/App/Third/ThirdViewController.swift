//
//  ThirdViewController.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/30/23.
//

import UIKit
import SnapKit
import Combine

class ThirdViewController: UIViewController {
    
    var closureTimeLabel = UILabel()
    var observableTimeLabel = UILabel()
    var combineTimeLabel = UILabel()
    
    private var viewModel = ThirdViewControllerViewModel()
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello Third view controller")
        
        self.view.backgroundColor = .white
        
        setViews()
        setBinding()
        startTimer()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setViews() {
        view.addSubview(closureTimeLabel)
        view.addSubview(observableTimeLabel)
        view.addSubview(combineTimeLabel)
        
        self.closureTimeLabel.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(100)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
        })
        
        self.observableTimeLabel.snp.makeConstraints({
            $0.top.equalTo(closureTimeLabel.snp.bottom).offset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
        })
        
        self.combineTimeLabel.snp.makeConstraints({
            $0.top.equalTo(observableTimeLabel.snp.bottom).offset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
        })
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.viewModel.checkTime()
        }
    }
    
    func setBinding() {
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = "Closure 방식 : \(viewModel.closureTime)"
        }
        
        viewModel.observableTime.bind { [weak self] time in
            guard let time = time else { return }
            self?.observableTimeLabel.text = "Observables 방식" + time
        }
        
        viewModel.$combineTime
            .compactMap { String($0) }
            .assign(to: \.text, on: combineTimeLabel)
            .store(in: &cancellables)
    }
    
}
