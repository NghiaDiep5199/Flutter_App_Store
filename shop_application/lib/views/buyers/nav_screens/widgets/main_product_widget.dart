import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_application/views/buyers/productDetail/product_detail_screen.dart';

class MainProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('approved', isEqualTo: true)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LinearProgressIndicator(
              color: Colors.yellow.shade900,
            ),
          );
        }

        // return Container(
        //   height: 300,
        //   child: ListView.separated(
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context, index) {
        //         final productData = snapshot.data!.docs[index];
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) {
        //               return ProductDetailScreen(
        //                 productData: productData,
        //               );
        //             }));
        //           },
        //           child: Card(
        //             child: Column(
        //               children: [
        //                 Container(
        //                   height: 240,
        //                   width: 190,
        //                   decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                       image: NetworkImage(
        //                         productData['imageUrl'][0],
        //                       ),
        //                       fit: BoxFit.cover,
        //                     ),
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.all(4.0),
        //                   child: Text(
        //                     productData['productName'],
        //                     style: TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //                 Text(
        //                   '\$ ' +
        //                       productData['productPrice'].toStringAsFixed(2),
        //                   style: TextStyle(
        //                     fontSize: 18,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.yellow.shade900,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //       separatorBuilder: (context, _) => SizedBox(
        //             width: 15,
        //           ),
        //       itemCount: snapshot.data!.docs.length),
        // );

        return Container(
          height: 350,
          child: GridView.builder(
              itemCount: snapshot.data!.size,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 200 / 300),
              itemBuilder: (context, index) {
                final productData = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductDetailScreen(
                        productData: productData,
                      );
                    }));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          width: 190,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                productData['imageUrl'][0],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            productData['productName'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '\$ ' +
                              productData['productPrice'].toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
