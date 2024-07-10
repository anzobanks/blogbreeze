
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var http = GetConnect(timeout: Duration(seconds: 20), maxAuthRetries: 4);
GetStorage getStorage = GetStorage();
