// import 'package:flutter/material.dart';
//
// class ModalProgressHUD extends StatelessWidget {
//   final bool isAsyncCall;
//   final Widget progessIndicator;
//   final Widget child;
//
//   const ModalProgressHUD({
//     Key? key,
//     required this.isAsyncCall,
//     required this.progessIndicator,
//     required this.child,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         if(isAsyncCall)
//           const Scaffold(
//             body: Opacity(opacity: 0.8, child: ModalBarrier(color: Colors.grey, dismissible: false,),),
//           ),
//
//       ],
//     );
//   }
// }
