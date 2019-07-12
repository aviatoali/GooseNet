import Foundation
/**
 ViewModel for the networking layer example, contains api request to fetch a legal document
 - author: Ali H. Shah
 - date: 07/09/2019
*/
class ViewModel {
    func OnButtonPress() {
        GetLegalDoc().Request { result in
            switch result {
            case .success(let legalDoc):
                print("@@@@@@@@@@@@@@@@@@@ case SUCCESS firing with document: \(legalDoc.url)")
            case .failure(let error):
                print("@@@@@@@@@@@@@@@@@@@ case FAILURE firing with error: \(error.localizedDescription)")
            }
        }
    }
}
