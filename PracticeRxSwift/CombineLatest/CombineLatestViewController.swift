//
//  CombineLatestViewController.swift
//  PracticeRxSwift
//
//  Created by Johnny Toda on 2024/03/15.
//

import UIKit
import RxSwift
import RxCocoa

final class CombineLatestViewController: UIViewController {
    @IBOutlet private weak var combineLatestButton: UIButton!

    private let disposeBag = DisposeBag()
    private let viewModel = CombineLatestViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        viewModel.combineLatestObservable
            .subscribe {
                print($0)
            }
            .disposed(by: disposeBag)

        combineLatestButton.rx.tap
            .subscribe (onNext: { [weak self] in
                print("combineLatest:")
                guard let strongSelf = self else { return }
                strongSelf.viewModel.publishEvent()
            })
            .disposed(by: disposeBag)
    }
}
