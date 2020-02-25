({
    submitForm: function (cmp, event, helper) {
        // Form must be validated
        const action = cmp.get("c.updateContact");
        let mLoc = cmp.find("meetingLocation").get("v.value");
        let mDT = cmp.find("meetingDate").get("v.value");
        console.log(mLoc , mDT);
        action.setParams({
            conId: cmp.get("v.recordId"),
            mLoc: mLoc,
            mDT: mDT
        });
        action.setCallback(this, function(data) {
        alert("Your in-person Meeting has been Scheduled Successfully");
        });
        $A.enqueueAction(action); 
        }
})