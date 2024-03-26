import 'dart:ffi';
import 'package:ffi/ffi.dart';

// Assuming your shared library is named "libhello_world.so" on Android.
final DynamicLibrary _lib = DynamicLibrary.open('libhello_world.so');

// Function signature for the C++ function
typedef GetHelloWorldFunc = Pointer<Utf8> Function();
// Dart representation of the function
typedef GetHelloWorld = Pointer<Utf8> Function();

// Getting a reference to the 'getHelloWorld' function
final GetHelloWorld getHelloWorld = _lib
    .lookup<NativeFunction<GetHelloWorldFunc>>('getHelloWorld')
    .asFunction();