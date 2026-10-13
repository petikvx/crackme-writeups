#include <windows.h>
#include <stdio.h>
#include <string.h>
#include "../original/source/createSerial.inc"
int main(int c,char**v){for(int i=1;i<c;i++){char b[64]={0};createSerial(v[i],b);printf("%s -> %s\n",v[i],b);}return 0;}
