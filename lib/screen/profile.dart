
// import 'package:flutter/material.dart';
// import 'package:nailroom/model/profile.dart';
// import 'package:nailroom/repository/userrepository.dart';
// import 'package:nailroom/utils/url.dart';
// import 'bottomnav.dart';
// import 'package:google_fonts/google_fonts.dart';




// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   UserProfile? user;
//   @override
//   void initState() {
//     getUserDetails();
//     super.initState();
//   }

//   void getUserDetails() async {
//     UserProfile? user1 = await UserRepository().getUserDetails();

//     setState(() {
//       user = user1!;
//       debugPrint(user!.Address.toString());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           elevation: 1,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.orange,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const BottomNav()),
//               );
//             },
//           ),
//           actions: const [],
//         ),
//         body: Container(
//           padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
//           child: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).unfocus();
//             },
//             child: ListView(
//               children: [
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Center(
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: 130,
//                         height: 130,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 4,
//                                 color:
//                                     Theme.of(context).scaffoldBackgroundColor),
//                             boxShadow: [
//                               BoxShadow(
//                                   spreadRadius: 2,
//                                   blurRadius: 10,
//                                   color: Colors.black.withOpacity(0.1),
//                                   offset: const Offset(0, 10))
//                             ],
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(
//                                   "$baseUrl${user!.image!}",
//                                 ))),
//                       ),
//                       Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 width: 4,
//                                 color:
//                                     Theme.of(context).scaffoldBackgroundColor,
//                               ),
//                               color: Colors.orange,
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => EditProfile()),
//                                 );
//                               },
//                               child: const Icon(
//                                 Icons.edit,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Text(
//                         "Email : ${user!.Email!}",
//                         style: GoogleFonts.robotoCondensed(
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Text(
//                         "Name : ${user!.Username}",
//                         style: GoogleFonts.robotoCondensed(
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Text(
//                         "Phone : ${user!.phone}",
//                         style: GoogleFonts.robotoCondensed(
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(children: [
//                     InkWell(
//                       onTap: () {},
//                       child: Text(
//                         "Address : ${user!.Address}",
//                         style: GoogleFonts.robotoCondensed(
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: MaterialButton(
//                       minWidth: double.infinity,
//                       height: 40,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LandingPage()),
//                         );
//                       },
//                       color: Colors.orange,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           side: const BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(50)),
//                       child: const Text("Sign Out",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                             color: Colors.white,
//                           )),
//                     ))
//               ],
//             ),
//           ),
//         ));
//   }
// }