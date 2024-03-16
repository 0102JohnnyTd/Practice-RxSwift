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
        let a = [[],[3, 4], [5, 6]].flatMap { $0 }
        let b = [[1, 2],[3, 4], [5, 6]].map { $0 }
        let c: Int?? = Optional.some(Optional.some(1))
        let d = c.map { $0 }
        let e = c.flatMap { $0 }
    }

    private func bind() {
        viewModel.combineLatestObservable
            .subscribe (
                onNext: { print($0) },
                onDisposed: { print("diposeされました") }
            )
            .disposed(by: disposeBag)

        combineLatestButton.rx.tap
            .subscribe (
                onNext: { [weak self] in
                    print("combineLatest:")
                    guard let strongSelf = self else { return }
                    strongSelf.viewModel.publishEvent()
                },
                onDisposed: { print("diposeされました") }
            )
            .disposed(by: disposeBag)
    }
}
