import 'package:flutter/material.dart';

// ignore: must_be_immutable
class hotOffersCard extends StatelessWidget {
  String? productImage;
  String? productName;
  hotOffersCard(
      {super.key, required this.productImage, required this.productName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color.fromARGB(255, 255, 245, 243),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: double.infinity,
                  child: Expanded(
                    child: Image.asset(
                      productImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Expanded(
                  child: Text(productName!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF954535),
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
