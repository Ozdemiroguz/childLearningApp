import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tododyst/features/profile/presentation/widdgets/profile_image.dart';

import '../../../../constants/colors.dart';
import '../providers/user_provider.dart';
import '../widdgets/profile_textfield.dart';

@RoutePage()
class AccountEditPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final notifier = ref.watch(userProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              ProfileImage(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: bgColor,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera, color: darkBlue1),
                                title: Text('Camera'),
                                onTap: () async {
                                  File? _image;
                                  final picker = ImagePicker();
                                  picker
                                      .pickImage(source: ImageSource.camera)
                                      .then((value) {
                                    if (value != null) {
                                      _image = File(value.path);
                                      print('Image path: ${_image!.path}');

                                      notifier.imageUrlChanged(
                                        _image!.path,
                                      );
                                    }
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading:
                                    Icon(Icons.photo_library, color: darkBlue1),
                                title: Text('Gallery'),
                                onTap: () {
                                  File? _image;
                                  final picker = ImagePicker();
                                  picker
                                      .pickImage(source: ImageSource.gallery)
                                      .then((value) {
                                    if (value != null) {
                                      _image = File(value.path);
                                      print('Image path: ${_image!.path}');
                                      notifier.imageUrlChanged(
                                        _image!.path,
                                      );
                                    }
                                  });

                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ).then((value) {
                      if (value != null) {
                        print('Image path: $value');
                      }
                    });
                  },
                  size: 165,
                  isChildAccount: false,
                  imageUrl: user.imageUrl),
              SizedBox(height: 36.h),
              ProfileTextfield(
                hintText: user.name,
                onChanged: notifier.nameChanged,
              ),
              SizedBox(height: 20.h),
              ProfileTextfield(
                hintText: user.surname,
                onChanged: notifier.surnameChanged,
              ),
              SizedBox(height: 20.h),
              ProfileTextfield(
                hintText: user.age,
                onChanged: notifier.ageChanged,
              ),
              SizedBox(height: 20.h),
              const ProfileTextfield(
                hintText: 'Lorem Ipsum',
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
