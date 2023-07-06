// import 'package:flutter/material.dart';

// class CardContainer extends StatelessWidget {
//   const CardContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  ClipPath(
//                       clipper: CardClipper(),
//                       child: Container(
//                         color:(card=='w')? Colors.green:(card=='L')?Colors.red:Colors.grey,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: AppSizes.newSize(0.15),
//                               horizontal: AppSizes.newSize(0.4)),
//                           child: Text(
//                             "w",
//                             style: TextStyle(
//                                 fontSize: AppSizes.size14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//   }
// }