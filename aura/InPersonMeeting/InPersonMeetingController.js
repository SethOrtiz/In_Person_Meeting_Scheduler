({
    doInit : function(cmp, event, helper) {
        const action = cmp.get("c.getContactInfo");
        action.setParams({
            recordId: cmp.get("v.recordId")
        });
        action.setCallback(this, function(data) {
            cmp.set("v.Contact", data.getReturnValue());
        });
        $A.enqueueAction(action);   
    },    
    handleMapEvent: function (cmp, event, helper) {
        let payload = event.getParam("businessList");
        let parsedData = JSON.parse(payload);
        let mapData = parsedData.businesses
        let formattedMarkers = [];
        mapData.forEach(business => {
            let markerData = {
                location: { City: business.location.city, State: business.location.state,
                            PostalCode: business.location.zip_code, Street: business.location.address1,
                            Country: business.location.country }, 
                title: business.name
            }
           	formattedMarkers.push(markerData);           
        })
       cmp.set("v.mapMarkers", formattedMarkers);
    }	
})