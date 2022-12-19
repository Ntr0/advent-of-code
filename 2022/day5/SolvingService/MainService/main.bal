import ballerina/http;
import ballerina/io;


service / on new http:Listener(8080) {
    function init() {
        io:println("Service Starting");
    }
    resource function get test() returns string {
        return "Hello!";
    }
    resource function get testServices() returns string|error {
        http:Client craneClient = check new ("http://localhost:8090");
        io:println("CraneService OK");
        return check craneClient->get("/test");
    }
}
