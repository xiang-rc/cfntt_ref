import random
import math

#precompute the twiddle factors
w_rom = []
kesai = 7
q = 12289
inv_kesai = pow(kesai,2047) % q

def bitreverse(n,l):
    r = 0
    for i in range(l):
        r = (r << 1) | (n & 1)
        n = n >> 1
    return r

for i in range(1024):
    w_rom.append(pow(kesai,bitreverse(i,10)) % q)

#print(w_rom)
#print(len(w_rom))
#print(inv_kesai)


def DIT_NR_NTT(a,w_rom):
    n = len(a)
    log_n = int(math.log(n,2))
    r = 1
    for p in range(log_n-1,-1,-1):
        J = int(pow(2,p))
        for k in range(int(n/(2*J))):
            w = w_rom[r]
            r = r + 1
            for j in range(J):
                u = a[k*2*J+j] % q
                t = (a[k*2*J+j+J] * w) % q
                a[k*2*J+j] = (u + t) % q
                a[k*2*J+j+J] = (u - t) % q

    return a

def op21(a):
    if a & 1 == 0:
        r = (a >> 1) % q
    else:
        r = ((a >> 1) + ((q + 1)>>1)) % q
    return r

def DIF_RN_INTT(a,w_rom):
    n = len(a)
    log_n = int(math.log(n,2))
    r = len(w_rom)-1
    for i in range(log_n):
        J = int(pow(2,i))
        for k in range(int(n/(2*J))):
            w = w_rom[r]
            r = r - 1
            for j in range(J):
                u = a[k*2*J+j] % q
                t = a[k*2*J+j+J] % q
                a[k*2*J+j] = (op21(u + t)) % q
                a[k*2*J+j+J] = (op21(t - u) * w) % q
    return a

def pwm(x,y):
    q = 12289
    N = len(x)
    z = []
    for i in range(N):
        z.append((x[i] * y[i]) % q)
    return z


def test():
    a = []
    for i in range(1024):
        a.append(i)
    b = [0] * 1024
    b[0] = 1
    ffta = DIT_NR_NTT(a,w_rom)
    fftb = DIT_NR_NTT(b,w_rom)
    print("ffta = ",ffta)
    print("fftb = ",fftb)

    c = pwm(ffta,fftb)
    print("c = ",c)

    ifftc = DIF_RN_INTT(c,w_rom)
    print("ifftc = ",ifftc)

test()
