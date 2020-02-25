({
    doInit: function (cmp, event, helper) {
        cmp.set('v.mapMarkers', [
            {
                location: {
                    City: 'Brooklyn',
                    State: 'NY',
                    PostalCode: '11238',
                    Street: '617 Vanderbilt Ave',
                    Country: 'United States'
                },
                title: 'Michells Soul Food'
            },
            {
                location: {
                    City: 'New York',
                    State: 'NY',
                    PostalCode: '10009',
                    Street: '114 E 1st St',
                    Country: 'United States'
                },
                title: 'Punjabi Deli'
            }
        ]);
        cmp.set('v.markersTitle', 'Businesses Near Contact');
    }
});