import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Koleksiyon adlarını temsil eden enum
enum FirebaseCollection {
  business,
  categories,
  chatRooms,
  users,
  mayors,
  products,
  messages,
  checkIns,
  ownCategories,
}

class FirebaseService {
  FirebaseService._();

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static final FirebaseFirestore firebaseCloudStore = FirebaseFirestore.instance;

  // FirebaseCollection enum değerlerini doğrudan string'e dönüştürme
  static String _getCollectionName(FirebaseCollection collection) {
    return collection.toString().split('.').last; // Enum'dan string değer alır
  }

  // FirebaseCollection enum ile koleksiyona erişim
  static CollectionReference collection(FirebaseCollection collection) {
    return firebaseCloudStore.collection(_getCollectionName(collection));
  }
}
