import 'package:contactsapp/import.dart';

/// Shows a list of all the contacts on device.
///
/// [ccontacts]: takes in a list of type Contact.
/// [selectedindex]: is what contact is selected only on tablets.
/// [oncontacttapped]: what to do when you tap a contacttile (right now it sets the index).
/// [addcontacttapped]: what to do when the add button is pressed (only on tablet).
class ContactsListPage extends StatelessWidget {
  final List<Contact> contacts;
  final int selectenindex;
  final Function oncontacttapped;
  final Function addcontacttapped;

  const ContactsListPage(
      {Key key,
      this.oncontacttapped,
      this.addcontacttapped,
      this.selectenindex,
      this.contacts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          CustomAppBar(
            addcontacttapped: addcontacttapped,
          ),
          //FavoritesList(),
          contacts != null && contacts.length > 0
              ? ContactsList(
                  contacts: contacts,
                  selectenindex: selectenindex,
                  oncontacttap: oncontacttapped)
              : SliverTextBox(text: 'No Contacts', hight: 200.0,)
        ],
      ),
    );
  }
}

/// The list with all the contacts
///
/// Contacts: takes in a list of contacts
/// selectedindex: is what contact is selected
/// oncontacttap: what happens when contact is tapped
class ContactsList extends StatelessWidget {
  const ContactsList({
    Key key,
    @required this.contacts,
    @required this.selectenindex,
    @required this.oncontacttap,
  }) : super(key: key);

  final List<Contact> contacts;
  final int selectenindex;
  final Function oncontacttap;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, index) {
      Contact currentcontact = contacts[index];
      return ContactTile(
          contact: currentcontact,
          selected: selectenindex == index ? true : false,
          ontap: () {
            oncontacttap(index, currentcontact);
          });
    }, childCount: contacts.length));
  }
}

/// an appbar with a search box and add contact button
///
/// addcontacttapped: trigerd when add is tapped only on tablets
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.addcontacttapped,
  }) : super(key: key);

  final Function addcontacttapped;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      elevation: 1.0,
      floating: true,
      pinned: true,
      title: Text('Contacts'),
      stretch: true,
      centerTitle: true,
      expandedHeight: 110.0,
      leading: IconButton(
        icon: Icon(
          Icons.settings_outlined,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {},
      ),
      actions: [
        Responsive.istablet(context)
            ? IconButton(
                onPressed: () {
                  addcontacttapped();
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                ))
            : SizedBox.shrink()
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40.0,
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 130.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FavContact(),
            ],
          ),
        ),
      ),
    );
  }
}

class FavContact extends StatelessWidget {
  final ImageProvider contactimage;
  final String contactname;

  const FavContact({Key key, this.contactimage, this.contactname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Grandma')
        ],
      ),
    );
  }
}
