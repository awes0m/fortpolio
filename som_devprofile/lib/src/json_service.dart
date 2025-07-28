import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class JSONService extends ChangeNotifier {
  static late final String _json;
  static late final Map<String, dynamic> _response;
  static bool _hasLoaded = false;
  static JSONService? _instance;

  // Singleton pattern for better memory management
  static JSONService get instance {
    _instance ??= JSONService._internal();
    return _instance!;
  }

  JSONService._internal();

  // Getter methods for better encapsulation
  static bool get hasLoaded => _hasLoaded;
  static Map<String, dynamic> get response => _response;

  Future<void> init() async {
    if (_hasLoaded) return; // Prevent multiple initializations

    try {
      _json = await rootBundle.loadString('assets/portfolio.json');
      _response = jsonDecode(_json);
      _hasLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading portfolio data: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// Use singleton instance
JSONService jsonService = JSONService.instance;
