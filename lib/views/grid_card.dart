import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  String? productImage;
  String? productName;
  ProductCard(
      {super.key, required this.productImage, required this.productName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color.fromARGB(255, 255, 245, 243),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                width: double.infinity,
                child: Image.asset(
                  productImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(productName!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF954535),
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                IconButton(
                    onPressed: () {
                      SnackBar snakbar = SnackBar(
                        content: Text(" Your item added to the cart✨"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                    },
                    icon: Icon(Icons.add_shopping_cart_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
