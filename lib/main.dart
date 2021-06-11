import 'import.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.dark,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.cyan),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          //primaryColor: Color.fromARGB(255, 16, 23, 39),
          //scaffoldBackgroundColor: Color.fromARGB(255, 12, 18, 33),
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          accentColor: Color.fromARGB(255, 0, 198, 225)),
      home: MainScreen(),
    ));

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Contact> contacts;
  int contactindex = 0;
  Widget rightpanelscreen;
  Contact currentlyselectedcontact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallcontacts();
  }

  /// Delete the [contact] provided.
  void deletecontact(Contact contact) async {
    print('deleting contact: ${contact.displayName}');
    await ContactsService.deleteContact(contact);
    print('Deleteed: ${contact.displayName}');
    if (Responsive.ismobil(context)) {
      Navigator.pop(context);
      getallcontacts();
    } else {
      getallcontacts();
    }
  }

  /// navigates the [rightpanelscreen] to whatever [page] you provide.
  void navigate(Widget page) {
    print('Navigating');
    rightpanelscreen = page;
    setState(() {
      print('Navigation success');
    });
  }

  /// sets the selected contact index (only on tablet)
  void setindex(int index, Contact contact) {
    contactindex = index;
    currentlyselectedcontact = contact;
    rightpanelscreen = ContactInfoPage(
      contactinfo: currentlyselectedcontact,
      ondeletetapped: () {
        deletecontact(currentlyselectedcontact);
      },
    );
    setState(() {
      print(
          'Contact index: $index contact name is ${currentlyselectedcontact.displayName}');
    });
  }

  /// what page and contact the right panel should display at startup (only for tablets)
  void setinitcontact() {
    print('Your screen size: ${MediaQuery.of(context).size}');
    currentlyselectedcontact = contacts[0];
    rightpanelscreen = ContactInfoPage(
      contactinfo: currentlyselectedcontact,
      ondeletetapped: (Contact contact) {
        deletecontact(currentlyselectedcontact);
      },
    );
    print('set init contact name is: ${currentlyselectedcontact.displayName}');
  }

  /// get contacts
  ///
  /// gets all contacts on device if permission denied or error prints error msg
  /// if succesfull prints the first contact on device
  void getallcontacts() async {
    print('Getting Contacts');
    Iterable contact = await ContactsService.getContacts();
    contacts = contact.toList();
    contacts.length > 0 ? setinitcontact() : print('ERROR: no contacts');
    contacts.length > 0
        ? print(
            'Getting Contacts finished the first contact is: ${contacts.first.displayName} and the last contact is: ${contacts.last.displayName}')
        : print(
            'ERROR: contact list length = 0, no contacts or permission denied');
    setState(() {
      print('Getting contacts completed succesfully, Setting State');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Responsive(
          mobile: ContactsListPage(
            contacts: contacts,
            oncontacttapped: (int inde, Contact currentcontact) {
              currentlyselectedcontact = currentcontact;
              var route = MaterialPageRoute(
                  builder: (BuildContext) => ContactInfoPage(
                        contactinfo: currentlyselectedcontact,
                        ondeletetapped: () {
                          deletecontact(currentlyselectedcontact);
                        },
                      ));
              Navigator.of(context).push(route);
            },
          ),
          tablet: Row(
            children: [
              Expanded(
                child: ContactsListPage(
                    addcontacttapped: () {
                      navigate(AddContactPage(
                        onbacktapped: () {
                          navigate(ContactInfoPage(
                            contactinfo: currentlyselectedcontact,
                          ));
                        },
                      ));
                    },
                    contacts: contacts,
                    selectenindex: contactindex,
                    oncontacttapped: (int currentindex, Contact contact) {
                      setindex(currentindex, contact);
                    }),
                flex: 1,
              ),
              VerticalDivider(
                thickness: 1.0,
                width: 1.0,
              ),
              Expanded(
                // right panel screen is what is shown on the right side of the screen (only on tablets)
                // default should be [ContactInfoScreen()]
                child: rightpanelscreen != null ? rightpanelscreen : SizedBox(),
                flex: 2,
              ),
            ],
          ),
        ),
        // this only appers on mobile
        floatingActionButton: Responsive.ismobil(context)
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  var route = MaterialPageRoute(
                      builder: (BuildContext) => AddContactPage());
                  Navigator.of(context).push(route);
                },
              )
            : SizedBox.shrink());
  }
}
