//
//  WithLatestFromViewModel.swift
//  PracticeRxSwift
//
//  Created by Johnny Toda on 2024/03/15.
//

import Foundation
import RxSwift

final class WithLatestFromViewModel {
    private let disposeBag = DisposeBag()
    
    private let drinkSubject = PublishSubject<String>()
    private let countSubject = PublishSubject<Int>()
    
    var combineLatestObservable: Observable<String> {
        drinkSubject
            .withLatestFrom(countSubject) { drink, count in
                " \(drink)が\(count)杯"
            }
    }
    
    func publishEvent() {
        drinkSubject.onNext("🍺")
        drinkSubject.onNext("🍵")
        countSubject.onNext(2)
        countSubject.onNext(3)
        drinkSubject.onNext("🍹")
    }
}
