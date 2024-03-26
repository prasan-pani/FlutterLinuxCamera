#include <jni.h>
#include <stdio.h>

extern "C" {

// Define the function that returns "I am being called from C++"
jstring JNICALL
    Java_com_vts_flutterPOC_MainActivity_invokePrintHelloWorld(JNIEnv *env, jobject /* this */) {
        const char* hello = "I am being called from C++";
        return env->NewStringUTF(hello);
    }
    const char* getHelloWorld() {
        return "Hello from C++";
    }
}

