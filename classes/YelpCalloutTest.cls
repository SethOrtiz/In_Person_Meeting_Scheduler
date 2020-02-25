@isTest
private class YelpCalloutTest {
    @isTest static void testGetCallout(){
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new YelpCalloutMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 

        List<HttpResponse> responseList = new List<HttpResponse>();
        String token = 'Bearer fakeKey';
        httpResponse locationResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.LOCATION,token, 'tempe');
        responseList.add(locationResponse);
        httpResponse phoneResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.PHONE,token, '14157492060');
        responseList.add(phoneResponse);
        httpResponse transResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.TRANSACTION_TYPE,token, 'tempe');
        responseList.add(transResponse);
        httpResponse detailsResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.DETAILS,token, 'WavvLdfdP6g8aZTtbBQHTw');
        responseList.add(detailsResponse);
        httpResponse reviewsResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.REVIEWS,token, 'WavvLdfdP6g8aZTtbBQHTw');
        responseList.add(reviewsResponse);
        httpResponse autoCompleteResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.AUTOCOMPLETE,token, 'valley');
        responseList.add(autoCompleteResponse);
        
        // Perform all test on each endpoint
        for (httpResponse r : responseList){
            String contentType = r.getHeader('Content-Type');
            System.assert(contentType == 'application/json');
            String actualValue = r.getBody();
            String expectedValue = '{"businesses":[ {"id": "wl0QZqAzr1DelslQ02JGCQ", "name": "Cornish Pasty"}, {"id": "vK1_qKEG7zHvjiTOsN0CRg", "name": "Snooze An A.M. Eatery"}]}';
            System.assertEquals(actualValue, expectedValue);
            System.assertEquals(200, r.getStatusCode());
        }    
    }
}