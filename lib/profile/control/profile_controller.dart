import 'package:flutter/material.dart';
import '../data/repo/profile_repository.dart';

class ProfileController extends ChangeNotifier {
  final ProfileRepository repository;

  ProfileController(this.repository);

  String get userName => "Ahmed Essam"; 
}
