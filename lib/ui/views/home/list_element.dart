
class ListElement{
  var firstName;
  var lastName;
  var email;
  var imageURL;
  ListElement({this.firstName,this.lastName,this.email,this.imageURL});

  String getFirstName(){
    return firstName.toString();
  }
  String getImageURL(){
    return imageURL.toString();
  }

}

class SelectedElement{
  String firstName;
  String imageURL;
  SelectedElement({this.firstName,this.imageURL});
}