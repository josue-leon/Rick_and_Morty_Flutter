import 'package:flutter/material.dart';

class GridViewList extends StatefulWidget {
  final List<GridDataModel> models;

  final bool unique;
  final Function({int? index, GridDataModel? model})? callback;

  const GridViewList({
    Key? key,
    required this.models,
    this.unique = false,
    this.callback,
  }) : super(key: key);

  @override
  _GridViewListState createState() => _GridViewListState();
}

class _GridViewListState extends State<GridViewList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(28, 34, 34,0.95),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: widget.models.length,

          itemBuilder: (context, index) {

            Image imgApi = Image.network(
              widget.models[index].img,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            );

            return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => onChangeItem(index),
                    child: Container(
                      height: 350-20,
                      width: 180-10,
                      decoration: BoxDecoration(

                        // border: Border.all(color: Color(0xff940D5A)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17.0),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Color.fromRGBO(37, 37, 37, 1.0),
                        //     offset: Offset(1.0, 15.0),
                        //     blurRadius: 20.0,
                        //   ),
                        // ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.models[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xff00315C),
                                fontSize: 16.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                            // textAlign: TextAlign.center,
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Center(
                                child: widget.models[index].isCheck ? imgApi : ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(17),
                                    bottomLeft: Radius.circular(17)
                                  ),
                                  child: imgApi
                                ),
                              ),

                            ),
                          ),

                          if(widget.models[index].isCheck)
                          Material(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(17),
                                    bottomLeft: Radius.circular(17))
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(17),
                                  bottomLeft: Radius.circular(17)
                                )
                              ),
                              width: double.infinity,
                              height: 27,
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void onChangeItem(index){
    GridDataModel model = widget.models[index];

    if(widget.unique){
      if(model.isCheck){
        return;
      }
      for(GridDataModel m in widget.models){
        if(m.isCheck){
          m.isCheck = false;
        }
      }
      model.isCheck = true;
    }else{
      model.isCheck ^= true;
    }


    if(widget.callback != null){
      widget.callback!(model: model, index: index);
    }

    setState(() {
      widget.models;
    });
    //print('> Clicked');
    //print(widget.models[index]);
  }
}

class GridDataModel {
  int id;
  String img;
  String title;
  bool isCheck;
  dynamic item;

  GridDataModel({
    required this.id,
    required this.img,
    required this.title,
    required this.isCheck,
    this.item
  });

  @override
  String toString() => '$id\t$isCheck\n';
}
