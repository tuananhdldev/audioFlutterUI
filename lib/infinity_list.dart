import 'package:audiobooks/model/passenger_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class InfinitiList extends StatefulWidget {
  const InfinitiList({Key? key}) : super(key: key);

  @override
  _InfinitiListState createState() => _InfinitiListState();
}

class _InfinitiListState extends State<InfinitiList> {
  int currentPage = 1;
  late int totalPages;
  List<Passenger>? passengers = [];
  final RefreshController refreshController = RefreshController(
      initialRefresh: true);




  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    final url = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=20");
    final respone = await http.get(url);
    if (respone.statusCode == 200) {
      final result = welcomeFromJson(respone.body).data;
      if(isRefresh){
        passengers =  result;
      }else if (result != null)
        passengers?.addAll(result);
      currentPage++;
      totalPages = welcomeFromJson(respone.body).totalPages??0;
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPassengerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Infinite Paging",)),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getPassengerData(isRefresh: true);
          if(result){
             refreshController.refreshCompleted();
          }else{
            refreshController.refreshFailed();
          }
        },onLoading: ()async{
           final result = await getPassengerData();
           if(result){
             refreshController.loadComplete();
           }else{
             refreshController.loadFailed();
           }
      },
        child: ListView.separated(itemBuilder: (context, index) {
          final item = passengers![index];
          return ListTile(

            title: Text(item.name ?? ""),
            subtitle: Text(item.airline?.country ?? ""),
            trailing: Text(item.airline?.name ?? ""),
            leading: Image.network(item.airline?.logo ?? "",
              width: 50,
              height: 50,
            ),

          );
        },
            separatorBuilder: (ctx, index) => Divider(),
            itemCount: passengers?.length ?? 0),
      ),
    );
  }
}
