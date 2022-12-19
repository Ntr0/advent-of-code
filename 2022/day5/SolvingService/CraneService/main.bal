import ballerina/http;


service / on new http:Listener(8090) {
    resource function get test() returns string {
        return "Hello from Crane!";
    }
}
