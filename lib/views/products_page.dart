import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shopping_app/views/grid_card.dart';
import 'package:shopping_app/views/horizontalCards.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/views/profile.dart';

class MyProductCard extends StatefulWidget {
  const MyProductCard({super.key});

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  late LocalAuthentication auth;
  bool _supportState = false;

  List<ProductCard> GridList = [
    ProductCard(
        productImage: "assets/images/Bag1.jpg", productName: "Product 1"),
    ProductCard(
        productImage: "assets/images/Bag3.jpg", productName: "Product 2"),
    ProductCard(
        productImage: "assets/images/Bag7.jpg", productName: "Product 3"),
    ProductCard(
        productImage: "assets/images/Bag2.jpg", productName: "Product 4"),
    ProductCard(
        productImage: "assets/images/img4.jpg", productName: "Product 5"),
    ProductCard(
        productImage: "assets/images/img2.jpg", productName: "Product 6"),
    ProductCard(
        productImage: "assets/images/Bag6.jpg", productName: "Product 7"),
  ];
  List<dynamic> hotOfferList = [
    hotOffersCard(
        productImage: "assets/images/Bag4.jpg", productName: "Product 1"),
    hotOffersCard(
        productImage: "assets/images/Bag5.jpg", productName: "Product 2"),
    hotOffersCard(
        productImage: "assets/images/img1.jpg", productName: "Product 3"),
    hotOffersCard(
        productImage: "assets/images/Bag3.jpg", productName: "Product 4"),
    hotOffersCard(
        productImage: "assets/images/Bag8.jpg", productName: "Product 5"),
    hotOffersCard(
        productImage: "assets/images/img5.jpg", productName: "Product 6")
  ];

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    bool isSupported = await auth.isDeviceSupported();
    setState(() {
      _supportState = isSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Shoes and Bags",
            style: TextStyle(
                color: Color(0xFF954535),
                fontSize: 25,
                fontWeight: FontWeight.w200),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () => _getAvailableBiometric(),
                child: ClipOval(
                  child: Container(
                    height: 40,
                    width: 40,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: Image.network(
                      'https://thumbs.dreamstime.com/b/spirited-alone-girl-traveler-view-trip-generate-ai-generated-313524371.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "our products",
                style: TextStyle(
                    color: Color(0xFF954535),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              _listProduct(context),
              Text(
                "Hot Offers",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 42, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              _listOffers(context),
            ],
          ),
        ));
  }

  Widget _listOffers(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 10.0, right: 10, bottom: 50),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: hotOfferList.length,
              itemBuilder: (context, index) {
                return hotOfferList[index];
              }),
        ));
  }

  Future<void> _getAvailableBiometric() async {
    try {
      bool authenticated = await auth.authenticate(
          localizedReason: "Authenticate to access your profile",
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: false,
          ));
      if (authenticated) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    } on PlatformException catch (e) {
      print("Authentication error: $e");
    }
  }

  Widget _listProduct(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: GridList.length,
            itemBuilder: (BuildContext context, int index) {
              return GridList[index];
            }),
      ),
    );
  }
}
