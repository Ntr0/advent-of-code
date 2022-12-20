import ballerina/grpc;

listener grpc:Listener ep = new (8091);
string[] stacks = [];

@grpc:Descriptor {value: REPOSITORY_DESC}
service "Repository" on ep {

    remote function initialize(InitRequest value) returns InitResponse|error {
        foreach int i in 0 ..< value.size {
            stacks.push("");
        }
        return{success: true} ;
    }

    remote function push(PushRequest value) returns Crates|error {
        stacks[value.id] = value.crates + stacks[value.id];
        return{crates: stacks[value.id]}; 
    }

    remote function pop(PopRequest value) returns Crates|error {
        string stack = stacks[value.id];
        string crates = stack.substring(0, value.count);
        stacks[value.id] = stack.substring(value.count, stack.length() - value.count);
        return{crates: crates}; 
    }

    remote function getTopCrates(Empty value) returns Crates|error {
        string result  = "";
        foreach string stack in stacks {
            result += stack[0];
        }
        return{crates: result}; 
    }
}

