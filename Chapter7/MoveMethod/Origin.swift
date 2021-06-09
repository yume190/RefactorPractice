import Foundation

enum Origin {
    struct Account {
        private let _type: AccountType
        private let _daysOverdrawn: Int
        func overdraftCharge() -> Double {
            if (_type.isPremium()) {
                var result: Double = 10
                if (_daysOverdrawn > 7) {
                    result += Double((_daysOverdrawn - 7)) * 0.85
                }
                return result
            }else {
                return Double(_daysOverdrawn) * 1.75;
            }
        }
        func bankCharge() -> Double {
            var result = 4.5;
            if (_daysOverdrawn > 0) {
                result += overdraftCharge();
            }
            return result;
        }
    }
    
    struct AccountType {
        func isPremium() -> Bool {
            true
        }
        //    func overdraftCharge(daysOverdrawn: Int) -> Double {
        //        if (isPremium()) {
        //            var result: Double = 10;
        //            if (daysOverdrawn > 7) {
        //                result += Double((daysOverdrawn - 7)) * 0.85
        //            }
        //            return result;
        //        } else {
        //            return Double(daysOverdrawn) * 1.75;
        //        }
        //    }
    }
    
}
