import 'dart:io';

import 'package:flutter/material.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/Hospital/Admin/Screens/EditHospitalDetails.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/TextField.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import "dart:async";

import 'package:luveen/features/Hospital/Admin/Services/hospital_admin_services.dart';
import 'package:luveen/features/account/services/account_services.dart';
// import 'package:luveen/providers/bed_provider.dart';
import 'package:luveen/providers/hospital_provider.dart';
import 'package:provider/provider.dart';

class IndividualHospital extends StatefulWidget {
  
  final String name;
  final List<File> hospital_picture;
  final String general_ward_total;
  final String VIP_ward_total;
  final String ICU_total;
  final String ventilators_total;
  final String hospital_location;

  IndividualHospital(
      {Key? key,
      required this.general_ward_total,
      required this.VIP_ward_total,
      required this.ICU_total,
      required this.ventilators_total,
      required this.hospital_location,
      required this.name,
       required this.hospital_picture})
      : super(key: key);

  @override
  State<IndividualHospital> createState() => _IndividualHospitalState();
}

class _IndividualHospitalState extends State<IndividualHospital> {
  // final String beds_available = widget.ICU_total + widget.VIP_ward_total + widget.general_ward_total ;
  late String beds_available;
  //  void calculateBedsAvailable() {
  //  int generalWardTotal = int.tryParse(widget.general_ward_total.trim()) ?? 0;
  // int vipWardTotal = int.tryParse(widget.VIP_ward_total.trim()) ?? 0;
  // int icuTotal = widget.ICU_total.isNotEmpty ? int.tryParse(widget.ICU_total.trim()) ?? 0 : 0;

  //   int beds_Available = generalWardTotal + vipWardTotal + icuTotal;
  //   beds_available = beds_Available.toString();
  // }

  void calculateBedsAvailable() {
    final String generalWardTotal = widget.general_ward_total ?? '';
    final String vipWardTotal = widget.VIP_ward_total ?? '';
    final String icuTotal = widget.ICU_total ?? '';
    final String ventilatorTotal = widget.ventilators_total ?? '';

    final int parsedGeneralWardTotal =
        int.tryParse(generalWardTotal.trim()) ?? 0;
    final int parsedVentilatorTotal =
        int.tryParse(generalWardTotal.trim()) ?? 0;
    final int parsedVipWardTotal = int.tryParse(vipWardTotal.trim()) ?? 0;
    final int parsedIcuTotal =
        icuTotal.isNotEmpty ? int.tryParse(icuTotal.trim()) ?? 0 : 0;

    final int bedsAvailable =
        parsedGeneralWardTotal + parsedVipWardTotal + parsedIcuTotal + parsedVentilatorTotal;
    beds_available = bedsAvailable.toString();
  }

  
  final TextEditingController general_ward_availableController =   TextEditingController();
  final TextEditingController VIP_ward_availableController =  TextEditingController();
  final TextEditingController ICU_availableController = TextEditingController();
  final TextEditingController ventilators_availableController = TextEditingController();

  final HospitalAdminServices hospitaladminServices = HospitalAdminServices();

  
  final _addBedFormKey = GlobalKey<FormState>();

  final _controller = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    _sink.add(initValue);
    // _stream.listen((event) => _controller.text = event.toString());
    // _stream.listen((event) => general_ward_availableController.text = event.toString());
    // _stream.listen((event) => VIP_ward_availableController.text = event.toString());
    // _stream.listen((event) => ICU_availableController.text = event.toString());
    // _stream.listen((event) => ventilators_availableController.text = event.toString());
    super.initState();
    calculateBedsAvailable();
  }

  @override
  void dispose() {
    _streamController.close();
    _controller.dispose();
    super.dispose();
    general_ward_availableController.dispose();
    VIP_ward_availableController.dispose();
    ICU_availableController.dispose();
    ventilators_availableController.dispose();
  }

  void AddBed() {
     {
      // hospitaladminServices.AddBed(context: context, hospital_picture: hospital_picture, beds_available: beds_available, hospital_location: hospital_location, location: location, general_ward_total: general_ward_total, general_ward_available: general_ward_available, VIP_ward_total: VIP_ward_total, VIP_ward_available: VIP_ward_available, ICU_total: ICU_total, ICU_available: ICU_available, ventilators_total: ventilators_total, ventilators_available: ventilators_available, name: name, description: description, price: price, quantity: quantity, category: category, images: images)
      hospitaladminServices.AddBed(
        context: context,
        hospital_picture: widget.hospital_picture,
        beds_available: beds_available,
        hospital_location: widget.hospital_location,
        location: widget.hospital_location,
        general_ward_total: widget.general_ward_total,
        general_ward_available: general_ward_availableController.text,
        VIP_ward_total: widget.VIP_ward_total,
        VIP_ward_available: VIP_ward_availableController.text,
        ICU_total: widget.ICU_total,
        ICU_available: ICU_availableController.text,
        ventilators_total: widget.ventilators_total,
        ventilators_available: ventilators_availableController.text,
      );
    }
  }
  void EditDetail() {
     {
      // hospitaladminServices.AddBed(context: context, hospital_picture: hospital_picture, beds_available: beds_available, hospital_location: hospital_location, location: location, general_ward_total: general_ward_total, general_ward_available: general_ward_available, VIP_ward_total: VIP_ward_total, VIP_ward_available: VIP_ward_available, ICU_total: ICU_total, ICU_available: ICU_available, ventilators_total: ventilators_total, ventilators_available: ventilators_available, name: name, description: description, price: price, quantity: quantity, category: category, images: images)
      hospitaladminServices.editbeddetail(
        context: context,
        hospital_picture: widget.hospital_picture,
        beds_available: beds_available,
        hospital_location: widget.hospital_location,
        location: widget.hospital_location,
        general_ward_total: widget.general_ward_total,
        general_ward_available: general_ward_availableController.text,
        VIP_ward_total: widget.VIP_ward_total,
        VIP_ward_available: VIP_ward_availableController.text,
        ICU_total: widget.ICU_total,
        ICU_available: ICU_availableController.text,
        ventilators_total: widget.ventilators_total,
        ventilators_available: ventilators_availableController.text,
        onSuccess:(){
            setState(() {
              
            });
        }
      );
    }
  }

  //  void increaseQuantity(Product product) {
  //   productDetailsServices.addToCart(
  //     context: context,
  //     product: product,
  //   );
  // }

  // void decreaseQuantity(Product product) {
  //   cartServices.removeFromCart(
  //     context: context,
  //     product: product,
  //   );
  // }
 void increaseQuantity(TextEditingController controller) {
  int currentValue = int.parse(controller.text);
  int incrementedValue = currentValue + 1;
  controller.text = incrementedValue.toString();
}

void decreaseQuantity(TextEditingController controller) {
  int currentValue = int.parse(controller.text);
  int decrementedValue = currentValue - 1;
  controller.text = decrementedValue.toString();
}

// String generalWardAvailableValue = showGeneralWard ? general_ward_availableController.text : '0';
  
  @override
  Widget build(BuildContext context) {
     final hospitalProvider = Provider.of<HospitalProvider>(context);
    final phone = hospitalProvider.hospital.phone;
    final name = hospitalProvider.hospital.id;
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: Align(
            // alignment: Alignment.bottomRight,
            alignment: Alignment.center,
            child: Text(
              "Hospital Profile",
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: <Widget>[
          
          ],
        ),
        body: new ListView(children: <Widget>[
          
          new Container(
            height: 250,
            child: GridTile(
              child: Container(
                color: Colors.grey.shade100,
                // child: Image.network(widget.hospital_picture[0]),
                                child: Image.asset("assets/images/Dhulikhel.jpg")

              ),
            ),
          ),
      
          Center(
            child: Text(
              "${widget.name}",
              // "Bir Hospital",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                  fontSize: 24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
                          "Bir Hospital",
                          // profileinfo![0].phoneno,
                          // "${widget.name}",

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
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
                          "${widget.hospital_location}",

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Available Beds:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontStyle: FontStyle.italic,
                              fontSize: 18),
                        ),

                        // ],
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                   showGeneralWard
    ? Row(
        children: <Widget>[
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => decreaseQuantity(general_ward_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12, width: 1.5),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                               width: 35,

                        height: 32,
                        alignment: Alignment.center,
                              child: TextField(
                                // textAlign: ,
                                controller: showGeneralWard ? general_ward_availableController : TextEditingController(text: '0'),
                                // controller: showGeneralWard ? general_ward_availableController : general_ward_availableController.text : '0',
                                //  textAlign: general_ward_availableController.text.isNotEmpty ? TextAlign.center : TextAlign.start,
                                //  keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => increaseQuantity(general_ward_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    : Container(),

                    SizedBox(
                      height: 6,
                    ),

                    showVipWard? Row(
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => decreaseQuantity(VIP_ward_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12, width: 1.5),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                               width: 35,

                        height: 32,
                        alignment: Alignment.center,
                                    child: TextField(
                                      // controller: VIP_ward_availableController,
                                       controller: showVipWard ? VIP_ward_availableController : TextEditingController(text: '0'),
                                     textAlign: VIP_ward_availableController.text.isNotEmpty ? TextAlign.center : TextAlign.start,
                                 keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => increaseQuantity(VIP_ward_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    : Container(),

                    SizedBox(
                      height: 6,
                    ),
                    showIcu ? Row(
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => decreaseQuantity(ICU_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12, width: 1.5),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                               width: 35,

                        height: 32,
                        alignment: Alignment.center,
                              child: TextField(
                                      // controller: ICU_availableController,
                                       controller: showIcu ? ICU_availableController : TextEditingController(text: '0'),
                                   textAlign: ICU_availableController.text.isNotEmpty ? TextAlign.center : TextAlign.start,
                                 keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => increaseQuantity(ICU_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    : Container(),
                    SizedBox(
                      height: 6,
                    ),
                    showVentilator ? Row(
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => decreaseQuantity(ventilators_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12, width: 1.5),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                               width: 35,

                        height: 32,
                        alignment: Alignment.center,
                              child: TextField(
                                      // controller:
                                      //     ventilators_availableController,
                                       controller: showVentilator ? ventilators_availableController : TextEditingController(text: '0'),
                                    textAlign: ventilators_availableController.text.isNotEmpty ? TextAlign.center : TextAlign.start,
                                 keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => increaseQuantity(ventilators_availableController),
                            child: Container(
                              width: 35,
                              height: 32,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    : Container(),
                    SizedBox(
                      height: 25,
                    ),
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
                          // "065-45675, 9845129266",
                          phone,

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                  ]))),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(child:
              ElevatedButton(
                // onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const EditHospitalDetails(),
                // )),
                 onPressed: () {
                  EditDetail();
                },
                child: const Text('Edit Profile',
                    style: TextStyle(
                      // decoration: TextDecoration,
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center),
              ),),
              Expanded(
                child: ElevatedButton(
                onPressed: () {
                  AddBed();
                },
                child: const Text('Save',
                    style: TextStyle(
                      // decoration: TextDecoration,
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center),
              ),)
            ],
          ),
        ]),
        // sizedBox(height: 25),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.logout),
            onPressed: () => AccountServices().logOut(context),
            tooltip: 'logout'));
  }
}

class NumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextEditingController? general_ward_availableController;
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
    this.general_ward_availableController,
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
              maxHeight: widget.arrowsHeight,
              maxWidth: widget.arrowsWidth + widget.contentPadding.right),
          suffixIcon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(widget.borderWidth),
                      bottomRight: Radius.circular(widget.borderWidth))),
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  top: widget.borderWidth,
                  right: widget.borderWidth,
                  bottom: widget.borderWidth,
                  left: widget.contentPadding.right),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                                child: Opacity(
                                    opacity: _canGoUp ? 1 : .5,
                                    child: const Icon(Icons.arrow_drop_up)),
                                onTap: _canGoUp ? () => _update(true) : null))),
                    Expanded(
                        child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                                child: Opacity(
                                    opacity: _canGoDown ? 1 : .5,
                                    child: const Icon(Icons.arrow_drop_down)),
                                onTap:
                                    _canGoDown ? () => _update(false) : null))),
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
    intValue == null
        ? intValue = 0
        : intValue += up ? widget.step : -widget.step;
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (const ['-', ''].contains(newValue.text)) return newValue;
    final intValue = int.tryParse(newValue.text);
    if (intValue == null) return oldValue;
    if (intValue < min) return newValue.copyWith(text: min.toString());
    if (intValue > max) return newValue.copyWith(text: max.toString());
    return newValue.copyWith(text: intValue.toString());
  }
}
