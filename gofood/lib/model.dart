import 'package:flutter/material.dart';

class Food {
  String title;
  String image;
  Food({this.title, this.image});
}

class Layanan {
  String image;
  Color color;
  String title;
  Widget url;

  Layanan({this.image, this.title, this.color, this.url});
}

class Promo {
  String image;
  String title;
  String content;
  String button;

  Promo({this.image, this.title, this.content, this.button});
}
// class Layanan {
//   String image;
//   String label;
//   Color color;
//   String content;
//   String button;

//   Layanan({this.image, this.label, this.color, this.content, this.button});
// }

// class Layanan extends StatelessWidget {
//   final Image image;
//   final IconData icon;
//   final Color iconColor;
//   final String label;

//   const Layanan({Key key, this.icon, this.image, this.iconColor, this.label}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 color: iconColor.withOpacity(.2),
//                 borderRadius: BorderRadius.circular(10.0)),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Icon(
//                 icon,
//                 color: iconColor,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(label),
//         ],
//       ),
//     );
//   }
// }