import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference chatRef 
    = FirebaseFirestore.instance.collection('messages');

DocumentReference chatDocRef 
    = chatRef.doc();