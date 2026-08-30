/*
 * Reconstruction lisible de main() — Pera's Tiktok comment crackme
 *
 * Source de vérité Hex-Rays : analysis/thisismebtw.i64.c
 * (bash -ic 'decc original/thisismebtw')
 *
 * Ne compile pas tel quel (JPEG embarqué omis ; types SDL simplifiés).
 * Sert à lire le prédicat / le flow sans le bruit Hex-Rays.
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* SDL / SDL_image — signatures usuelles (pas les stubs Hex-Rays) */
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

/* JPEG embarqué en .rodata @ 0x2060, taille 0x2CA4 (11428) */
extern const unsigned char embedded_jpeg[0x2CA4];

enum {
    JPEG_SIZE = 0x2CA4,
    HASH_SEED = 5381,
    HASH_XOR = 0x7FADBEEF,
    HASH_MOD = 0x26F5, /* 9941 */
    HASH_TARGET = 42,
    ACC_XOR_A = 0x55,
    ACC_XOR_B = 0xAA,
    ACC_MOD = 0x539, /* 1337 */
    ACC_TARGET = 42,
};

static int check_part1(const char *text, size_t n)
{
    uint32_t h = HASH_SEED;
    size_t i;

    if (n <= 3)
        return 0;

    for (i = 0; i < n; i++)
        h = (uint32_t)n + ((33u * h) ^ (uint8_t)text[i]);

    return ((h ^ HASH_XOR) % HASH_MOD) == HASH_TARGET;
}

static int check_part2(const char *text, const char *pass, size_t n, int part1_ok)
{
    uint32_t a = 0;
    uint32_t b = 0;
    size_t j;

    /* La barre basse n'est évaluée que si la partie 1 échoue. */
    if (part1_ok || n <= 3)
        return 0;

    for (j = 0; j < n; j++) {
        uint8_t t = (uint8_t)text[j];
        uint8_t p = (uint8_t)pass[j];
        uint32_t s;

        a = ((t ^ p) + a) ^ ACC_XOR_A; /* xor eax, 0x55 */
        s = t + p + b;
        b = (s & ~0xFFu) | ((s & 0xFFu) ^ ACC_XOR_B); /* xor al, 0xAA */
    }

    return ((b ^ a) % ACC_MOD) == ACC_TARGET;
}

int main(int argc, char **argv)
{
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
    SDL_RWops *rw;
    SDL_Rect dst_img;   /* blit fond : 800×720 */
    SDL_Rect bar_top;   /* partie 1 : x=400 y=150 w=200 h=100 */
    SDL_Rect bar_bot;   /* partie 2 : x=400 y=275 w=200 h=100 */
    SDL_Event ev;
    unsigned char jpeg_buf[JPEG_SIZE];
    size_t len_text;
    size_t len_pass;
    int part1_ok;
    int part2_ok;
    int running;

    if (argc != 3) {
        printf("Usage: %s [text] [passwrd]", argv[0]);
        return 1;
    }

    memcpy(jpeg_buf, embedded_jpeg, JPEG_SIZE);

    SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS); /* binaire : 0xF231 */
    window = SDL_CreateWindow(
        "Crackme Comment",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        800,
        1000,
        SDL_WINDOW_SHOWN); /* flags = 4 */
    renderer = SDL_CreateRenderer(window, -1, 0);
    rw = SDL_RWFromMem(jpeg_buf, JPEG_SIZE);
    texture = IMG_LoadTexture_RW(renderer, rw, 1 /* freesrc */);

    dst_img = (SDL_Rect){0, 0, 800, 720};
    bar_top = (SDL_Rect){400, 150, 200, 100};
    bar_bot = (SDL_Rect){400, 275, 200, 100};

    len_text = strlen(argv[1]);
    len_pass = strlen(argv[2]);

    part1_ok = check_part1(argv[1], len_text);
    part2_ok = 0;
    if (!part1_ok && len_text == len_pass && len_text > 3)
        part2_ok = check_part2(argv[1], argv[2], len_text, part1_ok);

    running = 1;
    while (running) {
        while (SDL_PollEvent(&ev)) {
            if (ev.type == SDL_QUIT) /* 256 */
                running = 0;
        }

        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, texture, NULL, &dst_img);

        if (part1_ok)
            SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        else
            SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        SDL_RenderFillRect(renderer, &bar_top);

        if (part2_ok)
            SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        else
            SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        SDL_RenderFillRect(renderer, &bar_bot);

        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    }

    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}
