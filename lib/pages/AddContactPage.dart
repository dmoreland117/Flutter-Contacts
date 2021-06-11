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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          AddContactsAppbar(
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
                  NameSection(),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  PhoneRow(),
                  SizedBox(
                    height: 10.0,
                  ),
                  PhoneRow(),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  EmailRow(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmailRow extends StatelessWidget {
  const EmailRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              )),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                labelText: 'Email Name', border: OutlineInputBorder()),
          )),
        ],
      ),
    );
  }
}

class PhoneRow extends StatelessWidget {
  const PhoneRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_outlined),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder()),
              )),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                labelText: 'Phone Name', border: OutlineInputBorder()),
          )),
        ],
      ),
    );
  }
}

class NameSection extends StatelessWidget {
  const NameSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                labelText: 'First Name', border: OutlineInputBorder()),
          )),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                labelText: 'Last Name', border: OutlineInputBorder()),
          )),
        ],
      ),
    );
  }
}

class AddContactsAppbar extends StatelessWidget {
  final Function onbacktapped;

  const AddContactsAppbar({Key key, this.onbacktapped}) : super(key: key);

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
                onbacktapped();
              },
            )
          : null,
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(color: Theme.of(context).accentColor),
            ))
      ],
    );
  }
}
