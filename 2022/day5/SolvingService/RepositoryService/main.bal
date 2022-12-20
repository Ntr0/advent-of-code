import ballerina/grpc;
import ballerina/io;

listener grpc:Listener ep = new (8091);
string[] stacks = [];

@grpc:Descriptor {value: REPOSITORY_DESC}
service "Repository" on ep {

    remote function reset(Empty val) returns Empty|error  {
        stacks = [];
        return {};
    }

    remote function push(PushRequest value) returns Crates|error {
        io:print("PushRequest", value, "\n");
        stacks[value.id-1] = value.crates + stacks[value.id-1];
        return{crates: stacks[value.id-1]};
    }

    remote function shift(PushRequest value) returns Crates|error {
        io:print("Request", value, "\n");
        foreach int i in stacks.length() ..< value.id {
            stacks.push("");
        }
        stacks[value.id-1] += value.crates;
        return{crates: stacks[value.id-1]};
    }

    remote function pop(PopRequest value) returns Crates|error {
        io:print("PopRequest", value, "\n");
        string stack = stacks[value.id-1];
        io:print("stack: ", stack, "\n");
        string crates = stack.substring(0, value.count);
        io:print("crates: ", crates, "\n");
        if stack.length() > value.count {
            stacks[value.id-1] = stack.substring(value.count);
        } else {
            stacks[value.id-1] = "";
        }
        io:print("new stack: ", stacks[value.id-1], "\n");
        return{crates: crates}; 
    }

    remote function getTopCrates(Empty value) returns Crates|error {
        string result  = "";
        io:print("stack length: ", stacks.length());
        foreach string stack in stacks {
            result += stack[0];
        }
        return{crates: result}; 
    }
}

