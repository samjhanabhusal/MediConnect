import'package:flutter/material.dart';
import 'package:luveen/features/Hospital/Admin/Screens/EditHospitalDetails.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/TextField.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import "dart:async";


 class IndividualHospital extends StatefulWidget {
  
  const IndividualHospital({Key?key}):super(key: key);

  @override
  State<IndividualHospital> createState() => _IndividualHospitalState();
}

class _IndividualHospitalState extends State<IndividualHospital> {
  final _controller = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    _sink.add(initValue);
    _stream.listen((event) => _controller.text = event.toString());
    super.initState();
  }
  @override
  void dispose() {
  _streamController.close();
  _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Hospital Profile",
                  style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
                ),
                
              ),
        actions: <Widget>[
          // new IconButton(
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
          // new IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          
          new Container(
            height: 250,
            child: GridTile(
              child: Container(
                color: Colors.grey.shade100,
                // child: Image.asset(widget.hospital_picture),
              ),
              
             
            ),
          ),
          Center(
            child: Text( "Hospital Name", style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 24),),
          ),
          
                              SizedBox(height:10,),
          Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Column(children: [
                      Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Hospital Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "9801357010",
                          // profileinfo![0].phoneno,
                          "Name",

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Location:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "9801357010",
                          // profileinfo![0].phoneno,
                         "Location",

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                     SizedBox(height: 25,),
                     Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Available Beds:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green ,
                              fontStyle: FontStyle.italic,
                              fontSize: 18),
                        ),
                       
                        // ],
                        // ),
                      ],
                    ),
                     SizedBox(height: 6,),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "General Ward Beds:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18,
                              ),
                        ),
                        Spacer(),
                      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      _sink.add(--initValue);
                    },
                    child: Icon(Icons.remove)),
                Container(
                  width: 50,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _sink.add(++initValue);
                    },
                    child: Icon(Icons.add)),
              ],
            )
          ],
        ),)
                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "VIP Ward beds:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        Spacer(),
                             Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      _sink.add(--initValue);
                    },
                    child: Icon(Icons.remove)),
                Container(
                  width: 50,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _sink.add(++initValue);
                    },
                    child: Icon(Icons.add)),
              ],
            )
          ],
        ),)
                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "ICU:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        Spacer(),
                             Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      _sink.add(--initValue);
                    },
                    child: Icon(Icons.remove)),
                Container(
                  width: 50,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _sink.add(++initValue);
                    },
                    child: Icon(Icons.add)),
              ],
            )
          ],
        ),)
                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Ventilators:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        Spacer(),
                            Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      _sink.add(--initValue);
                    },
                    child: Icon(Icons.remove)),
                Container(
                  
                  width: 50,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _sink.add(++initValue);
                    },
                    child: Icon(Icons.add)),
              ],
            )
          ],
        ),)
                        // ],
                        // ),
                      ],
                    ),
                   
                   
                     SizedBox(height: 25,),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Contact:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "9801357010",
                          // profileinfo![0].phoneno,
                          "065-45675, 9845129266",

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                    
                   
                    ])
                  )),
                   SizedBox(height: 4,),
                     TextButton(
         onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const EditHospitalDetails(), )),
        child: const Text('Edit Profile', style: TextStyle( decoration: TextDecoration. underline,),textAlign: TextAlign.center),
      ),
         ])
    );
    
  }
}



class NumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int min;
  final int max;
  final int step;
  final double arrowsWidth;
  final double arrowsHeight;
  final EdgeInsets contentPadding;
  final double borderWidth;
  final ValueChanged<int?>? onChanged;

  const NumberTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.min = 0,
    this.max = 999,
    this.step = 1,
    this.arrowsWidth = 24,
    this.arrowsHeight = kMinInteractiveDimension,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.borderWidth = 2,
    this.onChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _canGoUp = false;
  bool _canGoDown = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  void didUpdateWidget(covariant NumberTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller = widget.controller ?? _controller;
    _focusNode = widget.focusNode ?? _focusNode;
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  Widget build(BuildContext context) => TextField(
      controller: _controller,
      focusNode: _focusNode,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      maxLength: widget.max.toString().length + (widget.min.isNegative ? 1 : 0),
      decoration: InputDecoration(
          counterText: '',
          isDense: true,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          contentPadding: widget.contentPadding.copyWith(right: 0),
          suffixIconConstraints: BoxConstraints(
              maxHeight: widget.arrowsHeight, maxWidth: widget.arrowsWidth + widget.contentPadding.right),
          suffixIcon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(widget.borderWidth), bottomRight: Radius.circular(widget.borderWidth))),
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  top: widget.borderWidth,
                  right: widget.borderWidth,
                  bottom: widget.borderWidth,
                  left: widget.contentPadding.right),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Expanded(
                    child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                            child: Opacity(opacity: _canGoUp ? 1 : .5, child: const Icon(Icons.arrow_drop_up)),
                            onTap: _canGoUp ? () => _update(true) : null))),
                Expanded(
                    child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                            child: Opacity(opacity: _canGoDown ? 1 : .5, child: const Icon(Icons.arrow_drop_down)),
                            onTap: _canGoDown ? () => _update(false) : null))),
              ]))),
      maxLines: 1,
      onChanged: (value) {
        final intValue = int.tryParse(value);
        widget.onChanged?.call(intValue);
        _updateArrows(intValue);
      },
      inputFormatters: [_NumberTextInputFormatter(widget.min, widget.max)]);

  void _update(bool up) {
    var intValue = int.tryParse(_controller.text);
    intValue == null ? intValue = 0 : intValue += up ? widget.step : -widget.step;
    _controller.text = intValue.toString();
    _updateArrows(intValue);
    _focusNode.requestFocus();
  }

  void _updateArrows(int? value) {
    final canGoUp = value == null || value < widget.max;
    final canGoDown = value == null || value > widget.min;
    if (_canGoUp != canGoUp || _canGoDown != canGoDown)
      setState(() {
        _canGoUp = canGoUp;
        _canGoDown = canGoDown;
      });
  }
}

class _NumberTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  _NumberTextInputFormatter(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (const ['-', ''].contains(newValue.text)) return newValue;
    final intValue = int.tryParse(newValue.text);
    if (intValue == null) return oldValue;
    if (intValue < min) return newValue.copyWith(text: min.toString());
    if (intValue > max) return newValue.copyWith(text: max.toString());
    return newValue.copyWith(text: intValue.toString());
  }
}