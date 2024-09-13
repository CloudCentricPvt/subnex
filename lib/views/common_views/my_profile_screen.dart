import 'dart:convert';
import 'dart:developer';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:subnex/controllers/user_controller.dart';
import 'package:subnex/models/authentication/user/user_detail_response.dart';
import 'package:subnex/utils/constants/k_colors.dart';
import 'package:subnex/utils/constants/k_sizes.dart';
import 'package:subnex/utils/reusable_widgets/k_app_bar.dart';
import 'package:subnex/utils/reusable_widgets/k_custom_app_bar.dart';
import 'package:subnex/utils/reusable_widgets/k_textinputform_field.dart';


class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _localStorage = GetStorage();
  final UserController _userController = UserController();
  bool _isDetailFetched = false;
  late Future<dynamic> _userProfileInfo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  late String _genderController = "";

  late String userCode = "";
  bool _isLoading = false;
  DateTime? _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  List<String> dropdownValues = ['Male', 'Female', 'Other'];
  String? _selectedValue;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        // Format the selected date and set it in the text field
        _selectedDate = pickedDate;
        _dobController.text = _dateFormat.format(_selectedDate!);
        log("Open date picker1 : ${_dobController.text}");
      });
    }
  }

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to handle login action
  void _handleUserProfileUpdate() async {
    setState(() {
      _isLoading = true; // Show progress bar
    });

    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String gender = _genderController;
    String dob = _dobController.text;

    var body = <String, dynamic>{
      "user_code": userCode,
      "username": fullName,
      "first_name": "",
      "last_name": "",
      "email": email,
      "date_of_birth": dob,
      "gender": gender,
      "updated_by": userCode
    };

    Map<String, dynamic> response =
        await _userController.updateUserProfileInfo(context, body);

    if (response['status'] == true) {
      Navigator.of(context).pop();
    } else {
      log("MyProfileScreen : ${response['message']}");
    }

    setState(() {
      _isLoading = false; // Hide progress bar
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userCode = _localStorage.read("User_Id") ?? "";
    if (!_isDetailFetched) {
      _userProfileInfo = _userController.fetchUserDetail(context, userCode);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      /*body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        child: Column(
          children: [
            const KCustomAppBar(screenTitle: "My Profile"),
            const SizedBox(
              height: KSizes.spaceBtwItems_12,
            ),
            _wUserProfilePic(),
            const SizedBox(
              height: KSizes.spaceBtwItems_16,
            ),
            Text(
              "Keshav Arya",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_24,
            ),
            _wUserForm(),
            const SizedBox(
              height: KSizes.spaceBtwItems_24 * 2,
            ),
            _wBtnSaveAndNext()
          ],
        ),
      ),*/
      body: FutureBuilder<dynamic>(
        future: _userProfileInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return !_isDetailFetched
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('User detail not found'));
          } else {
            UserDetailResponse? userDetailResponse;
            if (snapshot.data! != null) {
              userDetailResponse = snapshot.data!;
              if (userDetailResponse != null &&
                  userDetailResponse.userDetails != null &&
                  !_isDetailFetched) {
                // Parse the date from API to DateTime format
                _selectedDate = userDetailResponse.userDetails!.dateOfBirth ??
                    DateTime.now();
                _fullNameController.text =
                    userDetailResponse.userDetails!.username ?? "";
                _emailController.text =
                    userDetailResponse.userDetails!.email ?? "";
                _dobController.text = _dateFormat.format(_selectedDate!);
                _genderController =
                    userDetailResponse.userDetails!.gender ?? "";
                _selectedValue = userDetailResponse.userDetails!.gender ?? "";
              }
              _isDetailFetched = true;
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
              child: Column(
                children: [
                  const KCustomAppBar(screenTitle: "My Profile"),
                  const SizedBox(
                    height: KSizes.spaceBtwItems_12,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _wUserProfilePic(),
                          const SizedBox(
                            height: KSizes.spaceBtwItems_16,
                          ),
                          Text(
                            _isDetailFetched && userDetailResponse != null
                                ? userDetailResponse.userDetails!.username ??
                                    "Username"
                                : "",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: KSizes.spaceBtwItems_24,
                          ),
                          _wUserForm(userDetailResponse!.userDetails!),
                          const SizedBox(
                            height: KSizes.spaceBtwItems_24 * 2,
                          ),
                          _wBtnSaveAndNext(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _wUserProfilePic() {
    return Stack(
      children: [
        ClipOval(
          child: Image(
            height: 80,
            width: 80,
            image: _profileImage != null
                ? FileImage(_profileImage!)
                : const AssetImage("assets/images/user_profile_img.png"),
            fit: BoxFit.fill, // Ensures the image fits properly
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: Material(
              elevation: 4,
              // Set the elevation for the plus icon
              shape: const CircleBorder(),
              // Shape for the Material widget (circular)
              child: ClipOval(
                child: Container(
                  color: Colors.white, // Background color for the icon
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 10, // Icon size
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _wUserForm(UserDetails data) {
    log("fsfd: $_selectedValue");
    return Form(
        key: _formKey,
        child: Column(
          children: [
            KTextInputFormField(
              labelText: 'Full Name',
              hintText: 'Enter your full name',
              controller: _fullNameController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
              onChange: (value) {
                _fullNameController.text = value!;
              },
              readOnly: false,
              prefixIcon: null,
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_16,
            ),
            KTextInputFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              readOnly: false,
              prefixIcon: null,
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_16,
            ),
            SizedBox(
              height: 58,
              child: DropdownButtonFormField<String>(
                menuMaxHeight: 200,
                isExpanded: true,
                dropdownColor: KColors.appPrimary,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: KColors.appSecondaryGrey,
                      fontWeight: FontWeight.w400),
                  labelText: 'Gender',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)), // Set the border radius here
                  ),
                ),
                value: _selectedValue,
                hint: const Text('Gender'),
                items: dropdownValues.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (value) {
                  _onDropdownChanged(value);
                },
              ),
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems_16,
            ),
            KTextInputFormField(
                labelText: 'Date of Birth',
                hintText: 'Please select you D.O.B',
                controller: _dobController,
                keyboardType: TextInputType.none,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select you D.O.B';
                  }
                  return null;
                },
                onChange: (value) {
                  log("Open date picker : ${_dobController.text}");
                  _dobController.text = value!;
                  log("Open date picker1 : ${_dobController.text}");
                },
                readOnly: true,
                prefixIcon: null,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.calendar_today,
                    size: 22,
                  ),
                  // Use calendar icon
                  onPressed: () {
                    _selectDate(context);
                  },
                )),
          ],
        ));
  }

  // Handle the dropdown value change
  void _onDropdownChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedValue = newValue;
        _genderController = newValue;
      });
      //_saveSelectedValue(newValue);
    }
  }

  Widget _wBtnSaveAndNext() {
    return _isLoading
        ? const CircularProgressIndicator(color: Colors.white)
        : GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _handleUserProfileUpdate();
                //_userController.updateUserProfileInfo(context, userCode);
              }
            },
            child: Container(
              width: 200,
              height: 48,
              decoration: BoxDecoration(
                  color: KColors.appPrimary,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  "Save & Next",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          );
  }
}
