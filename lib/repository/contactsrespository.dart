import 'dart:convert';
import 'package:watchlist_basic/model/contact_data_model.dart';
import 'package:watchlist_basic/strings.dart';

import '../networking/api_call.dart';

class ContactsRespository {
  final Api_call _provider = Api_call();

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      final response = await _provider.get(Strings.contact_list_url);
      contacts = contactFromJson(response);
      return contacts;
    } catch (Exception) {
      return contacts;
    }
  }
}
