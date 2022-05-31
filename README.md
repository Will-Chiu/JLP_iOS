# JLP iOS Engineer Test

## assumptions
Internet access is required for this application.
iOS 13.0+

## instructions
Once the application is luanched, it will downlaod the json data from API: https://api.johnlewis.com/search/api/rest/v2/catalog/products/search/keyword?q=dishwasher&key=AIzaSyDD_6O5gUgC4tRW5f9kxC0_76XRC8W7_mI
An activity indicator is animating during the download.

Once the product list is downloaded, it will goes to grid page to display dishwasher.
In the meanwhile, application will fetch the product detail in the background for each product. Therefore end-user will have better user experience without waiting for  product detail download.

For each collectionview cell, can go to next page for showing product details.

This application is designed with autolayout, where the compact width and regular width with show different layout design.

A certain level of UI tests are implement on this application, which ensure the major componenets exist and function well.

## Improvement suggests
For further development, offline mode or testing with network mock will be implement afterward.
