# iTunes-Applications-Viewer-2
An iOS application to view iTunes applications and their details for each category.

# Description
Data for the iTunes applications is fetched from an api (http://dev.theappsdr.com/apis/apps.json) ,all communication with the API is performed asynchronously using a child thread.
The list displays a section for each category, and under each category should display the items retreived for that category.Three different types of cell are maintained based on the content of the apps.
All image loading is done asynchronously using SDWebImage library and all HTTP connections are done asynchronously using Alamofire library.

The demo is as foolwing: (https://youtu.be/nq2gM4HKSaE)
