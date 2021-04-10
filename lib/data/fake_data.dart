import 'package:whatsappclone/models/contacts.dart';
import 'package:faker/faker.dart';

var faker = new Faker();

List<ContactModel> fakeContacts = List.generate(
    60,
    (index) => ContactModel(
        name: faker.person.name(),
        phoneNumber: faker.phoneNumber.us(),
        profilePicUrl: faker.image.image(),
        userStatus: [
          ...List.generate(
            5,
            (index) => Status(
              statusPicUrl: faker.image.image(),
              statusCaption: faker.lorem.sentence(),
              timeAdded: faker.date.time(),
              viewedBy: faker.randomGenerator.integer(20),
            ),
          )
        ],
        messages: [
          ...List.generate(
              20,
              (index) => Message(
                  text: faker.lorem.sentence(),
                  makedAsUnread: faker.randomGenerator.boolean(),
                  wasReceived: faker.randomGenerator.boolean(),
                  wasSent: faker.randomGenerator.boolean(),
                  receivedFrom: faker.internet.userName()))
        ],
        lastSeen: faker.date.time()));
