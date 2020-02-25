@isTest
private class InPersonMeetingControllerTest {
    @isTest static void  getContactInfoTest(){ 
        Contact testCon = new Contact(FirstName = 'John', LastName = 'Doe', MailingPostalCode = '85349');
        insert testCon;
        Contact conInfo = InPersonMeetingController.getContactInfo(testCon.Id);
        System.assertEquals('John', conInfo.FirstName);
        System.assertEquals('Doe', conInfo.LastName);
        System.assertEquals('85349', conInfo.MailingPostalCode);
    }
    @isTest static void getLocalBusinessByLocationTest(){
        Test.setMock(HttpCalloutMock.class, new YelpCalloutMock()); 
        String actualValue = InPersonMeetingController.getLocalBusinessesByLocation('Tempe');
        System.debug(actualValue);
        String expectedValue = '{"businesses":[ {"id": "wl0QZqAzr1DelslQ02JGCQ", "name": "Cornish Pasty"}, {"id": "vK1_qKEG7zHvjiTOsN0CRg", "name": "Snooze An A.M. Eatery"}]}';
        System.assertEquals(actualValue, expectedValue);
    }

    @isTest static void  updateContactTest(){
        Contact testCon = new Contact(LastName = 'Doe');
        insert testCon;
        Datetime myDateTime = Datetime.newInstance(1960, 2, 24);
        InPersonMeetingController.updateContact(testCon.id, 'France',myDateTime);

        Contact testContact = [SELECT Meeting_Location__c, Meeting_Date_Time__c FROM Contact WHERE Id = :testCon.id];
        System.assertEquals('France', testContact.Meeting_Location__c);
        System.assertEquals( myDateTime, testContact.Meeting_Date_Time__c);
    }
}
