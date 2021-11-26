import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:watchlist_basic/model/contact_data_model.dart';
import 'package:watchlist_basic/strings.dart';
import 'package:watchlist_basic/widget/contact_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  List<Contact> contactdata = [];
  Future<void> fetchAlbum() async {
    final response = await http.get(Uri.parse(Strings.contact_list_url));
    try {
      this.setState(() {
        contactdata = contactFromJson(response.body);
      });

      debugPrint(contactdata[1].name);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: ListView.builder(
              itemCount: contactdata.length == null ? 0 : contactdata.length,
              itemBuilder: (
                BuildContext context,
                int i,
              ) {
                return userList(context, i, contactdata);
              }),
        ),
      ),
    ));
  }
}
