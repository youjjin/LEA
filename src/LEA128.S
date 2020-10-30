.section .rodata

.section .data
.align 3
LEA128KEYTABLE:
	.word 0x003a0fd4, 0x02497010, 0x194f7db1, 0x02497010
	.word 0x090d0883, 0x02497010, 0x11fdcbb1, 0x9e98e0c8
	.word 0x18b570cf, 0x9e98e0c8, 0x9dc53a79, 0x9e98e0c8
	.word 0xf30f7bb5, 0x6d6628db, 0xb74e5dad, 0x6d6628db
	.word 0xa65e46d0, 0x6d6628db, 0x74120631, 0xdac9bd17
	.word 0xcd1ecf34, 0xdac9bd17, 0x540f76f1, 0xdac9bd17
	.word 0x662147db, 0xc637c47a, 0x46518932, 0xc637c47a
	.word 0x23269260, 0xc637c47a, 0xe4dd5047, 0xf694285e
	.word 0xe1c2951d, 0xf694285e, 0x8ca5242c, 0xf694285e
	.word 0xbaf8e5ca, 0x3e936cd7, 0x0fc7e5b1, 0x3e936cd7
	.word 0xf1c8fa8c, 0x3e936cd7, 0x5522b80c, 0xee22ca78
	.word 0x8a6fa8b3, 0xee22ca78, 0x65637b74, 0xee22ca78
	.word 0x8a29279e, 0x6fb40ffe, 0x85c5f092, 0x6fb40ffe
	.word 0x92cc9f25, 0x6fb40ffe, 0x9dde584c, 0xcb00c87f
	.word 0x4780ad66, 0xcb00c87f, 0xe61b5dcb, 0xcb00c87f
	.word 0x4fa20466, 0xf728e276, 0xd255411b, 0xf728e276
	.word 0x656839ad, 0xf728e276, 0x9250d058, 0x51bd501f
	.word 0x1cb40dae, 0x51bd501f, 0x1abf218d, 0x51bd501f
	.word 0x21dd192d, 0x77c644e2, 0xcabfaa45, 0x77c644e2
	.word 0x681c207d, 0x77c644e2, 0xde7ac372, 0x9436afd0
	.word 0x10331d80, 0x9436afd0, 0xf326fe98, 0x9436afd0
	.word 0xfb3ac3d4, 0x93df660e, 0x2f65d8a3, 0x93df660e
	.word 0xdf92e761, 0x93df660e, 0x27620087, 0x265ef76e
	.word 0x4fb29864, 0x265ef76e, 0x2656ed1a, 0x265ef76e
	.word 0x227b88ec, 0xd0b3fa6f, 0xc86a08fd, 0xd0b3fa6f
	.word 0xa864cba9, 0xd0b3fa6f, 0xf1002361, 0xe5e85fc3
	.word 0x1f0b0408, 0xe5e85fc3, 0x488e7ac4, 0xe5e85fc3
	.word 0xc65415d5, 0x51e176b6, 0xeca88bf9, 0x51e176b6
	.word 0xedb89ece, 0x51e176b6, 0x9b6fb99c, 0x0548254b
	.word 0x8de9f7c2, 0x0548254b, 0xb6b4d146, 0x0548254b
	.word 0x7257f134, 0x06051a42, 0x36bcef01, 0x06051a42
	.word 0xb649d524, 0x06051a42, 0xa540fb03, 0x34b196e6
	.word 0xf7c80dad, 0x34b196e6, 0x71bc7dc4, 0x34b196e6
	.word 0x8fbee745, 0xcf744123, 0x907c0a60, 0xcf744123
	.word 0x8215ec35, 0xcf744123, 0x0bf6adba, 0xdf69029d
	.word 0x5b72305a, 0xdf69029d, 0xcb47c19f, 0xdf69029d


.section .text

.global LEA128_ENC
.type LEA128_ENC, @function


LEA128_ENC:
/////////////////////////////////////
//s2,3,4,5 // s6~~s11 // temp --> t3, t4, t5, t6

   lw   s2,      0(a0)//0
   lw   s3,      4(a0)//1
   lw   s4,      8(a0)//2
   lw   s5,      12(a0)//3

   la      a2, LEA128KEYTABLE

//0 Round
   lw   s6,    0(a2) //r0
   lw   s7,    4(a2) //r1
   lw   s8,    8(a2) //r2
   lw   s9,    12(a2) //r3
   lw   s10,   16(a2) //r4
   lw   s11,   20(a2) //5

   xor   t3,   s2,   s6

   xor t4,   s7, s3
   xor t5,   s9, s4
   xor s5,   s11, s5

   add s3, t3, t4
   slli	t6, s3, 9
   srli	s3, s3, 23
   or	s3, s3, t6

   xor   t4, t4, s8
   add s4, t4,   t5
   srli	t6, s4, 5
   slli	s4, s4, 27
   or	s4, s4, t6

   xor   t5, t5, s10
   add s5, s5, t5
   srli	t6, s5, 3
   slli	s5, s5, 29
   or	s5, s5, t6

//1 Round

   lw   s6,      24(a2) //r0
   lw   s7,      28(a2) //r1
   lw   s8,      32(a2) //r2
   lw   s9,      36(a2) //r3
   lw   s10,   40(a2) //r4
   lw   s11,   44(a2) //55

   xor   t3,   s3,   s6

   xor t4,   s7, s4
   xor t5,   s9, s5
   xor s2,   s11, s2

   add s4, t3, t4
   slli	t6, s4, 9
   srli	s4, s4, 23
   or	s4, s4, t6

   xor   t4, t4, s8
   add s5, t4,   t5
   srli	t6, s5, 5
   slli	s5, s5, 27
   or	s5, s5, t6

   xor   t5, t5, s10
   add s2, s2, t5
   srli	t6, s2, 3
   slli	s2, s2, 29
   or	s2, s2, t6


//2 Round

   lw   s6,      48(a2) //r0
   lw   s7,      52(a2) //r1
   lw   s8,      56(a2) //r2
   lw   s9,      60(a2) //r3
   lw   s10,   64(a2) //r4
   lw   s11,   68(a2) //55

   xor   t3,   s4,   s6//

   xor t4,   s7, s5
   xor t5,   s9, s2
   xor s3,   s11, s3

   add s5, t3, t4
   slli	t6, s5, 9
   srli	s5, s5, 23
   or	s5, s5, t6

   xor   t4, t4, s8
   add s2, t4,   t5
	srli	t6, s2, 5
   slli	s2, s2, 27
   or	s2, s2, t6

   xor   t5, t5, s10
   add s3, s3, t5
   srli	t6, s3, 3
   slli	s3, s3, 29
   or	s3, s3, t6

//3 Round

   lw   s6,      72(a2) //r0
   lw   s7,      76(a2) //r1
   lw   s8,      80(a2) //r2
   lw   s9,      84(a2) //r3
   lw   s10,   88(a2) //r4
   lw   s11,   92(a2) //55

   xor   t3,   s5,   s6

   xor t4,   s7, s2
   xor t5,   s9, s3
   xor s4,   s11, s4

   add s2, t3, t4
   slli	t6, s2, 9
   srli	s2, s2, 23
   or	s2, s2, t6

   xor   t4, t4, s8
   add s3, t4,   t5
	srli	t6, s3, 5
   slli	s3, s3, 27
   or	s3, s3, t6

   xor   t5, t5, s10
   add s4, s4, t5
   srli	t6, s4, 3
   slli	s4, s4, 29
   or	s4, s4, t6

////////////////////////////////////////////Routine end

//4 Round
   lw   s6,      96(a2) //r0
   lw   s7,      100(a2) //r1
   lw   s8,      104(a2) //r2
   lw   s9,      108(a2) //r3
   lw   s10,   112(a2) //r4
   lw   s11,   116(a2) //5
 	xor   t3,   s2,   s6

   xor t4,   s7, s3
   xor t5,   s9, s4
   xor s5,   s11, s5

   add s3, t3, t4
   slli	t6, s3, 9
   srli	s3, s3, 23
   or	s3, s3, t6

   xor   t4, t4, s8
   add s4, t4,   t5
   srli	t6, s4, 5
   slli	s4, s4, 27
   or	s4, s4, t6

   xor   t5, t5, s10
   add s5, s5, t5
   srli	t6, s5, 3
   slli	s5, s5, 29
   or	s5, s5, t6


//5 Round

   lw   s6,      120(a2) //r0
   lw   s7,      124(a2) //r1
   lw   s8,      128(a2) //r2
   lw   s9,      132(a2) //r3
   lw   s10,   136(a2) //r4
   lw   s11,   140(a2) //55

   xor   t3,   s3,   s6

   xor t4,   s7, s4
   xor t5,   s9, s5
   xor s2,   s11, s2

   add s4, t3, t4
   slli	t6, s4, 9
   srli	s4, s4, 23
   or	s4, s4, t6

   xor   t4, t4, s8
   add s5, t4,   t5
   srli	t6, s5, 5
   slli	s5, s5, 27
   or	s5, s5, t6

   xor   t5, t5, s10
   add s2, s2, t5
   srli	t6, s2, 3
   slli	s2, s2, 29
   or	s2, s2, t6


//6 Round

   lw   s6,      144(a2) //r0
   lw   s7,      148(a2) //r1
   lw   s8,      152(a2) //r2
   lw   s9,      156(a2) //r3
   lw   s10,   160(a2) //r4
   lw   s11,   164(a2) //55


   xor   t3,   s4,   s6//

   xor t4,   s7, s5
   xor t5,   s9, s2
   xor s3,   s11, s3

   add s5, t3, t4
   slli	t6, s5, 9
   srli	s5, s5, 23
   or	s5, s5, t6

   xor   t4, t4, s8
   add s2, t4,   t5
	srli	t6, s2, 5
   slli	s2, s2, 27
   or	s2, s2, t6

   xor   t5, t5, s10
   add s3, s3, t5
   srli	t6, s3, 3
   slli	s3, s3, 29
   or	s3, s3, t6

//7 Round

   lw   s6,      168(a2) //r0
   lw   s7,      172(a2) //r1
   lw   s8,      176(a2) //r2
   lw   s9,      180(a2) //r3
   lw   s10,   184(a2) //r4
   lw   s11,   188(a2) //55

   xor   t3,   s5,   s6

   xor t4,   s7, s2
   xor t5,   s9, s3
   xor s4,   s11, s4

   add s2, t3, t4
   slli	t6, s2, 9
   srli	s2, s2, 23
   or	s2, s2, t6

   xor   t4, t4, s8
   add s3, t4,   t5
	srli	t6, s3, 5
   slli	s3, s3, 27
   or	s3, s3, t6

   xor   t5, t5, s10
   add s4, s4, t5
   srli	t6, s4, 3
   slli	s4, s4, 29
   or	s4, s4, t6


////////////////////////////////////////////Routine end

//8 Round
   lw   s6,      192(a2) //r0
   lw   s7,      196(a2) //r1
   lw   s8,      200(a2) //r2
   lw   s9,      204(a2) //r3
   lw   s10,   208(a2) //r4
   lw   s11,   212(a2) //5

   xor   t3,   s2,   s6

   xor t4,   s7, s3
   xor t5,   s9, s4
   xor s5,   s11, s5

   add s3, t3, t4
   slli	t6, s3, 9
   srli	s3, s3, 23
   or	s3, s3, t6

   xor   t4, t4, s8
   add s4, t4,   t5
   srli	t6, s4, 5
   slli	s4, s4, 27
   or	s4, s4, t6

   xor   t5, t5, s10
   add s5, s5, t5
   srli	t6, s5, 3
   slli	s5, s5, 29
   or	s5, s5, t6

//9 Round

   lw   s6,      216(a2) //r0
   lw   s7,      220(a2) //r1
   lw   s8,      224(a2) //r2
   lw   s9,      228(a2) //r3
   lw   s10,   232(a2) //r4
   lw   s11,   236(a2) //55

   xor   t3,   s3,   s6

   xor t4,   s7, s4
   xor t5,   s9, s5
   xor s2,   s11, s2

   add s4, t3, t4
   slli	t6, s4, 9
   srli	s4, s4, 23
   or	s4, s4, t6

   xor   t4, t4, s8
   add s5, t4,   t5
   srli	t6, s5, 5
   slli	s5, s5, 27
   or	s5, s5, t6

   xor   t5, t5, s10
   add s2, s2, t5
   srli	t6, s2, 3
   slli	s2, s2, 29
   or	s2, s2, t6

//10 Round

   lw   s6,      240(a2) //r0
   lw   s7,      244(a2) //r1
   lw   s8,      248(a2) //r2
   lw   s9,      252(a2) //r3
   lw   s10,   256(a2) //r4
   lw   s11,   260(a2) //55

   xor   t3,   s4,   s6//

   xor t4,   s7, s5
   xor t5,   s9, s2
   xor s3,   s11, s3

   add s5, t3, t4
   slli	t6, s5, 9
   srli	s5, s5, 23
   or	s5, s5, t6

   xor   t4, t4, s8
   add s2, t4,   t5
	srli	t6, s2, 5
   slli	s2, s2, 27
   or	s2, s2, t6

   xor   t5, t5, s10
   add s3, s3, t5
   srli	t6, s3, 3
   slli	s3, s3, 29
   or	s3, s3, t6

//11 Round

   lw   s6,      264(a2) //r0
   lw   s7,      268(a2) //r1
   lw   s8,      272(a2) //r2
   lw   s9,      276(a2) //r3
   lw   s10,   280(a2) //r4
   lw   s11,   284(a2) //55

   xor   t3,   s5,   s6

   xor t4,   s7, s2
   xor t5,   s9, s3
   xor s4,   s11, s4

   add s2, t3, t4
   slli	t6, s2, 9
   srli	s2, s2, 23
   or	s2, s2, t6

   xor   t4, t4, s8
   add s3, t4,   t5
	srli	t6, s3, 5
   slli	s3, s3, 27
   or	s3, s3, t6

   xor   t5, t5, s10
   add s4, s4, t5
   srli	t6, s4, 3
   slli	s4, s4, 29
   or	s4, s4, t6

////////////////////////////////////////////Routine end

//12 Round
   lw   s6,      288(a2) //r0
   lw   s7,      292(a2) //r1
   lw   s8,      296(a2) //r2
   lw   s9,      300(a2) //r3
   lw   s10,   304(a2) //r4
   lw   s11,   308(a2) //5

   xor   t3,   s2,   s6

   xor t4,   s7, s3
   xor t5,   s9, s4
   xor s5,   s11, s5

   add s3, t3, t4
   slli	t6, s3, 9
   srli	s3, s3, 23
   or	s3, s3, t6

   xor   t4, t4, s8
   add s4, t4,   t5
   srli	t6, s4, 5
   slli	s4, s4, 27
   or	s4, s4, t6

   xor   t5, t5, s10
   add s5, s5, t5
   srli	t6, s5, 3
   slli	s5, s5, 29
   or	s5, s5, t6


//13 Round

   lw   s6,      312(a2) //r0
   lw   s7,      316(a2) //r1
   lw   s8,      320(a2) //r2
   lw   s9,      324(a2) //r3
   lw   s10,   328(a2) //r4
   lw   s11,   332(a2) //55

   xor   t3,   s3,   s6

   xor t4,   s7, s4
   xor t5,   s9, s5
   xor s2,   s11, s2

   add s4, t3, t4
   slli	t6, s4, 9
   srli	s4, s4, 23
   or	s4, s4, t6

   xor   t4, t4, s8
   add s5, t4,   t5
   srli	t6, s5, 5
   slli	s5, s5, 27
   or	s5, s5, t6

   xor   t5, t5, s10
   add s2, s2, t5
   srli	t6, s2, 3
   slli	s2, s2, 29
   or	s2, s2, t6


//14 Round

   lw   s6,      336(a2) //r0
   lw   s7,      340(a2) //r1
   lw   s8,      344(a2) //r2
   lw   s9,      348(a2) //r3
   lw   s10,   352(a2) //r4
   lw   s11,   356(a2) //55

   xor   t3,   s4,   s6//

   xor t4,   s7, s5
   xor t5,   s9, s2
   xor s3,   s11, s3

   add s5, t3, t4
   slli	t6, s5, 9
   srli	s5, s5, 23
   or	s5, s5, t6

   xor   t4, t4, s8
   add s2, t4,   t5
	srli	t6, s2, 5
   slli	s2, s2, 27
   or	s2, s2, t6

   xor   t5, t5, s10
   add s3, s3, t5
   srli	t6, s3, 3
   slli	s3, s3, 29
   or	s3, s3, t6

//15 Round

   lw   s6,      360(a2) //r0
   lw   s7,      364(a2) //r1
   lw   s8,      368(a2) //r2
   lw   s9,      372(a2) //r3
   lw   s10,   376(a2) //r4
   lw   s11,   380(a2) //55

   xor   t3,   s5,   s6

   xor t4,   s7, s2
   xor t5,   s9, s3
   xor s4,   s11, s4

   add s2, t3, t4
   slli	t6, s2, 9
   srli	s2, s2, 23
   or	s2, s2, t6

   xor   t4, t4, s8
   add s3, t4,   t5
	srli	t6, s3, 5
   slli	s3, s3, 27
   or	s3, s3, t6

   xor   t5, t5, s10
   add s4, s4, t5
   srli	t6, s4, 3
   slli	s4, s4, 29
   or	s4, s4, t6

////////////////////////////////////////////Routine end

//16 Round
   lw   s6,      384(a2) //r0
   lw   s7,      388(a2) //r1
   lw   s8,      392(a2) //r2
   lw   s9,      396(a2) //r3
   lw   s10,   400(a2) //r4
   lw   s11,   404(a2) //5

   xor   t3,   s2,   s6

   xor t4,   s7, s3
   xor t5,   s9, s4
   xor s5,   s11, s5

   add s3, t3, t4
   slli	t6, s3, 9
   srli	s3, s3, 23
   or	s3, s3, t6

   xor   t4, t4, s8
   add s4, t4,   t5
   srli	t6, s4, 5
   slli	s4, s4, 27
   or	s4, s4, t6

   xor   t5, t5, s10
   add s5, s5, t5
   srli	t6, s5, 3
   slli	s5, s5, 29
   or	s5, s5, t6

//17 Round

   lw   s6,      408(a2) //r0
   lw   s7,      412(a2) //r1
   lw   s8,      416(a2) //r2
   lw   s9,      420(a2) //r3
   lw   s10,   424(a2) //r4
   lw   s11,   428(a2) //55

   xor   t3,   s3,   s6

   xor t4,   s7, s4
   xor t5,   s9, s5
   xor s2,   s11, s2

   add s4, t3, t4
   slli	t6, s4, 9
   srli	s4, s4, 23
   or	s4, s4, t6

   xor   t4, t4, s8
   add s5, t4,   t5
   srli	t6, s5, 5
   slli	s5, s5, 27
   or	s5, s5, t6

   xor   t5, t5, s10
   add s2, s2, t5
   srli	t6, s2, 3
   slli	s2, s2, 29
   or	s2, s2, t6


//18 Round

   lw   s6,      432(a2) //r0
   lw   s7,      436(a2) //r1
   lw   s8,      440(a2) //r2
   lw   s9,      444(a2) //r3
   lw   s10,   448(a2) //r4
   lw   s11,   452(a2) //55

   xor   t3,   s4,   s6//

   xor t4,   s7, s5
   xor t5,   s9, s2
   xor s3,   s11, s3

   add s5, t3, t4
   slli	t6, s5, 9
   srli	s5, s5, 23
   or	s5, s5, t6

   xor   t4, t4, s8
   add s2, t4,   t5
	srli	t6, s2, 5
   slli	s2, s2, 27
   or	s2, s2, t6

   xor   t5, t5, s10
   add s3, s3, t5
   srli	t6, s3, 3
   slli	s3, s3, 29
   or	s3, s3, t6

//19 Round

   lw   s6,      456(a2) //r0
   lw   s7,      460(a2) //r1
   lw   s8,      464(a2) //r2
   lw   s9,      468(a2) //r3
   lw   s10,   472(a2) //r4
   lw   s11,   476(a2) //55

   xor   t3,   s5,   s6

   xor t4,   s7, s2
   xor t5,   s9, s3
   xor s4,   s11, s4

   add s2, t3, t4
   slli	t6, s2, 9
   srli	s2, s2, 23
   or	s2, s2, t6

   xor   t4, t4, s8
   add s3, t4,   t5
	srli	t6, s3, 5
   slli	s3, s3, 27
   or	s3, s3, t6

   xor   t5, t5, s10
   add s4, s4, t5
   srli	t6, s4, 3
   slli	s4, s4, 29
   or	s4, s4, t6

   ////////////////////////////////////////////Routine end

//20 Round
   lw   s6,      480(a2) //r0
   lw   s7,      484(a2) //r1
   lw   s8,      488(a2) //r2
   lw   s9,      492(a2) //r3
   lw   s10,   496(a2) //r4
   lw   s11,   500(a2) //5

   xor   t3,   s2,   s6

   xor t4,   s7, s3
   xor t5,   s9, s4
   xor s5,   s11, s5

   add s3, t3, t4
   slli	t6, s3, 9
   srli	s3, s3, 23
   or	s3, s3, t6

   xor   t4, t4, s8
   add s4, t4,   t5
   srli	t6, s4, 5
   slli	s4, s4, 27
   or	s4, s4, t6

   xor   t5, t5, s10
   add s5, s5, t5
   srli	t6, s5, 3
   slli	s5, s5, 29
   or	s5, s5, t6

//21 Round

   lw   s6,      504(a2) //r0
   lw   s7,      508(a2) //r1
   lw   s8,      512(a2) //r2
   lw   s9,      516(a2) //r3
   lw   s10,   520(a2) //r4
   lw   s11,   524(a2) //55

   xor   t3,   s3,   s6

   xor t4,   s7, s4
   xor t5,   s9, s5
   xor s2,   s11, s2

   add s4, t3, t4
   slli	t6, s4, 9
   srli	s4, s4, 23
   or	s4, s4, t6

   xor   t4, t4, s8
   add s5, t4,   t5
   srli	t6, s5, 5
   slli	s5, s5, 27
   or	s5, s5, t6

   xor   t5, t5, s10
   add s2, s2, t5
   srli	t6, s2, 3
   slli	s2, s2, 29
   or	s2, s2, t6

//22 Round

   lw   s6,      528(a2) //r0
   lw   s7,      532(a2) //r1
   lw   s8,      536(a2) //r2
   lw   s9,      540(a2) //r3
   lw   s10,   544(a2) //r4
   lw   s11,   548(a2) //55

   xor   t3,   s4,   s6//

   xor t4,   s7, s5
   xor t5,   s9, s2
   xor s3,   s11, s3

   add s5, t3, t4
   slli	t6, s5, 9
   srli	s5, s5, 23
   or	s5, s5, t6

   xor   t4, t4, s8
   add s2, t4,   t5
	srli	t6, s2, 5
   slli	s2, s2, 27
   or	s2, s2, t6

   xor   t5, t5, s10
   add s3, s3, t5
   srli	t6, s3, 3
   slli	s3, s3, 29
   or	s3, s3, t6

//23 Round

   lw   s6,      552(a2) //r0
   lw   s7,      556(a2) //r1
   lw   s8,      560(a2) //r2
   lw   s9,      564(a2) //r3
   lw   s10,   568(a2) //r4
   lw   s11,   572(a2) //55


   xor   t3,   s5,   s6

   xor t4,   s7, s2
   xor t5,   s9, s3
   xor s4,   s11, s4

   add s2, t3, t4
   slli	t6, s2, 9
   srli	s2, s2, 23
   or	s2, s2, t6

   xor   t4, t4, s8
   add s3, t4,   t5
	srli	t6, s3, 5
   slli	s3, s3, 27
   or	s3, s3, t6

   xor   t5, t5, s10
   add s4, s4, t5
   srli	t6, s4, 3
   slli	s4, s4, 29
   or	s4, s4, t6

/////////////////////////////////////

   sw   s2,      0(a1)//0
   sw   s3,      4(a1)//1
   sw   s4,      8(a1)//2
   sw   s5,      12(a1)//3


   ret
