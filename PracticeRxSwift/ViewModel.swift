//
//  ViewModel.swift
//  PracticeRxSwift
//
//  Created by Johnny Toda on 2024/03/03.
//

import Foundation
import RxSwift

final class ViewModel {
    let disposeBag = DisposeBag()

    private let drinkSubject = PublishSubject<String>()
    private let countSubject = PublishSubject<Int>()


    lazy var withLatestFromObservable =
    drinkSubject
        .withLatestFrom(countSubject) { drink, count in
            "\(drink)が\(count)杯"
        }

    func sampleCombineLatest() {
        print(#function)
        publishEvent()
    }

    func sampleWithLatestFrom() {
        print(#function)
        publishEvent()
    }

    private func publishEvent() {
        drinkSubject.onNext("🍺")
        drinkSubject.onNext("🍵")
        countSubject.onNext(2)
        countSubject.onNext(3)
        drinkSubject.onNext("🍹")
    }
}

//    var buttonHidden: Observable<Bool> { buttonHiddenSubject }

//    func start() {
//        buttonHiddenSubject.onNext(true)
//    }
//
//    func stop() {
//        buttonHiddenSubject.onNext(false)
//    }
