import 'package:stacked/stacked.dart';
import 'list_element.dart';
import 'package:task/services/api.dart';

class Data extends BaseViewModel{
   List<ListElement> list = [];
  List<SelectedElement> selectedList = [];
  int listCount(){
    print(list.length);
    return list.length;
  }
    int selectedListCount(){
    print(selectedList.length);
    return selectedList.length;
  }

   void getList() async{
    print('triggered');
    Network network = Network();
    var data = await network.getData();
    var dataIndex;
    for(int i=0;i<6;i++){
      dataIndex = data['data'][i];
      print(data['data'][i]['last_name']);
      list.add(ListElement(firstName: dataIndex['first_name'],lastName: dataIndex['last_name'],email: dataIndex['email'],imageURL: dataIndex['avatar']));
    }
    notifyListeners();
    
  }
  void updateSelectedList(ListElement element){
    selectedList.add(SelectedElement(firstName: element.firstName,imageURL:element.imageURL));
  notifyListeners();
  }
  void deleteSelectedList({String firstName}){
    selectedList.remove(SelectedElement(firstName: firstName));
    notifyListeners();

  }


}