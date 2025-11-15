#!/usr/bin/env python3
"""
Reference AES-256 implementation in Python
This implements the standard AES algorithm with column-major state organization
"""

# S-box
S_BOX = [
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
]

# Inverse S-box
INV_S_BOX = [
    0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
    0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
    0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e,
    0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
    0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92,
    0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84,
    0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06,
    0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
    0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73,
    0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e,
    0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b,
    0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
    0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f,
    0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef,
    0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61,
    0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d
]

# Round constants
RCON = [0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
        0x20000000, 0x40000000, 0x80000000, 0x1b000000, 0x36000000]

def xtime(x):
    """Multiply by 2 in GF(2^8)"""
    return ((x << 1) ^ (0x1b if x & 0x80 else 0)) & 0xff

def multiply(x, y):
    """Multiply in GF(2^8)"""
    result = 0
    for i in range(8):
        if y & 1:
            result ^= x
        hi_bit = x & 0x80
        x = (x << 1) & 0xff
        if hi_bit:
            x ^= 0x1b
        y >>= 1
    return result

def bytes_to_word(b):
    """Convert 4 bytes to a 32-bit word (little-endian)"""
    return b[0] | (b[1] << 8) | (b[2] << 16) | (b[3] << 24)

def word_to_bytes(w):
    """Convert a 32-bit word to 4 bytes (little-endian)"""
    return bytes([w & 0xff, (w >> 8) & 0xff, (w >> 16) & 0xff, (w >> 24) & 0xff])

class AES:
    def __init__(self, key):
        self.key = key
        self.key_len = len(key)
        self.nk = self.key_len // 4  # Number of 32-bit words in key
        self.nr = self.nk + 6  # Number of rounds
        self.e_key = []
        self.d_key = []
        self._key_expansion()
    
    def _key_expansion(self):
        """Expand the key"""
        # Convert key bytes to words (little-endian)
        self.e_key = []
        for i in range(self.nk):
            self.e_key.append(bytes_to_word(self.key[i*4:(i+1)*4]))
        
        # Expand
        for i in range(self.nk, 4 * (self.nr + 1)):
            temp = self.e_key[i-1]
            if i % self.nk == 0:
                # RotWord + SubWord + Rcon
                temp_bytes = word_to_bytes(temp)
                temp = bytes_to_word([S_BOX[temp_bytes[1]], S_BOX[temp_bytes[2]], 
                                     S_BOX[temp_bytes[3]], S_BOX[temp_bytes[0]]])
                temp ^= RCON[i // self.nk - 1]
            elif self.nk > 6 and i % self.nk == 4:
                # SubWord
                temp_bytes = word_to_bytes(temp)
                temp = bytes_to_word([S_BOX[b] for b in temp_bytes])
            self.e_key.append(self.e_key[i-self.nk] ^ temp)
        
        # Generate decryption key schedule (equivalent inverse cipher)
        self.d_key = [0] * len(self.e_key)
        # First round key (last encryption round key)
        for i in range(4):
            self.d_key[i] = self.e_key[self.nr*4 + i]
        
        # Middle round keys with InvMixColumns
        for r in range(1, self.nr):
            for i in range(4):
                word = self.e_key[(self.nr-r)*4 + i]
                word_bytes = list(word_to_bytes(word))
                # Apply InvMixColumns
                s0, s1, s2, s3 = word_bytes
                word_bytes[0] = multiply(s0, 0x0e) ^ multiply(s1, 0x0b) ^ multiply(s2, 0x0d) ^ multiply(s3, 0x09)
                word_bytes[1] = multiply(s0, 0x09) ^ multiply(s1, 0x0e) ^ multiply(s2, 0x0b) ^ multiply(s3, 0x0d)
                word_bytes[2] = multiply(s0, 0x0d) ^ multiply(s1, 0x09) ^ multiply(s2, 0x0e) ^ multiply(s3, 0x0b)
                word_bytes[3] = multiply(s0, 0x0b) ^ multiply(s1, 0x0d) ^ multiply(s2, 0x09) ^ multiply(s3, 0x0e)
                self.d_key[r*4 + i] = bytes_to_word(word_bytes)
        
        # Last round key (first encryption round key)
        for i in range(4):
            self.d_key[self.nr*4 + i] = self.e_key[i]
    
    def encrypt(self, plaintext):
        """Encrypt a 16-byte block"""
        # Load state as 4 words (column-major, little-endian)
        state = [bytes_to_word(plaintext[i*4:(i+1)*4]) for i in range(4)]
        
        # Initial AddRoundKey
        for i in range(4):
            state[i] ^= self.e_key[i]
        
        # Main rounds
        for rnd in range(1, self.nr):
            # SubBytes + ShiftRows
            state_bytes = []
            for w in state:
                state_bytes.extend(word_to_bytes(w))
            
            # SubBytes + ShiftRows combined (column-major)
            new_bytes = [
                S_BOX[state_bytes[0]], S_BOX[state_bytes[5]], S_BOX[state_bytes[10]], S_BOX[state_bytes[15]],
                S_BOX[state_bytes[4]], S_BOX[state_bytes[9]], S_BOX[state_bytes[14]], S_BOX[state_bytes[3]],
                S_BOX[state_bytes[8]], S_BOX[state_bytes[13]], S_BOX[state_bytes[2]], S_BOX[state_bytes[7]],
                S_BOX[state_bytes[12]], S_BOX[state_bytes[1]], S_BOX[state_bytes[6]], S_BOX[state_bytes[11]]
            ]
            state = [bytes_to_word(new_bytes[i*4:(i+1)*4]) for i in range(4)]
            
            # MixColumns
            for i in range(4):
                word_bytes = list(word_to_bytes(state[i]))
                s0, s1, s2, s3 = word_bytes
                word_bytes[0] = xtime(s0) ^ xtime(s1) ^ s1 ^ s2 ^ s3
                word_bytes[1] = s0 ^ xtime(s1) ^ xtime(s2) ^ s2 ^ s3
                word_bytes[2] = s0 ^ s1 ^ xtime(s2) ^ xtime(s3) ^ s3
                word_bytes[3] = xtime(s0) ^ s0 ^ s1 ^ s2 ^ xtime(s3)
                state[i] = bytes_to_word(word_bytes)
            
            # AddRoundKey
            for i in range(4):
                state[i] ^= self.e_key[rnd*4 + i]
        
        # Final round (no MixColumns)
        state_bytes = []
        for w in state:
            state_bytes.extend(word_to_bytes(w))
        
        new_bytes = [
            S_BOX[state_bytes[0]], S_BOX[state_bytes[5]], S_BOX[state_bytes[10]], S_BOX[state_bytes[15]],
            S_BOX[state_bytes[4]], S_BOX[state_bytes[9]], S_BOX[state_bytes[14]], S_BOX[state_bytes[3]],
            S_BOX[state_bytes[8]], S_BOX[state_bytes[13]], S_BOX[state_bytes[2]], S_BOX[state_bytes[7]],
            S_BOX[state_bytes[12]], S_BOX[state_bytes[1]], S_BOX[state_bytes[6]], S_BOX[state_bytes[11]]
        ]
        state = [bytes_to_word(new_bytes[i*4:(i+1)*4]) for i in range(4)]
        
        for i in range(4):
            state[i] ^= self.e_key[self.nr*4 + i]
        
        # Convert back to bytes
        result = bytearray()
        for w in state:
            result.extend(word_to_bytes(w))
        return bytes(result)
    
    def decrypt(self, ciphertext):
        """Decrypt a 16-byte block"""
        # Load state as 4 words (column-major, little-endian)
        state = [bytes_to_word(ciphertext[i*4:(i+1)*4]) for i in range(4)]
        
        # Initial AddRoundKey
        for i in range(4):
            state[i] ^= self.d_key[i]
        
        # Main rounds
        for rnd in range(1, self.nr):
            # InvShiftRows + InvSubBytes
            state_bytes = []
            for w in state:
                state_bytes.extend(word_to_bytes(w))
            
            new_bytes = [
                INV_S_BOX[state_bytes[0]], INV_S_BOX[state_bytes[13]], INV_S_BOX[state_bytes[10]], INV_S_BOX[state_bytes[7]],
                INV_S_BOX[state_bytes[4]], INV_S_BOX[state_bytes[1]], INV_S_BOX[state_bytes[14]], INV_S_BOX[state_bytes[11]],
                INV_S_BOX[state_bytes[8]], INV_S_BOX[state_bytes[5]], INV_S_BOX[state_bytes[2]], INV_S_BOX[state_bytes[15]],
                INV_S_BOX[state_bytes[12]], INV_S_BOX[state_bytes[9]], INV_S_BOX[state_bytes[6]], INV_S_BOX[state_bytes[3]]
            ]
            state = [bytes_to_word(new_bytes[i*4:(i+1)*4]) for i in range(4)]
            
            # InvMixColumns
            for i in range(4):
                word_bytes = list(word_to_bytes(state[i]))
                s0, s1, s2, s3 = word_bytes
                word_bytes[0] = multiply(s0, 0x0e) ^ multiply(s1, 0x0b) ^ multiply(s2, 0x0d) ^ multiply(s3, 0x09)
                word_bytes[1] = multiply(s0, 0x09) ^ multiply(s1, 0x0e) ^ multiply(s2, 0x0b) ^ multiply(s3, 0x0d)
                word_bytes[2] = multiply(s0, 0x0d) ^ multiply(s1, 0x09) ^ multiply(s2, 0x0e) ^ multiply(s3, 0x0b)
                word_bytes[3] = multiply(s0, 0x0b) ^ multiply(s1, 0x0d) ^ multiply(s2, 0x09) ^ multiply(s3, 0x0e)
                state[i] = bytes_to_word(word_bytes)
            
            # AddRoundKey (with InvMixColumns-transformed keys)
            for i in range(4):
                state[i] ^= self.d_key[rnd*4 + i]
        
        # Final round (no InvMixColumns)
        state_bytes = []
        for w in state:
            state_bytes.extend(word_to_bytes(w))
        
        new_bytes = [
            INV_S_BOX[state_bytes[0]], INV_S_BOX[state_bytes[13]], INV_S_BOX[state_bytes[10]], INV_S_BOX[state_bytes[7]],
            INV_S_BOX[state_bytes[4]], INV_S_BOX[state_bytes[1]], INV_S_BOX[state_bytes[14]], INV_S_BOX[state_bytes[11]],
            INV_S_BOX[state_bytes[8]], INV_S_BOX[state_bytes[5]], INV_S_BOX[state_bytes[2]], INV_S_BOX[state_bytes[15]],
            INV_S_BOX[state_bytes[12]], INV_S_BOX[state_bytes[9]], INV_S_BOX[state_bytes[6]], INV_S_BOX[state_bytes[3]]
        ]
        state = [bytes_to_word(new_bytes[i*4:(i+1)*4]) for i in range(4)]
        
        for i in range(4):
            state[i] ^= self.d_key[self.nr*4 + i]
        
        # Convert back to bytes
        result = bytearray()
        for w in state:
            result.extend(word_to_bytes(w))
        return bytes(result)

# Random number generator (matching C implementation)
class Random:
    def __init__(self):
        self.a = [0xeaf3, 0x35fe]
        self.count = 4
        self.r = 0
    
    def rand(self):
        """RAND(a,b) = ((a = 36969 * (a & 65535) + (a >> 16)) << 16) + (b = 18000 * (b & 65535) + (b >> 16))"""
        self.a[0] = (36969 * (self.a[0] & 65535) + (self.a[0] >> 16)) & 0xffffffff
        self.a[1] = (18000 * (self.a[1] & 65535) + (self.a[1] >> 16)) & 0xffffffff
        return ((self.a[0] << 16) + self.a[1]) & 0xffffffff
    
    def fillrand(self, length):
        """Generate random bytes"""
        result = bytearray()
        for _ in range(length):
            if self.count == 4:
                self.r = self.rand()
                self.count = 0
            result.append((self.r >> (self.count * 8)) & 0xff)
            self.count += 1
        return bytes(result)

def enc_buffer(input_data, aes_ctx):
    """Encrypt buffer with CBC mode (matching C implementation)"""
    rng = Random()
    output = bytearray()
    
    # Generate and add IV
    iv = rng.fillrand(16)
    output.extend(iv)
    prev = bytearray(iv)
    
    pos = 0
    input_len = len(input_data)
    first = True
    needed = 15
    
    while pos < input_len or first:
        block = bytearray(16)
        
        if first:
            # First block: random byte with length encoding
            rand_byte = rng.fillrand(1)[0]
            block[0] = (rand_byte & ~15) | (input_len & 15)
        
        # Copy input data
        to_copy = min(input_len - pos, needed)
        block[16 - needed:16 - needed + to_copy] = input_data[pos:pos + to_copy]
        pos += to_copy
        
        # XOR with previous ciphertext (CBC)
        for i in range(16):
            block[i] ^= prev[i]
        
        # Encrypt
        encrypted = aes_ctx.encrypt(bytes(block))
        output.extend(encrypted)
        prev = bytearray(encrypted)
        
        if pos >= input_len and not first:
            break
        
        first = False
        needed = 16
    
    return bytes(output)

def dec_buffer(input_data, aes_ctx):
    """Decrypt buffer with CBC mode (matching C implementation)"""
    if len(input_data) < 32:
        raise ValueError("Input too short")
    
    output = bytearray()
    
    # Read IV
    iv = input_data[0:16]
    pos = 16
    
    # Decrypt first block
    curr = input_data[pos:pos+16]
    pos += 16
    
    plain = bytearray(aes_ctx.decrypt(curr))
    for i in range(16):
        plain[i] ^= iv[i]
    
    flen = plain[0] & 15
    l = 15
    
    # Decrypt remaining blocks
    while pos < len(input_data):
        next_block = input_data[pos:pos+16]
        pos += 16
        
        # Copy decrypted data
        output.extend(plain[16 - l:16])
        
        # Decrypt next block
        plain = bytearray(aes_ctx.decrypt(next_block))
        for i in range(16):
            plain[i] ^= curr[i]
        
        curr = next_block
        l = 16
    
    # Handle last block
    l = 1 if l == 15 else 0
    flen += 1 - l
    if flen:
        output.extend(plain[l:l + flen])
    
    return bytes(output)

# Test
if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1 and sys.argv[1] == "test_buffer":
        # Test with input_small.asc
        print("Testing with input_small.asc...")
        
        # Read input data
        with open("input_small.asc", "rb") as f:
            input_data = f.read()
        
        print(f"Input length: {len(input_data)} bytes")
        print(f"First 100 chars: {input_data[:100].decode('ascii', errors='ignore')}")
        
        # Parse key
        key_hex = "1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321"
        key = bytes.fromhex(key_hex)
        
        # Encrypt
        aes_enc = AES(key)
        encrypted = enc_buffer(input_data, aes_enc)
        print(f"\nEncrypted length: {len(encrypted)} bytes")
        
        # Decrypt
        aes_dec = AES(key)
        decrypted = dec_buffer(encrypted, aes_dec)
        print(f"Decrypted length: {len(decrypted)} bytes")
        
        # Verify
        if input_data == decrypted:
            print("\n✓ SUCCESS: Decrypted data matches original!")
            print(f"First 100 chars of decrypted: {decrypted[:100].decode('ascii', errors='ignore')}")
        else:
            print("\n✗ FAIL: Decrypted data does NOT match original!")
            print(f"Expected length: {len(input_data)}, got: {len(decrypted)}")
            # Find first difference
            for i in range(min(len(input_data), len(decrypted))):
                if input_data[i] != decrypted[i]:
                    print(f"First difference at byte {i}: expected {input_data[i]:02x}, got {decrypted[i]:02x}")
                    break
    else:
        # Test with known vector
        key = bytes.fromhex("000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f")
        plaintext = bytes.fromhex("00112233445566778899aabbccddeeff")
        
        aes = AES(key)
        
        print("Key:       ", key.hex())
        print("Plaintext: ", plaintext.hex())
        
        ciphertext = aes.encrypt(plaintext)
        print("Ciphertext:", ciphertext.hex())
        
        decrypted = aes.decrypt(ciphertext)
        print("Decrypted: ", decrypted.hex())
        
        if plaintext == decrypted:
            print("✓ SUCCESS: Decryption matches plaintext!")
        else:
            print("✗ FAIL: Decryption does not match plaintext!")

