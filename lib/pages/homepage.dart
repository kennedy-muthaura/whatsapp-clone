import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constants.dart';
import 'package:whatsappclone/data/fake_data.dart';
import 'package:whatsappclone/models/contacts.dart';
import 'package:whatsappclone/pages/contact_detail_page.dart';
import 'package:whatsappclone/pages/contacts_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:whatsappclone/pages/profile_pic_page.dart';

import 'widgets/status_page_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBody = 1;
  bool _showSearchBar = true;

  void scrollToNextPage() {
    if (_selectedBody > 0) {
      setState(() {
        _selectedBody--;
      });
    }
  }

  void scrollToPreviosPage() {
    if (_selectedBody < 4) {
      setState(() {
        _selectedBody++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _bodyWidgets = [
      Text('camera page').sliverBox,
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          ContactModel contact = fakeContacts[index];
          bool _receivedBool = Random().nextBool();

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                width: 250,
                                margin: EdgeInsets.only(top: 90),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePicPage(contact)));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 300,
                                            child: Image.network(
                                              contact.profilePicUrl,
                                              fit: BoxFit.cover,
                                              width: 250,
                                            ),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 5,
                                              child: Text(
                                                contact.name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ContactDetailPage(
                                                    contact: contact,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.message,
                                              color: kTealDarkGreen,
                                              size: 25,
                                            ),
                                          ),
                                          Icon(
                                            Icons.phone,
                                            color: kTealDarkGreen,
                                            size: 25,
                                          ),
                                          Icon(
                                            Icons.live_tv,
                                            color: kTealDarkGreen,
                                            size: 25,
                                          ),
                                          Icon(
                                            Icons.notification_important,
                                            color: kTealDarkGreen,
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(contact.profilePicUrl),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Material(
                        child: InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ContactDetailPage(
                                  contact: contact,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    child: Stack(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: _receivedBool
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 15,
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 0,
                                          child: Icon(
                                            Icons.check,
                                            color: _receivedBool
                                                ? Colors.blue
                                                : Colors.grey,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      contact.messages.last.text,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(contact.userStatus.last.timeAdded.split(" ")[0])
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Divider(
                  indent: 40,
                )
              ],
            ),
          );
        }, childCount: fakeContacts.length - 15),
      ),
      StatusPageWidget(
        moveNextPage: scrollToNextPage,
        movePreviosPage: scrollToPreviosPage,
      ),
      Text('calls page').sliverBox,
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: _showSearchBar ? null : Colors.white,
                pinned: true,
                floating: true,
                title: Row(
                  children: [
                    Text(
                      "WhatsApp",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: _showSearchBar ? null : Colors.black,
                          letterSpacing: 0.5),
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
                    child: PopupMenuButton(
                      elevation: 10,
                      offset: Offset(20, 40),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('New group'),
                        ),
                        PopupMenuItem(
                          child: Text('New broadcast'),
                        ),
                        PopupMenuItem(
                          child: Text('Whatsapp web'),
                        ),
                        PopupMenuItem(
                          child: Text('Starred Messages '),
                        ),
                        PopupMenuItem(
                          child: Text('Settings '),
                        ),
                      ],
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size(context.width, 40),
                  child: Row(
                    children: [
                      MaterialButton(
                        splashColor: Colors.grey,
                        onPressed: () {
                          setState(() {
                            _selectedBody = 0;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: _selectedBody == 0
                                    ? BorderSide(
                                        color: Colors.white70, width: 4)
                                    : BorderSide.none,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.camera_alt,
                                color: _selectedBody == 0
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            )),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            splashColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _selectedBody = 1;
                              });
                            },
                            child: Container(
                                width: context.width * 0.25,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: _selectedBody == 1
                                        ? BorderSide(
                                            color: Colors.white70, width: 4)
                                        : BorderSide.none,
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 30),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      'Chats'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _selectedBody == 1
                                              ? Colors.white
                                              : Colors.grey.shade500,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                )),
                          ),
                          MaterialButton(
                            splashColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _selectedBody = 2;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: _selectedBody == 2
                                        ? BorderSide(
                                            color: Colors.white70, width: 4)
                                        : BorderSide.none,
                                  ),
                                ),
                                width: context.width * 0.25,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    'Status'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: _selectedBody == 2
                                            ? Colors.white
                                            : Colors.grey.shade500,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ))),
                          ),
                          MaterialButton(
                            splashColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _selectedBody = 3;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: _selectedBody == 3
                                        ? BorderSide(
                                            color: Colors.white70, width: 4)
                                        : BorderSide.none,
                                  ),
                                ),
                                width: context.width * 0.25,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    'Calls'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: _selectedBody == 3
                                            ? Colors.white
                                            : Colors.grey.shade500,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ))),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              _bodyWidgets[_selectedBody]
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kLightGreen,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ContactsPage(),
            ));
          },
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
