@isTest
global class YelpCalloutMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"businesses":[ {"id": "wl0QZqAzr1DelslQ02JGCQ", "name": "Cornish Pasty"}, {"id": "vK1_qKEG7zHvjiTOsN0CRg", "name": "Snooze An A.M. Eatery"}]}');
        response.setStatusCode(200);
        return response; 
    }
}