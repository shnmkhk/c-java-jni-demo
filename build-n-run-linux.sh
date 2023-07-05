#!/bin/sh
# Set JAVA_HOME to JDK 8 or later
$JAVA_HOME/bin/javac -h . HelloJNI.java
gcc -fPIC -I"$JAVA_HOME/include" -I "$JAVA_HOME/include/darwin" -shared -o libhello.so HelloJNI.c
$JAVA_HOME/bin/java -Djava.library.path=. HelloJNI
# native-image -Djava.library.path=. HelloJNI
# time ./hellojni
