import NIO
import AWSLambdaRuntime
import AWSLambdaEvents
import Foundation

public enum ExampleError: Error {
    case genericError
}

Lambda.run(Handler())

struct Handler: EventLoopLambdaHandler {
    
    typealias In = APIGateway.Request
    typealias Out = APIGateway.Response
    
    func handle(context: Lambda.Context, event: APIGateway.Request) -> EventLoopFuture<APIGateway.Response> {
        
        let path = event.requestContext.path
        
        if path == "/exampleRoute" {

            let resp = APIGateway.Response(statusCode: .ok, headers: ["Content-Type": "application/json"], body: jsonString(from: ["result": "Hello Example Route!"]))
            return context.eventLoop.makeSucceededFuture(resp)
        } else {
            let resp = APIGateway.Response(statusCode: .ok, headers: ["Content-Type": "application/json"], body: jsonString(from: ["result": "Hello Not Example Route!"]))
            return context.eventLoop.makeSucceededFuture(resp)
        }
    }
    
    func jsonString(from: [String: String]) -> String? {
        let data = try! JSONSerialization.data(withJSONObject: from, options: [])
        let jsonString = String(data: data, encoding: .utf8)
        return jsonString
    }
}
