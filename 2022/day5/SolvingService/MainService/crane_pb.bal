import ballerina/grpc;
import ballerina/protobuf;

public const string CRANE_DESC = "0A0B6372616E652E70726F746F12056372616E65226D0A0B4D6F76655265717565737412100A03737263180120012805520373726312100A03746774180220012805520374677412140A05636F756E741803200128055205636F756E7412240A0D70726573657276654F72646572180420012808520D70726573657276654F7264657222280A0C4D6F7665526573706F6E736512180A077375636365737318012001280852077375636365737332380A054372616E65122F0A046D6F766512122E6372616E652E4D6F7665526571756573741A132E6372616E652E4D6F7665526573706F6E7365620670726F746F33";

public isolated client class CraneClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, CRANE_DESC);
    }

    isolated remote function move(MoveRequest|ContextMoveRequest req) returns MoveResponse|grpc:Error {
        map<string|string[]> headers = {};
        MoveRequest message;
        if req is ContextMoveRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("crane.Crane/move", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <MoveResponse>result;
    }

    isolated remote function moveContext(MoveRequest|ContextMoveRequest req) returns ContextMoveResponse|grpc:Error {
        map<string|string[]> headers = {};
        MoveRequest message;
        if req is ContextMoveRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("crane.Crane/move", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <MoveResponse>result, headers: respHeaders};
    }
}

public type ContextMoveResponse record {|
    MoveResponse content;
    map<string|string[]> headers;
|};

public type ContextMoveRequest record {|
    MoveRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: CRANE_DESC}
public type MoveResponse record {|
    boolean success = false;
|};

@protobuf:Descriptor {value: CRANE_DESC}
public type MoveRequest record {|
    int src = 0;
    int tgt = 0;
    int count = 0;
    boolean preserveOrder = false;
|};

