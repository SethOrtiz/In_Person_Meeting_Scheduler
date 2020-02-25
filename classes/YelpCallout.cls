public with sharing class YelpCallout {
    
    public enum CalloutType {LOCATION, PHONE, TRANSACTION_TYPE, DETAILS, REVIEWS, AUTOCOMPLETE}
          
    public static httpResponse getBusinessList(CalloutType ct, String bearerToken, String param){
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            
            switch on ct {
                
                //arg should be the name of a city
                when LOCATION {       
                    request.setEndpoint('https://api.yelp.com/v3/businesses/search?location='+ param +'&limit=8');
                }  
                
                //arg should be a phone number
                when PHONE {      
                   request.setEndpoint('https://api.yelp.com/v3/businesses/search/phone?phone='+ param);  
                }
                
                // This endpoint returns a list of businesses which support food delivery transactions.
                // Takes in a city as a param
                when TRANSACTION_TYPE {
                    request.setEndpoint('https://api.yelp.com/v3/transactions/delivery/search?location=' + param);
                }
                
                // arg should be a business ID
                when DETAILS {
                    request.setEndpoint('https://api.yelp.com/v3/businesses/'+ param);
                }
                
                // arg should be an Id
                when REVIEWS {
                    request.setEndpoint('https://api.yelp.com/v3/businesses/'+ param +'/reviews');
                }
                
                when AUTOCOMPLETE {
                    request.setEndpoint('https://api.yelp.com/v3/autocomplete?text='+ param);
                }
                
                when else {      
                    System.debug('Invalid call type');
                }
            }
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setHeader('Authorization', bearerToken);
            HttpResponse response = http.send(request);
            Map<String, Object> BusinessList;
            if (response.getStatusCode() == 200) {
                businessList = (Map<String, Object>) JSON.deserializeUntyped(response.getBody()); 
            } else {
                System.debug('Unsuccessful request' + response.getStatusCode());
            }   
            System.debug(businessList);
            return response;
        }
}