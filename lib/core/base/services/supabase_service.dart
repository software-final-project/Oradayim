import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oradayim/core/base/init/config/app_environment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;
class SupabaseService {
  static const String supaBaseUrl = 'https://fkfuxqizksdnxkkgjkvt.supabase.co';
  static String supaBaseAnonKey = AppEnvironmentItems.baseUrl.value;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supaBaseUrl,
      anonKey: supaBaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}


class StorageService {
  static Future<String> uploadFile(String bucketName, File file) async {
    if (!file.existsSync()) {
      throw Exception('Dosya bulunamadı: ${file.path}');
    }

    final filePath = path.basename(file.path); // Dosya adını al

    try {
      // Dosyayı Supabase Storage'a yükle
      final response = await SupabaseService.client.storage.from(bucketName).upload(
        filePath,
        file,

      );

      if (response.isEmpty) {
        throw Exception('Dosya yükleme başarısız oldu, yanıt boş.');
      }

      // Public URL oluştur
      final publicUrl = SupabaseService.client.storage.from(bucketName).getPublicUrl(response);

      if (publicUrl.isEmpty) {
        throw Exception('Public URL oluşturulamadı.');
      }

      debugPrint('Dosya başarıyla yüklendi. Public URL: $publicUrl');
      return publicUrl;
    } catch (e) {
      debugPrint('Hata: $e');
      rethrow;
    }
  }
}
