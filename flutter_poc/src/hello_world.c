#include <jni.h>
#include <stdio.h>

// Define the function that returns "I am being called from C++"
jstring Java_com_vts_flutterPOC_MainActivity_invokePrintHelloWorld(JNIEnv *env, jobject /* this */) {
    const char* hello = "I am being called from C++";
    return (*env)->NewStringUTF(env, hello);
}

const char* getHelloWorld() {
    return "Hello from C";
}