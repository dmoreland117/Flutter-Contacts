import 'package:contactsapp/import.dart';

class AddContactPage extends StatefulWidget {
  Function onbacktapped;

  AddContactPage({this.onbacktapped});
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

// TODO: add name textfields
// TODO: add phone numberfields
// TODO: add the rest lol
class _AddContactPageState extends State<AddContactPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phonenum1;
  TextEditingController phonenum2;
  //TextEditingController phonename1;
  //TextEditingController phonename2;

  void addcontact(String givenname, String familyname) {
    Contact cntact = Contact(givenName: givenname, familyName: familyname);
    ContactsService.addContact(cntact);
    widget.onbacktapped();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          AddContactsAppbar(
            onsavetapped: () {
              print(firstname.text);
              addcontact(firstname.text, lastname.text);
            },
            onbacktapped: widget.onbacktapped,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.istablet(context) ? 100.0 : 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  // circle icon thing at top of screen
                  CircleIconButton(
                    icon: Icons.person_outline,
                    radious: 100.0,
                    iconsize: 50.0,
                    color: Theme.of(context).accentColor,
                    outlined: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // add image button
                  RoundedIconButton(
                    width: 120.0,
                    hight: 35.0,
                    icon: Icons.add_a_photo_outlined,
                    color: Theme.of(context).accentColor,
                    label: 'Add Image',
                    ontap: () {},
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // first/lastname textfields
                  Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: firstname,
                          decoration: InputDecoration(
                              labelText: 'First Name',
                              border: OutlineInputBorder()),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: TextField(
                          controller: lastname,
                          decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder()),
                        )),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  // phone 1
                  Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextField(
                              controller: phonenum1,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.phone_outlined),
                                  labelText: 'Phone Number 1',
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        // Expanded(
                        //     child: TextField(
                        //   controller: phonename1,
                        //   decoration: InputDecoration(
                        //       labelText: 'Name', border: OutlineInputBorder()),
                        // )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // phone 2
                  Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextField(
                              controller: phonenum2,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.phone_outlined),
                                  labelText: 'Phone Number 1',
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        // Expanded(
                        //     child: TextField(
                        //   controller: phonename2,
                        //   decoration: InputDecoration(
                        //       labelText: 'Name', border: OutlineInputBorder()),
                        // )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AddContactsAppbar extends StatelessWidget {
  final Function onbacktapped;
  final Function onsavetapped;

  const AddContactsAppbar({Key key, this.onsavetapped, this.onbacktapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1.0,
      pinned: true,
      floating: true,
      title: Text('Add contact'),
      leading: Responsive.istablet(context)
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // navigates back to contacts screen
                onbacktapped();
              },
            )
          : null,
      actions: [
        TextButton(
            onPressed: onsavetapped,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }
}
