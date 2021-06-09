import Foundation

class Invoice {
    var orders: [Order] = []
    var dueDate: Date = .init()
    var customer: String = ""
    
    class Order {
        var amount: Int = 0
    }
}

extension Date {
    static var today: Date {
        .init(timeIntervalSince1970: 0)
    }
}

/// Source
/// function printOwing(invoice) {
///    let outstanding = 0;
/// 
///    console.log("***********************");
///    console.log("**** Customer Owes ****");
///    console.log("***********************");
/// 
///    // calculate outstanding
///    for (const o of invoice.orders) {
///      outstanding += o.amount;
///    }
/// 
///    // record due date
///    const today = Clock.today;
///    invoice.dueDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 30);
/// 
///    //print details
///    console.log(`name: ${invoice.customer}`);
///    console.log(`amount: ${outstanding}`);
///    console.log(`due: ${invoice.dueDate.toLocaleDateString()}`);
/// }

enum Origin {
    func printOwing(_ invoice: Invoice) {
        var outstanding = 0
    
        print("***********************")
        print("**** Customer Owes ****")
        print("***********************")
    
        // calculate outstanding
        for order in invoice.orders {
            outstanding += order.amount
        }
    
        // record due date
        let today = Date.today
        invoice.dueDate = .init(timeInterval: 60 * 30, since: today)
    
        //print details
        print("name: \(invoice.customer)")
        print("amount: \(outstanding)")
        print("due: \(invoice.dueDate)") //.toLocaleDateString()
    }
}
