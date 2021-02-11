///The model that holds data for coffee cards
class coffeeCardModel{
  String imgPath;
  String coffeeName;
  String shopName;
  String description;
  String price;
  bool isFavorite;

  ///Purpose: Store the data so we can put it into a list and run it through a for loop
  ///Input: @imgPath finds the image to show
  ///       @coffeeName name of the coffee
  ///       @shopName name of the shop the coffee is made at
  ///       @description describes the coffee
  ///       @price gives price of the coffee
  ///       @isFavorite checks if the user has favorite the coffee
  /// Return: coffeeCardModel used to store all the data together
  coffeeCardModel(String imgPath, String coffeeName, String shopName, String description, String price, bool isFavorite){
    this.imgPath = imgPath;
    this.coffeeName = coffeeName;
    this.shopName = shopName;
    this.description = description;
    this.price = price;
    this.isFavorite = isFavorite;
  }
}