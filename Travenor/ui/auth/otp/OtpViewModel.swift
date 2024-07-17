//
//  OtpViewModel.swift
//  Travenor
//
//  Created by Saif on 07/02/2024.
//

import Foundation

class OtpViewModel : ObservableObject {
    
    private let TIMER_IN_SECONDS: Int = 60
    
    @Published var isLoading = false
    @Published var otpCodeSuccessState = false
    
    @Published var code1: String = "" 
    @Published var code2: String = ""
    @Published var code3: String = ""
    @Published var code4: String = ""
    @Published var timerInSec: Int = 0
    @Published var isTimerRunning: Bool = true
    
    private var timerWorkItem: DispatchWorkItem? = nil
    
    private var otpCode: String {
        code1+code2+code3+code4
    }
   
    
    init() {
        timerInSec = TIMER_IN_SECONDS
    }
    
    func startTimer() {
        var time = TIMER_IN_SECONDS
        timerWorkItem?.cancel()
        
        isTimerRunning = true
        timerWorkItem = DispatchWorkItem(block: { [weak self] in
            guard let self = self else { return }
            
            while time - 1 >= 0 {
                if timerWorkItem?.isCancelled ?? true {
                    print("cancelled timer = \(time)")
                    break
                }
                sleep(1)
                time -= 1
                DispatchQueue.main.sync {
                    self.timerInSec = time
                }
                print("timer= \(time)")
            }
            isTimerRunning = false
        })
        DispatchQueue.global(qos: .userInteractive).async(execute: timerWorkItem!)
    }

    
    func sendOtpCode() {
        isLoading = true
        
        otpCodeSuccessState = true
        
        isLoading = false
    }
    
    func resendEmailVerification() {
        isLoading = true
        
        startTimer()

        isLoading = false
    }
    
}
