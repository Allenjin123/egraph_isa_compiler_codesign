#include <stdio.h>

typedef struct FAKEFILE {
    char* str;
    int pos;
    int size;
    bool eof;
} FAKEFILE;

size_t fake_fwrite(const void *buf, size_t size, size_t count, FAKEFILE *fakefile){
    if (size == 0 || count == 0) return 0;

    size_t total = size * count;
    size_t remaining = (fakefile->pos < fakefile->size)
                       ? fakefile->size - fakefile->pos
                       : 0;

    if (remaining == 0) {
        return 0;
    }
    if (total > remaining) {
        total = remaining;
    }

    const char *src = (const char *)buf;
    for (size_t i = 0; i < total; ++i) {
        fakefile->str[fakefile->pos++] = src[i];
        // putchar(src[i]);
    }

    return total / size;  // elements successfully written
}

size_t fake_fread(void *buf, size_t size, size_t count, FAKEFILE *fakefile){
    if (size == 0 || count == 0) return 0;

    size_t total = size * count;
    size_t remaining = (fakefile->pos < fakefile->size)
                       ? fakefile->size - fakefile->pos
                       : 0;

    if (remaining == 0) {
        fakefile->eof = 1;
        return 0;
    }

    if (total > remaining) {
        total = remaining;
        fakefile->eof = 1;   // hit EOF this read
    }

    char *dst = (char *)buf;
    for (size_t i = 0; i < total; ++i) {
        dst[i] = fakefile->str[fakefile->pos++];
    }

    return total / size;
}

bool fake_feof(FAKEFILE *fakefile){
    return fakefile->eof != 0;
}

void print_fake(FAKEFILE *fakefile){
    for(int i = 0; i < fakefile->pos; i++){
        putchar(fakefile->str[i]);
    }
}