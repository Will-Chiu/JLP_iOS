# JLP iOS Engineer Test

## Assumptions
Internet access is required for this application.
iOS 13.0+

## Instructions
Once the application is luanched, it will downlaod the json data from API: https://api.johnlewis.com/search/api/rest/v2/catalog/products/search/keyword?q=dishwasher&key=AIzaSyDD_6O5gUgC4tRW5f9kxC0_76XRC8W7_mI

An activity indicator is animating during the download.

Once the product list download is completed, it will show dishwashers in grid display.
In the meanwhile, application will fetch the product detail in the background for each product:
https://api.johnlewis.com/mobile-apps/api/v1/products/{productId}

Therefore end-user will have better user experience, without a waiting gap between the view controller transition.

Each collectionview cell is clickable and goes to the page of product details

This application is designed with autolayout, where the compact width and regular width showes different layout designs.

A certain level of UI tests are implementeded on this application, which ensure the major componenets exist and function well.

## Improvement suggests
For further development, offline mode or testing with network mock will be implement afterward.



## Screen catures
### CollectionView Page
![CollectionView](/JLP%20screen1.jpg)

### ProductDetail Page
![ProductDetail](/JLP%20screen2.jpg)

