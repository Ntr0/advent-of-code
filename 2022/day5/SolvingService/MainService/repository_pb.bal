import ballerina/grpc;
import ballerina/protobuf;

public const string REPOSITORY_DESC = "0A107265706F7369746F72792E70726F746F120A7265706F7369746F727922210A0B496E69745265717565737412120A0473697A65180120012805520473697A6522280A0C496E6974526573706F6E736512180A077375636365737318012001280852077375636365737322350A0B5075736852657175657374120E0A0269641801200128055202696412160A06637261746573180220012809520663726174657322200A0643726174657312160A06637261746573180120012809520663726174657322320A0A506F7052657175657374120E0A0269641801200128055202696412140A05636F756E741802200128055205636F756E7422070A05456D7074793290020A0A5265706F7369746F7279122D0A05726573657412112E7265706F7369746F72792E456D7074791A112E7265706F7369746F72792E456D70747912330A047075736812172E7265706F7369746F72792E50757368526571756573741A122E7265706F7369746F72792E43726174657312310A03706F7012162E7265706F7369746F72792E506F70526571756573741A122E7265706F7369746F72792E43726174657312340A05736869667412172E7265706F7369746F72792E50757368526571756573741A122E7265706F7369746F72792E43726174657312350A0C676574546F7043726174657312112E7265706F7369746F72792E456D7074791A122E7265706F7369746F72792E437261746573620670726F746F33";

public isolated client class RepositoryClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, REPOSITORY_DESC);
    }

    isolated remote function reset(Empty|ContextEmpty req) returns Empty|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/reset", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Empty>result;
    }

    isolated remote function resetContext(Empty|ContextEmpty req) returns ContextEmpty|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/reset", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Empty>result, headers: respHeaders};
    }

    isolated remote function push(PushRequest|ContextPushRequest req) returns Crates|grpc:Error {
        map<string|string[]> headers = {};
        PushRequest message;
        if req is ContextPushRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/push", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Crates>result;
    }

    isolated remote function pushContext(PushRequest|ContextPushRequest req) returns ContextCrates|grpc:Error {
        map<string|string[]> headers = {};
        PushRequest message;
        if req is ContextPushRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/push", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Crates>result, headers: respHeaders};
    }

    isolated remote function pop(PopRequest|ContextPopRequest req) returns Crates|grpc:Error {
        map<string|string[]> headers = {};
        PopRequest message;
        if req is ContextPopRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/pop", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Crates>result;
    }

    isolated remote function popContext(PopRequest|ContextPopRequest req) returns ContextCrates|grpc:Error {
        map<string|string[]> headers = {};
        PopRequest message;
        if req is ContextPopRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/pop", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Crates>result, headers: respHeaders};
    }

    isolated remote function shift(PushRequest|ContextPushRequest req) returns Crates|grpc:Error {
        map<string|string[]> headers = {};
        PushRequest message;
        if req is ContextPushRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/shift", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Crates>result;
    }

    isolated remote function shiftContext(PushRequest|ContextPushRequest req) returns ContextCrates|grpc:Error {
        map<string|string[]> headers = {};
        PushRequest message;
        if req is ContextPushRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/shift", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Crates>result, headers: respHeaders};
    }

    isolated remote function getTopCrates(Empty|ContextEmpty req) returns Crates|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/getTopCrates", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Crates>result;
    }

    isolated remote function getTopCratesContext(Empty|ContextEmpty req) returns ContextCrates|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("repository.Repository/getTopCrates", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Crates>result, headers: respHeaders};
    }
}

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextPopRequest record {|
    PopRequest content;
    map<string|string[]> headers;
|};

public type ContextCrates record {|
    Crates content;
    map<string|string[]> headers;
|};

public type ContextPushRequest record {|
    PushRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: REPOSITORY_DESC}
public type InitResponse record {|
    boolean success = false;
|};

@protobuf:Descriptor {value: REPOSITORY_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: REPOSITORY_DESC}
public type PopRequest record {|
    int id = 0;
    int count = 0;
|};

@protobuf:Descriptor {value: REPOSITORY_DESC}
public type InitRequest record {|
    int size = 0;
|};

@protobuf:Descriptor {value: REPOSITORY_DESC}
public type Crates record {|
    string crates = "";
|};

@protobuf:Descriptor {value: REPOSITORY_DESC}
public type PushRequest record {|
    int id = 0;
    string crates = "";
|};

