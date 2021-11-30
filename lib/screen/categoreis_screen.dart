import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_basic/model/contact_data_model.dart';
import 'package:watchlist_basic/repository/contactsrespository.dart';
import 'package:watchlist_basic/widget/contact_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  ContactsRespository repo = ContactsRespository();
  List<Contact> contactdata = [];
  @override
  void initState() {
    super.initState();
    repo.getContacts().then((contacts) {
      setState(() {
        contactdata = contacts;
      });
    });
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
              itemCount: contactdata.length,
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
