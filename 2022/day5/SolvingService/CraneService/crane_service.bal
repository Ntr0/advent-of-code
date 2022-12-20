import ballerina/grpc;

listener grpc:Listener svc = new (8090);

@grpc:Descriptor {value: CRANE_DESC}
service "Crane" on svc {

    remote function move(MoveRequest moveRequest) returns MoveResponse|error {
        RepositoryClient ep = check new ("http://localhost:8091");
        PopRequest popRequest = {id: moveRequest.src, count: moveRequest.count};
        Crates popResponse = check ep->pop(popRequest);
        PushRequest pushRequest = {id: moveRequest.tgt, crates: popResponse.crates};
        Crates _ = check ep->push(pushRequest);
        return{success: true}; 
    }
}

