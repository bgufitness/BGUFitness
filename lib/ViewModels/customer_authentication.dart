import 'package:bgmfitness/ViewModels/vendor_authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/Messenger Models/chat_user.dart';

Future customer_signup(
    {String email = '', String password = '', String name = ''}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  var customerid = FirebaseAuth.instance.currentUser!.uid;

  var record = FirebaseFirestore.instance.collection('Customers').doc(customerid);
  record.set({'Name': name, 'Email': email, 'Role': 'Customer'});

  record = FirebaseFirestore.instance.collection('Accounts').doc(customerid);
  record.set({'Name': name, 'Email': email, 'Role': 'Customer'});

  await createUser(name);
}

Future<void> createUser(String username) async {
  final time = DateTime.now().millisecondsSinceEpoch.toString();

  final chatUser = ChatUser(
    id: user.uid,
    name: username,
    email: user.email.toString(),
    about: "Hey, I'm using BGU Fitness",
    image: user.photoURL.toString(),
    createdAt: time,
    isOnline: false,
    lastActive: time,
  );

  return await FirebaseFirestore.instance.collection('Accounts').doc(user.uid)
      .update(chatUser.toJson());
}
