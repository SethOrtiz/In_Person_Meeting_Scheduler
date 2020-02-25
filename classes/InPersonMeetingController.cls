public class InPersonMeetingController {
    @AuraEnabled
    public static Contact getContactInfo(Id recordId) {
        Contact myRecord = [SELECT FirstName, LastName, MailingPostalCode FROM Contact WHERE Id = :recordId LIMIT 1];
        System.debug(myRecord);
        return myRecord;
    }
    
    @AuraEnabled
    public static String getLocalBusinessesByLocation(String searchString) {
        List<Auth_Token__mdt> tokenData = [SELECT Bearer__C FROM Auth_Token__mdt LIMIT 1];
        String token = tokenData[0].Bearer__C;
        // Make sure there are now spaces in the string
        String validSearch = searchString.deleteWhitespace();
        httpResponse locationResponse = YelpCallout.getBusinessList(YelpCallout.CalloutType.LOCATION,token, validSearch);
        String businessList = locationResponse.getBody();
        return businessList;
    }
    @AuraEnabled
    public static void updateContact(Id conId, String mLoc, Datetime mDT){
        Contact cn = [SELECT Id, Meeting_Date_Time__c, Meeting_Location__c FROM Contact WHERE Id = :conId LIMIT 1];
        cn.Meeting_Location__c = mLoc;
        cn.Meeting_Date_Time__c = mDT;
        try{
            UPDATE cn;
        } catch(DmlException e) {          
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }   
    }
}