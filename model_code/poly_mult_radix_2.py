import random
import math

#precompute the twiddle factors
w_rom = []
kesai = 7
q = 12289
inv_kesai = pow(kesai,2047) % q

w_rom =  [1, 10810, 7143, 4043, 10984, 722, 5736, 8155, 3542, 8785, 9744, 3621, 10643, 1212, 3195, 5860, 7468, 2639, 9664, 11340, 
          11726, 9314, 9283, 9545, 5728, 7698, 5023, 5828, 8961, 6512, 7311, 1351, 2319, 11119, 11334, 11499, 9088, 3014, 5086, 
          10963, 4846, 9542, 9154, 3712, 4805, 8736, 11227, 9995, 3091, 12208, 7969, 11289, 9326, 7393, 9238, 2366, 11112, 8034, 
          10654, 9521, 12149, 10436, 7678, 11563, 1260, 4388, 4632, 6534, 2426, 334, 1428, 1696, 2013, 9000, 729, 3241, 2881, 3284, 
          7197, 10200, 8595, 7110, 10530, 8582, 3382, 11934, 9741, 8058, 3637, 3459, 145, 6747, 9558, 8357, 7399, 6378, 9447, 480, 
          1022, 9, 9821, 339, 5791, 544, 10616, 4278, 6958, 7300, 8112, 8705, 1381, 9764, 11336, 8541, 827, 5767, 2476, 118, 2197, 
          7222, 3949, 8993, 4452, 2396, 7935, 130, 2837, 6915, 2401, 442, 7188, 11222, 390, 773, 8456, 3778, 354, 4861, 9377, 5698, 
          5012, 9808, 2859, 11244, 1017, 7404, 1632, 7205, 27, 9223, 8526, 10849, 1537, 242, 4714, 8146, 9611, 3704, 5019, 11744, 1002, 
          5011, 5088, 8005, 7313, 10682, 8509, 11414, 9852, 3646, 6022, 2987, 9723, 10102, 6250, 9867, 11224, 2143, 11885, 7644, 1168, 
          5277, 11082, 3248, 493, 8193, 6845, 2381, 7952, 11854, 1378, 1912, 2166, 3915, 12176, 7370, 12129, 3149, 12286, 4437, 3636, 
          4938, 5291, 2704, 10863, 7635, 1663, 10512, 3364, 1689, 4057, 9018, 9442, 7875, 2174, 4372, 7247, 9984, 4053, 2645, 5195, 9509, 
          7394, 1484, 9042, 9603, 8311, 9320, 9919, 2865, 5332, 3510, 1630, 10163, 5407, 3186, 11136, 9405, 10040, 8241, 9890, 8889, 7098, 
          9153, 9289, 671, 3016, 243, 6730, 420, 10111, 1544, 3985, 4905, 3531, 476, 49, 1263, 5915, 1483, 9789, 10800, 10706, 6347, 1512, 
          350, 10474, 5383, 5369, 10232, 9087, 4493, 9551, 6421, 6554, 2655, 9280, 1693, 174, 723, 10314, 8532, 347, 2925, 8974, 11863, 1858, 
          4754, 3030, 4115, 2361, 10446, 2908, 218, 3434, 8760, 3963, 576, 6142, 9842, 1954, 10238, 9407, 10484, 3991, 8320, 9522, 156, 2281, 
          5876, 10258, 5333, 3772, 418, 5908, 11836, 5429, 7515, 7552, 1293, 295, 6099, 5766, 652, 8273, 4077, 8527, 9370, 325, 10885, 11143, 
          11341, 5990, 1159, 8561, 8240, 3329, 4298, 12121, 2692, 5961, 7183, 10327, 1594, 6167, 9734, 7105, 11089, 1360, 3956, 6170, 5297, 
          8210, 11231, 922, 441, 1958, 4322, 1112, 2078, 4046, 709, 9139, 1319, 4240, 8719, 6224, 11454, 2459, 683, 3656, 12225, 10723, 5782, 
          9341, 9786, 9166, 10542, 9235, 6803, 7856, 6370, 3834, 7032, 7048, 9369, 8120, 9162, 6821, 1010, 8807, 787, 5057, 4698, 4780, 8844, 
          12097, 1321, 4912, 10240, 677, 6415, 6234, 8953, 1323, 9523, 12237, 3174, 1579, 11858, 9784, 5906, 3957, 9450, 151, 10162, 12231, 
          12048, 3532, 11286, 1956, 7280, 11404, 6281, 3477, 6608, 142, 11184, 9445, 3438, 11314, 4212, 9260, 6695, 4782, 5886, 8076, 504, 
          2302, 11684, 11868, 8209, 3602, 6068, 8689, 3263, 6077, 7665, 7822, 7500, 6752, 4749, 4449, 6833, 12142, 8500, 6118, 8471, 1190, 
          9606, 3860, 5445, 7753, 11239, 5079, 9027, 2169, 11767, 7965, 4916, 8214, 5315, 11011, 9945, 1973, 6715, 8775, 11248, 5925, 11271, 
          654, 3565, 1702, 1987, 6760, 5206, 3199, 12233, 6136, 6427, 6874, 8646, 4948, 6152, 400, 10561, 5339, 5446, 3710, 6093, 468, 8301, 
          316, 11907, 10256, 8291, 3879, 1922, 10930, 6854, 973, 11035, 7, 1936, 845, 3723, 3154, 5054, 3285, 7929, 216, 50, 6763, 769, 767, 
          8484, 10076, 4153, 3120, 6184, 6203, 5646, 8348, 3753, 3536, 5370, 3229, 4730, 10583, 3929, 1282, 8717, 2021, 9457, 3944, 4099, 5604, 
          6759, 2171, 8809, 11024, 3007, 9344, 5349, 2633, 1406, 9057, 11996, 4855, 8520, 9348, 11722, 6627, 5289, 3837, 2595, 3221, 4273, 4050, 
          7082, 844, 5202, 11309, 11607, 4590, 7207, 8820, 6138, 7846, 8871, 4693, 2338, 9996, 11872, 1802, 1555, 5103, 10398, 7878, 10699, 1223, 
          9955, 11009, 614, 12265, 10918, 11385, 9804, 6742, 7250, 881, 11924, 1015, 10362, 5461, 9343, 2637, 7779, 4684, 3360, 7154, 63, 7302, 
          2373, 3670, 3808, 578, 5368, 11839, 1944, 7628, 11779, 9667, 6903, 5618, 10631, 5789, 3502, 5043, 826, 3090, 1398, 3065, 1506, 6586, 
          4483, 6389, 910, 7570, 11538, 4518, 3094, 1160, 4820, 2730, 5411, 10036, 1868, 2478, 9449, 4194, 3019, 10506, 7211, 7724, 4974, 7119, 
          2672, 11424, 1279, 189, 3116, 10526, 2209, 10759, 1694, 8420, 7866, 5832, 1350, 10555, 8474, 7014, 10499, 11038, 6879, 2035, 1040, 
          10407, 6164, 7519, 944, 5287, 8620, 6616, 9269, 6883, 7624, 4834, 2712, 9461, 4352, 8176, 72, 3840, 10447, 3451, 8195, 11048, 4378, 
          6508, 9244, 9646, 1095, 2873, 2827, 11498, 2434, 11169, 9754, 12268, 6481, 874, 9988, 170, 6639, 2307, 4289, 11641, 12139, 11259, 
          11823, 3821, 1681, 4649, 5969, 2929, 6026, 1573, 8443, 3793, 6226, 11787, 5118, 2602, 10388, 1849, 5776, 9021, 3795, 7988, 7766, 
          457, 12281, 11410, 9696, 982, 10013, 4218, 4390, 8835, 8531, 7785, 778, 530, 2626, 3578, 4697, 8823, 1701, 10243, 2940, 9332, 10808, 
          3317, 9757, 139, 3332, 343, 8841, 4538, 10381, 7078, 1866, 1208, 7562, 10584, 2450, 11873, 814, 716, 10179, 2164, 6873, 5412, 8080, 
          9011, 6296, 3515, 11851, 1218, 5061, 10753, 10568, 2429, 8186, 1373, 9307, 717, 8700, 8921, 4227, 4238, 11677, 8067, 1526, 11749, 12164, 
          3163, 4032, 6127, 7449, 1389, 10221, 4404, 11943, 3359, 9084, 5209, 1092, 3678, 4265, 10361, 464, 1826, 2926, 4489, 9118, 1136, 3449, 
          3708, 9051, 2065, 5826, 3495, 4564, 8755, 3961, 10533, 4145, 2275, 2461, 4267, 5653, 5063, 8113, 10771, 8524, 11014, 5508, 11113, 6555, 
          4860, 1125, 10844, 11158, 6302, 6693, 579, 3889, 9520, 3114, 6323, 212, 8314, 4883, 6454, 3087, 1417, 5676, 7784, 2257, 3744, 4963, 2528, 
          9233, 5102, 11877, 6701, 6444, 4924, 4781, 1014, 11841, 1327, 3607, 3942, 7057, 2717, 60, 3200, 10754, 5836, 7723, 2260, 68, 180, 4138, 
          7684, 2689, 10880, 7070, 204, 5509, 10821, 8308, 8882, 463, 10945, 9247, 9806, 10235, 4739, 8038, 6771, 1226, 9261, 5216, 11925, 9929, 
          11053, 9272, 7043, 4475, 3121, 4705, 1057, 9689, 11883, 10602, 146, 5268, 1403, 1804, 6094, 7100, 12050, 9389, 994, 4554, 4670, 11777, 
          5464, 4906, 3375, 9998, 8896, 4335, 7376, 3528, 3825, 8054, 9342, 8307, 636, 5609, 11667, 10552, 5672, 4499, 5598, 3344, 10397, 8665, 
          6565, 10964, 11260, 10344, 5959, 10141, 8330, 5797, 2442, 1248, 5115, 4939, 10975, 1744, 2894, 8635, 6599, 9834, 8342, 338, 3343, 8170, 
          1522, 10138, 12269, 5002, 4608, 5163, 4578, 377, 11914, 1620, 10453, 11864, 10104, 11897, 6085, 8122, 11251, 11366, 10058, 6197, 2800, 
          193, 506, 1255, 1392, 5784, 3276, 8951, 2212, 9615, 10347, 8881, 2575, 1165, 2776, 11111, 6811, 3511]


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
