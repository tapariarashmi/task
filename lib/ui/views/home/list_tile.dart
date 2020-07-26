import 'package:flutter/material.dart';

class Listtile extends StatefulWidget {
  final  firstName;
  final  lastName;
  final  email;
  final imageURL;
  final Function onLongPress;
  final bool isSelected;
  Listtile({this.firstName,this.lastName,this.email,this.imageURL,this.isSelected=false,this.onLongPress});

  @override
  _ListtileState createState() => _ListtileState();
}

class _ListtileState extends State<Listtile> {
  @override
  Widget build(BuildContext context) {
    
    Color color = Colors.white;
    //print(lastName);
    return Card(
      color: color,
      elevation: 5.0,
          child: ListTile(
            selected: widget.isSelected,
            leading: CircleAvatar(backgroundImage: NetworkImage('${widget.imageURL.toString()}'),radius: 30.0,),
        title: Text('${widget.firstName.toString()} ${widget.lastName.toString()}',
        style: TextStyle(
            fontWeight: FontWeight.bold,
        )),
        subtitle: Text('${widget.email.toString()}',
        style: TextStyle(
          color: Colors.cyan[200],
          fontStyle: FontStyle.italic,
        ),
        ),
        onLongPress: widget.onLongPress,
        
      ),
    );
  }
}


class SelectedListTile extends StatelessWidget {
   final String firstName;
  final String imageURL;
  SelectedListTile({this.firstName,this.imageURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:5.0,horizontal:5.0),
          child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageURL),
            radius: 25.0,
          ),
          Text(firstName,style: TextStyle(
            fontSize:10.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}

