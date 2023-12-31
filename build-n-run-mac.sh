#!/bin/sh
echo [INFO] Cleaning up the previous binaries
rm *.class *.h *.dylib
# Set JAVA_HOME to JDK 8 or later
echo [INFO] Compiling Java source files
$JAVA_HOME/bin/javac -h . HelloJNI.java
echo [INFO] Compiling native C/C++ source files
gcc -I"$JAVA_HOME/include" -I "$JAVA_HOME/include/darwin" -shared -o libchello.dylib HelloJNI.c
g++ -I"$JAVA_HOME/include" -I "$JAVA_HOME/include/darwin" -shared -o libcpphello.dylib HelloJNI.cpp
echo [INFO] Launching the program
$JAVA_HOME/bin/java -Djava.library.path=. HelloJNI
# native-image -Djava.library.path=. HelloJNI hellojni
# time ./hellojni
