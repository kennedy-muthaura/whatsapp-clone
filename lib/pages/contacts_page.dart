import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:whatsappclone/constants.dart';
import 'package:whatsappclone/data/fake_data.dart';
import 'package:whatsappclone/models/contacts.dart';

import 'contact_detail_page.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  bool _showSearchBar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: _showSearchBar ? 10 : 10,
              leading: BackButton(
                color: _showSearchBar ? null : Colors.black,
              ),
              backgroundColor: !_showSearchBar ? Colors.white : null,
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Contact',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${fakeContacts.length} contacts',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SlideInRight(
                      duration: Duration(seconds: 2),
                      child: Offstage(
                        offstage: _showSearchBar,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search contact",
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 20),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: !_showSearchBar ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _showSearchBar = !_showSearchBar;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: !_showSearchBar ? Colors.black : Colors.white,
                      ),
                      onPressed: () {}),
                )
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: kLightGreen,
                  child: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'New group',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: kLightGreen,
                  child: Icon(
                    Icons.people_outline,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'New group',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                trailing: Icon(
                  Icons.qr_code,
                  color: Colors.green,
                ),
              )
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              ContactModel contact = fakeContacts[index];
              return MaterialButton(
                splashColor: Colors.grey,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactDetailPage(
                            contact: contact,
                          )));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.profilePicUrl),
                  ),
                  title: Text(
                    contact.name,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    faker.lorem.sentence(),
                  ),
                ),
              );
            }, childCount: fakeContacts.length))
          ],
        ),
      ),
    );
  }
}
