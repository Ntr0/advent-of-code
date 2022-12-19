import ballerina/http;

    string[] stacks = [];

service / on new http:Listener(8091) {
    resource function get test() returns string {
        return "Hello from Repo!";
    }

    resource function post create(int size) returns error?  {
        if size < 0 || size > 100 {
            return error("nope");
        }
        foreach int i in 0 ..< size {
            stacks.push("");
        }
        return ();
    }

    resource function post push/[int id](string crates) returns error?{
        if id > stacks.length() {
            return error("repo does not exist", code=404);
        } 
        stacks[id] += crates;
    } 
}
