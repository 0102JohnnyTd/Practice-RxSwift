//
//  WithLatestFromViewController.swift
//  PracticeRxSwift
//
//  Created by Johnny Toda on 2024/03/15.
//

import UIKit
import RxSwift
import RxCocoa

final class WithLatestFromViewController: UIViewController {
    @IBOutlet private weak var withLatestFromButton: UIButton!

    private let disposeBag = DisposeBag()
    private let viewModel = WithLatestFromViewModel()

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

        withLatestFromButton.rx.tap
            .subscribe (onNext: { [weak self] in
                print("withLatestFrom:")
                guard let strongSelf = self else { return }
                strongSelf.viewModel.publishEvent()
            })
            .disposed(by: disposeBag)
    }
}
