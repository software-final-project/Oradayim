import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<(bool, String)> register({
    required String email,
    required String password,
    required String name,
    required String surname,
  }) async {
    try {
      // Firebase Auth ile kullanıcı oluştur
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firestore'a kullanıcı bilgilerini kaydet
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'surname': surname,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return (true, 'Kayıt işlemi başarılı');
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Bu e-posta adresi zaten kullanımda';
          break;
        case 'invalid-email':
          message = 'Geçersiz e-posta adresi';
          break;
        case 'operation-not-allowed':
          message = 'E-posta/şifre girişi etkin değil';
          break;
        case 'weak-password':
          message = 'Şifre çok zayıf';
          break;
        default:
          message = 'Bir hata oluştu: ${e.message}';
      }
      return (false, message);
    } catch (e) {
      return (false, 'Beklenmeyen bir hata oluştu: $e');
    }
  }

  Future<(bool, String)> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return (true, 'Giriş başarılı');
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'Kullanıcı bulunamadı';
          break;
        case 'wrong-password':
          message = 'Hatalı şifre';
          break;
        case 'invalid-email':
          message = 'Geçersiz e-posta adresi';
          break;
        case 'user-disabled':
          message = 'Kullanıcı hesabı devre dışı';
          break;
        default:
          message = 'Bir hata oluştu: ${e.message}';
      }
      return (false, message);
    } catch (e) {
      return (false, 'Beklenmeyen bir hata oluştu: $e');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
} 