#include <iostream>
#include <string>
#include <ctime>
#include <cstdint>
#include <cctype>

static uint32_t rotl32(uint32_t x, int r) {
    return (x << r) | (x >> (32 - r));
}

static uint32_t fnv1a32(const void* data, size_t len) {
    const uint8_t* p = static_cast<const uint8_t*>(data);
    uint32_t h = 2166136261u;
    for (size_t i = 0; i < len; ++i) {
        h ^= p[i];
        h *= 16777619u;
    }
    return h;
}

static int base36Value(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    if (c >= 'A' && c <= 'Z') return 10 + (c - 'A');
    if (c >= 'a' && c <= 'z') return 10 + (c - 'a');
    return -1;
}

static bool parseSerial(const std::string& s, uint16_t& a, uint16_t& b, uint16_t& c) {
    if (s.size() != 14 || s[4] != '-' || s[9] != '-') return false;

    auto parseBlock = [&](int start, uint16_t& out) -> bool {
        uint32_t v = 0;
        for (int i = 0; i < 4; ++i) {
            int d = base36Value(s[start + i]);
            if (d < 0) return false;
            v = v * 36u + static_cast<uint32_t>(d);
        }
        if (v > 0xFFFFu) return false;
        out = static_cast<uint16_t>(v);
        return true;
    };

    return parseBlock(0, a) && parseBlock(5, b) && parseBlock(10, c);
}

struct TimeKey {
    int minuteOfDay;
    int dayOfYear;
};

static TimeKey getTimeKey() {
    std::time_t now = std::time(nullptr);
    std::tm* t = std::localtime(&now);

    TimeKey k{};
    k.minuteOfDay = t->tm_hour * 60 + t->tm_min;
    k.dayOfYear = t->tm_yday + 1;
    return k;
}

static uint32_t buildToken(const TimeKey& k) {
    constexpr uint32_t SECRET = 0xC0FFEE11u;
    uint32_t x = static_cast<uint32_t>(k.minuteOfDay) ^ (static_cast<uint32_t>(k.dayOfYear) << 16) ^ SECRET;
    x = rotl32(x, 7) + 0x9E3779B9u;
    uint32_t h = fnv1a32(&x, sizeof(x));
    return rotl32(h ^ 0xA5A5A5A5u, 11);
}

static void deriveParts(uint32_t token, const TimeKey& k, uint16_t& A, uint16_t& B, uint16_t& C) {
    A = static_cast<uint16_t>((token ^ 0xBEEFu) & 0xFFFFu);
    B = static_cast<uint16_t>(((token >> 16) + static_cast<uint32_t>(k.minuteOfDay * 7)) & 0xFFFFu);
    C = static_cast<uint16_t>((static_cast<uint32_t>(A) + static_cast<uint32_t>(B) + static_cast<uint32_t>(k.dayOfYear * 13)) & 0xFFFFu);
}

static bool checkFormatAndParse(const std::string& input, uint16_t& a, uint16_t& b, uint16_t& c) {
    return parseSerial(input, a, b, c);
}

static bool checkPartsMatch(uint16_t a, uint16_t b, uint16_t c, const TimeKey& k) {
    uint32_t token = buildToken(k);

    uint16_t A, B, C;
    deriveParts(token, k, A, B, C);

    return (a == A && b == B && c == C);
}

static bool checkCrossConstraint(uint16_t a, uint16_t b, const TimeKey& k) {
    uint32_t left = (static_cast<uint32_t>(a) ^ static_cast<uint32_t>(b)) % 97u;
    uint32_t right = static_cast<uint32_t>(k.minuteOfDay) % 97u;
    return left == right;
}

static bool validateSerialWithTolerance(const std::string& input) {
    uint16_t a = 0, b = 0, c = 0;
    if (!checkFormatAndParse(input, a, b, c)) return false;
    TimeKey k0 = getTimeKey();

    for (int delta = -1; delta <= 1; ++delta) {
        TimeKey k = k0;
        k.minuteOfDay += delta;

        if (k.minuteOfDay < 0) k.minuteOfDay += 1440;
        if (k.minuteOfDay >= 1440) k.minuteOfDay -= 1440;

        if (checkPartsMatch(a, b, c, k) && checkCrossConstraint(a, b, k)) {
            return true;
        }
    }
    return false;
}

int main() {
    std::cout << "Enter serial (XXXX-XXXX-XXXX): ";
    std::string input;
    std::cin >> input;

    if (validateSerialWithTolerance(input))
        std::cout << "won\n";
    else
        std::cout << "loose\n";

    return 0;
}
