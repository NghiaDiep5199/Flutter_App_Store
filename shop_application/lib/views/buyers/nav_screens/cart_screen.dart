import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/provider/cart_provider.dart';
import 'package:shop_application/views/buyers/inner_screens/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade900,
                Colors.blue,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(
          'Cart Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _cartProvider.removeAllItem();
            },
            icon: Icon(
              CupertinoIcons.delete,
            ),
          ),
        ],
      ),
      body: _cartProvider.getCartItem.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: _cartProvider.getCartItem.length,
              itemBuilder: (context, index) {
                final cartData =
                    _cartProvider.getCartItem.values.toList()[index];
                return Card(
                  child: SizedBox(
                    height: 170,
                    child: Row(children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(cartData.imageUrl[0]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartData.productName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$ ' + cartData.price.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade900,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: null,
                              child: Text(cartData.productSize),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.yellow.shade900,
                                        Colors.blue,
                                      ],
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: cartData.quantity == 1
                                            ? null
                                            : () {
                                                _cartProvider
                                                    .decreament(cartData);
                                              },
                                        icon: Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        cartData.quantity.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: cartData.productQuantity ==
                                                cartData.quantity
                                            ? null
                                            : () {
                                                _cartProvider
                                                    .increament(cartData);
                                              },
                                        icon: Icon(
                                          CupertinoIcons.plus,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _cartProvider.removeItem(
                                      cartData.productId,
                                    );
                                  },
                                  icon: Icon(
                                    CupertinoIcons.cart_badge_minus,
                                    size: 30,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your shopping cart is empty',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade900,
                          Colors.blue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'CONTINUE SHOPPING',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(14.0),
        child: InkWell(
          onTap: _cartProvider.totalPrice == 0.00
              ? null
              : () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CheckoutScreen();
                  }));
                },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: _cartProvider.totalPrice == 0.00
                  ? LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                    )
                  : LinearGradient(
                      colors: [
                        Colors.yellow.shade900,
                        Colors.blue,
                      ],
                    ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '\$ ' +
                    _cartProvider.totalPrice.toStringAsFixed(2) +
                    '   ' +
                    'CHECKOUT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
