import ballerina/http;
import ballerina/io;
import ballerina/regex;

service / on new http:Listener(8080) {
    function init() {
        io:println("Service Starting");
    }
    resource function get test() returns string {
        return "Hello!";
    }
    resource function get testServices() returns string|error {
        RepositoryClient _ = check new ("http://localhost:8091");
        CraneClient _ = check new("http://localhost:8090");
        return "clients initialized successfully";
    }

    resource function post solve(string preserve, @http:Payload string input) returns string|error {

        string[] lines = regex:split(input, "\n");
        boolean crateDef = true;
        
        RepositoryClient repCl = check new ("http://localhost:8091");
        io:print("preserve: ", preserve == "true","\n");
        _ = check repCl->reset({});
        CraneClient crCl = check new("http://localhost:8090");
        foreach string line in lines {
            if (line == "") {
                crateDef = false;
                io:print("got top crates");
                Crates result = check repCl->getTopCrates({});
                io:print(result.crates);
                continue;
            }
            if (crateDef) {
                int i = 1;
                if line[i] == "1" {
                    continue;
                }
                while ( i < line.length()) {
                    string crate = line[i];
                    int id = i / 4 + 1;
                    i += 4;
                    if crate != " " {
                        PushRequest req = {id: id, crates: crate};
                       Crates _ = check repCl->shift(req); 
                    }
                }
            }
            if line.startsWith("move") {
                string[] matches = regex:split(line, " ");
                int[] casted = [];
                foreach int pos in [1, 3,5] {
                    int|error cast = int:fromString(matches[pos]);
                    if cast is error {
                        return error("could not cast " + matches[pos] + " to int, line: " + line);
                    } else {
                        casted.push(cast);
                    }
                }
                MoveRequest req = {count: casted[0], src: casted[1], tgt: casted[2], preserveOrder: preserve == "true"};
                MoveResponse _ = check crCl->move(req);

            }

        }

        Crates result = check repCl->getTopCrates({});
        return result.crates;
    }
}
