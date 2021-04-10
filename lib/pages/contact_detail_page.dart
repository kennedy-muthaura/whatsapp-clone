import 'package:flutter/material.dart';
import 'package:whatsappclone/constants.dart';
import 'package:whatsappclone/models/contacts.dart';
import "package:get/get.dart";

class ContactDetailPage extends StatefulWidget {
  final ContactModel contact;

  const ContactDetailPage({Key? key, required this.contact}) : super(key: key);
  @override
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.contact.profilePicUrl),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.contact.name,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.live_tv,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          children: [
                            Text(
                              'start a Video call',
                              style: TextStyle(
                                  color: kTealDarkGreen,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cancel'.toUpperCase(),
                                    style: TextStyle(
                                        color: kTealDarkGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Call'.toUpperCase(),
                                    style: TextStyle(
                                        color: kTealDarkGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          children: [
                            Text(
                              'start a voice call',
                              style: TextStyle(
                                  color: kTealDarkGreen,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cancel'.toUpperCase(),
                                    style: TextStyle(
                                        color: kTealDarkGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Call'.toUpperCase(),
                                    style: TextStyle(
                                        color: kTealDarkGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  width: 8,
                ),
                PopupMenuButton(
                  elevation: 10,
                  offset: Offset(20, 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('View Contact'),
                    ),
                    PopupMenuItem(
                      child: Text('media, links and docs'),
                    ),
                    PopupMenuItem(
                      child: Text('mute notifications'),
                    ),
                    PopupMenuItem(
                      child: Text('Wallpaper '),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text('more'),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Text('this is the messages part'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
