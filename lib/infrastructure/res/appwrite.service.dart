import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static AppwriteService instance = appwriteService;
  final Client client;
  AppwriteService() : client = Client() {
    client
        .setEndpoint('http://localhost:98/v1')
        .setProject('642d69ef1c5311eee829');
  }
}

final appwriteService = AppwriteService();
