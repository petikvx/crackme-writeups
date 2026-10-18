CC = gcc
CFLAGS = -O0 -fno-stack-protector -no-pie -Wall -Iinclude
SRC = src/main.c src/check.c
OUT = rev1

all: $(OUT)

$(OUT): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(OUT)

clean:
	rm -f $(OUT)
