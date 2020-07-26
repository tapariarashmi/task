import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'data.dart';
import 'list_tile.dart';


class HomeView extends StatelessWidget{
  int flag=0;
  @override
 Widget build(BuildContext context) {
    return ViewModelBuilder<Data>.reactive(
      
      builder:(context,data,child){
        if(flag==0){
        data.getList();
        print('rebuilt');
        flag=1;
        }
        return Scaffold(
          
         // appBar: AppBar(title: Text('')),
          backgroundColor: Colors.green[200],
                  body: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/background.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //color: Colors.indigoAccent,
                      padding: EdgeInsets.symmetric(horizontal:5.0,vertical:5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              //color: Colors.deepOrange,
                            padding: EdgeInsets.symmetric(horizontal:10.0,vertical:5.0),
                            child: ListView.builder(
                              //shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                final element = data.selectedList[index];
                                return SelectedListTile(
                                   firstName: element.firstName,
                                   imageURL: element.imageURL,
                                );
                            },
                            itemCount: data.selectedListCount(),
                            ),
                              ),
                          ),
                          Expanded(
                            flex:7,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:5.0,vertical:5.0),
                              child: ListView.builder(
                                shrinkWrap: true,
            itemBuilder:(context,index){
             // data.getData();
              final element = data.list[index];
              return Listtile(
                firstName: element.firstName,
                lastName: element.lastName,
                email: element.email,
                imageURL: element.imageURL,
                onLongPress: (){
                  data.updateSelectedList(element);
                  },
              );
              
            }, 
            itemCount: data.listCount(),
            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        );
        },
        viewModelBuilder: ()=> Data(),
      );
  }
}