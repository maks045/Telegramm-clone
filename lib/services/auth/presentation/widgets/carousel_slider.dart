// // import 'package:flutter/material.dart';

// // class CarouselSlider extends StatefulWidget {
// //   const CarouselSlider({
// //     Key? key,
// //     required this.sliderHeight,
// //     required this.images,
// //     this.onTap,
// //   }) : super(key: key);

// //   final double sliderHeight;

// //   final List<String> images;

// //   final VoidCallback? onTap;

// //   @override
// //   State<CarouselSlider> createState() => _CarouselSliderState();
// // }

// // class _CarouselSliderState extends State<CarouselSlider> {
// //   late PageController pageController;
// //   int selectedIndex = 0;

// //   @override
// //   void initState() {
// //     pageController = PageController(initialPage: 0);
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     pageController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: widget.onTap,
// //       child: Column(
// //         mainAxisSize: MainAxisSize.max,
// //         children: [
// //           SizedBox(
// //             height: widget.sliderHeight,
// //             child: PageView.builder(
// //               physics: const BouncingScrollPhysics(),
// //               controller: pageController,
// //               itemCount: widget.images.length,
// //               onPageChanged: (index) {
// //                 setState(() {
// //                   selectedIndex = index;
// //                 });
// //               },
// //               itemBuilder: (context, index) {
// //                 final imageUrl = widget.images.elementAt(index);
// //                 return Padding(
// //                   padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadiusGeometry.circular(17),
// //                     child: Image.asset(
// //                       imageUrl,
// //                       fit: BoxFit.cover,
// //                       width: double.infinity,
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           const SizedBox(height: 5),
// //           SizedBox(
// //             height: 10,
// //             child: ListView.builder(
// //               shrinkWrap: true,
// //               scrollDirection: Axis.horizontal,

// //               itemCount: widget.images.length,
// //               physics: const BouncingScrollPhysics(),
// //               itemBuilder: (context, index) {
// //                 return AnimatedContainer(
// //                   duration: const Duration(milliseconds: 100),
// //                   decoration: BoxDecoration(
// //                     color: Colors.black,
// //                     borderRadius: const BorderRadius.all(Radius.circular(8)),
// //                   ),
// //                   margin: const EdgeInsets.all(5),
// //                   width: 10,
// //                   height: 10,
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class CarouselSlider extends StatefulWidget {
//   const CarouselSlider({
//     Key? key,
//     required this.sliderHeight,
//     required this.images,
//     this.onTap,
//   }) : super(key: key);

//   final double sliderHeight;
//   final List<String> images;
//   final VoidCallback? onTap;

//   @override
//   State<CarouselSlider> createState() => _CarouselSliderState();
// }

// class _CarouselSliderState extends State<CarouselSlider> {
//   late PageController pageController;
//   int selectedIndex = 0;

//   @override
//   void initState() {
//     pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: widget.sliderHeight,
//             child: PageView.builder(
//               physics: const BouncingScrollPhysics(),
//               controller: pageController,
//               itemCount: widget.images.length,
//               onPageChanged: (index) {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 final imageUrl = widget.images[index];
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(widget.images.length, (index) {
//               bool isActive = selectedIndex == index;
//               return AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 width: isActive ? 20 : 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: isActive ? Colors.blueAccent : Colors.grey,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
