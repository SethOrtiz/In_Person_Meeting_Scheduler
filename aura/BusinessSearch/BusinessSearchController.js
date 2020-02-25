({
	submitSearch : function(component, event) {
        const action = component.get("c.getLocalBusinessesByLocation");
        action.setParams({
            searchString: component.get("v.searchString")
        });
        action.setCallback(this, function(data) {
            // instead of setting a view attribute, call a loadMap event with the return data 
            let mapEvent = component.getEvent("mapEvent");
            mapEvent.setParams({ "businessList": data.getReturnValue()});
            mapEvent.fire(); 
        });
        $A.enqueueAction(action); 
        console.log("searchSubmitted");
	}
})