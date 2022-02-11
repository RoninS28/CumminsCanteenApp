import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopping_getx_flutter/models/product.dart';

class ProductController extends GetxController {
  List<Product> _items = [
    Product(
        id: 1,
        productTitle: 'Poha',
        description:
        'Awesome breakfast!!',
        price: 20.00,
        imageUrl:
        'https://www.indianhealthyrecipes.com/wp-content/uploads/2021/11/poha.jpg'),
    Product(
        id: 2,
        productTitle: 'Cold coffee',
        description:
        'Chill Coffee!',
        price: 30.00,
        imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxcJuClELxjlYWRY6rEuef613eGbURb2z25g&usqp=CAU'),
    Product(
        id: 3,
        productTitle: 'Sanwitch',
        description:
        'Yummy Sandwitches!!',
        price: 50.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwEsdlfLkn-IKYqmc6lcGYSyoSq_Me8li0OA&usqp=CAU'),
    Product(
        id: 4,
        productTitle: 'Upama',
        description:
        'Healthy Breakfast!',
        price: 20.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Br_dsrONxGyr3yT18x4G83nU-mgKcuMLag&usqp=CAU'),
    Product(
        id: 5,
        productTitle: 'Chai',
        description:
        'Tea!!',
        price: 10.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvQ14NidxGh-tlRxuvvj0Q-T3DHKLzmhKlgQ&usqp=CAU'),
    Product(
        id: 6,
        productTitle: 'Fruits',
        description: 'Refreshing fruits',
        price: 60.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcIOXC_wlytlcfdCT3FjsUTgF6kyUq0AZCPg&usqp=CAU'),
    Product(
        id: 7,
        productTitle: 'Idli',
        description:
        'Healthy South Indian Food',
        price: 30.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxDhn6Hgxi12i5T1qOgjVqwkhZzpFMK-3dFQ&usqp=CAU'),
    Product(
        id: 8,
        productTitle: 'Noodles',
        description: 'Chinese!!',
        price: 40.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1W9khtkhBIIHfIBte5xJIMgjboWOKJh38GQ&usqp=CAU'),
    Product(
        id: 9,
        productTitle: 'Juice',
        description: 'Cool,Refreshing',
        price: 30.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv26XcoVrFGulJWCBrSleZXWnIuECZn4uxew&usqp=CAU'),
    Product(
        id: 10,
        productTitle: 'Dosa',
        description: 'South Yummy Dosa',
        price: 40.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9odndVnP6vTp5qkCQ-7dJp_RnRVov_KYz1w&usqp=CAU'),
    Product(
        id: 11,
        productTitle: 'Samosa',
        description: 'Tastyyy!!',
        price: 15.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO1AOJq9wESSp6EephnO3YWWE-3qMdeRUBoA&usqp=CAU'),
    Product(
        id: 12,
        productTitle: 'Vada Pav',
        description: 'Puneri Vada pav',
        price: 15.00,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR307ID3Akw3TNWl4MMidxpS6fqhg9N1mtEYQ&usqp=CAU'),

  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((productItem) => productItem.isFavourite).toList();
  }

  Product findProductById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void toggleFavouriteStatus(int id) {
    items[id].isFavourite = !items[id].isFavourite;
    update();
  }
}