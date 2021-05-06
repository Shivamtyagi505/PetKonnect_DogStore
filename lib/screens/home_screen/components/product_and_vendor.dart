import 'package:flutter/material.dart';

class ProductAndVendor extends StatelessWidget {
  final String img;
  final String title;
  final String price;
  final String picedesc;
  final String category;

  const ProductAndVendor(
      {@required this.title,
      @required this.img,
      @required this.category,
      @required this.price,
      @required this.picedesc});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            img,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/ui/star_filled@2x.png'),
                    Image.asset('assets/ui/star_filled@2x.png'),
                    Image.asset('assets/ui/star_filled@2x.png'),
                    Image.asset('assets/ui/star_filled@2x.png'),
                    Image.asset('assets/ui/star_filled@2x.png')
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  category,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.red[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        "  " + picedesc,
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
