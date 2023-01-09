// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _title = TextEditingController();
//   final TextEditingController _description = TextEditingController();
//   CollectionReference userCollection =
//   FirebaseFirestore.instance.collection('user');
//   bool isLoading = false;
//
//   File? image;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ShowData(),
//                   ));
//             },
//             icon: Icon(Icons.account_circle_rounded))
//       ]),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: SingleChildScrollView(
//           child: Column(children: [
//             Container(
//               height: MediaQuery.of(context).size.width / 2,
//               width: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey[400],
//               ),
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   image == null
//                       ? SizedBox()
//                       : Image.file(image!, fit: BoxFit.cover),
//                   Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: IconButton(
//                           onPressed: () async {
//                             final ImagePicker _picker = ImagePicker();
//                             final XFile? image = await _picker.pickImage(
//                                 source: ImageSource.gallery, imageQuality: 20);
//                             this.image = File(image!.path);
//                             setState(() {});
//                           },
//                           icon: Icon(Icons.camera))),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _title,
//               decoration: InputDecoration(
//                 hintText: "Title",
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.green,
//                     )),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.green,
//                     )),
//                 errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.red,
//                     )),
//                 focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.red,
//                     )),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _description,
//               decoration: InputDecoration(
//                 hintText: "Description",
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.green,
//                     )),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.green,
//                     )),
//                 errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.red,
//                     )),
//                 focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(
//                       color: Colors.red,
//                     )),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             MaterialButton(
//               onPressed: () async {
//                 createpost(image!);
//               },
//               height: 55,
//               minWidth: 300,
//               color: Colors.indigo,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 "Save",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
//
//   Future<void> createpost(FileImage) async {
//     var uploadresponse = await FirebaseStorage.instance
//         .ref()
//         .child('userPost')
//         .child('${_title.text}.jpg')
//         .putFile(
//       this.image!,
//     )
//         .then((p0) async {
//       String postimageurl = await p0.ref.getDownloadURL();
//       Map<String, dynamic> post = {
//         'image': postimageurl,
//         "title": _title.text,
//         "description": _description.text,
//       };
//       _title.clear();
//       _description.clear();
//       image = null;
//       Get.snackbar(
//         "",
//         "Saved!...",
//         icon: Icon(Icons.person, color: Colors.white),
//         snackPosition: SnackPosition.TOP,
//       );
//       FirebaseFirestore.instance.collection('user').add(post);
//     });
//   }
// }
//
// class ShowData extends StatefulWidget {
//   const ShowData({Key? key}) : super(key: key);
//
//   @override
//   State<ShowData> createState() => _ShowDataState();
// }
//
// class _ShowDataState extends State<ShowData> {
//   CollectionReference userCollection =
//   FirebaseFirestore.instance.collection("user");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: userCollection.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Something Wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: Text("Loading.."));
//           }
//
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               print('${index} ${snapshot.data!.docs[index]['image']}');
//
//               return ListTile(
//                 title: Text(snapshot.data!.docs[index]['title']),
//                 leading: Container(
//                   height: 100,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.indigo,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Image.network(snapshot.data!.docs[index]['image'],
//                       fit: BoxFit.fill),
//                 ),
//                 subtitle: Text(snapshot.data!.docs[index]['description']),
//                 trailing: IconButton(
//                     onPressed: () {
//                       userCollection
//                           .doc(snapshot.data!.docs[index].id)
//                           .delete()
//                           .then((value) => ScaffoldMessenger.of(context)
//                           .showSnackBar(
//                           SnackBar(content: Text("Deleted!.."))));
//                     },
//                     icon: Icon(Icons.delete)),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
