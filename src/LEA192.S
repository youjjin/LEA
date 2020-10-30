.section .rodata

.section .data
.align 3
LEA192KEYTABLE:
	.word 0x003a0fd4, 0x02497010, 0x194f7db1, 0x090d0883
	.word 0x2ff5805a, 0xc2580b27, 0x11fdcbb1, 0x9e98e0c8
	.word 0x18b570cf, 0x9dc53a79, 0x5c145788, 0x9771b5e5
	.word 0xf30f7bb5, 0x6d6628db, 0xb74e5dad, 0xa65e46d0
	.word 0x6f44da96, 0xf643115f, 0x74120631, 0xdac9bd17
	.word 0xcd1ecf34, 0x540f76f1, 0xaa1a5bdb, 0xfbafaae7
	.word 0x13f8a031, 0x34f28728, 0x31fdb409, 0x0e31481b
	.word 0xdf498117, 0xcf9371f1, 0x0967c312, 0xb3484ec8
	.word 0x3aae5b3d, 0x5a9714a0, 0xb2d4dd5f, 0x3a1fcdf7
	.word 0x0ac47404, 0x59e9e54d, 0xa60dc00a, 0x566139d3
	.word 0x898dce4f, 0x582d72dd, 0x77f3ea4c, 0xe2a73c8d
	.word 0xb8f1249a, 0x6a172700, 0xbc0e539c, 0x2e46fdbb
	.word 0xb4e0e98a, 0x3d028c05, 0xb8d3a050, 0xdbd67bef
	.word 0xdf675c7a, 0x99eefbb0, 0xe68584f6, 0xce31ef45
	.word 0x96c105ac, 0x2a1be677, 0x9d72b8b0, 0x33cecc54
	.word 0xc22ffd76, 0x1ab7167e, 0x42bb3060, 0x7da517f5
	.word 0x4aa0e8d3, 0x0a070c3c, 0xe200a765, 0xc2be17b3
	.word 0x7f22543f, 0x3e4eb7a1, 0xc992a6f4, 0xa783c823
	.word 0xc13cc747, 0xffcc8185, 0x66514e9e, 0xe4ccc199
	.word 0xcd5c766d, 0xa004f676, 0x1d3a1fa6, 0xd46894ec
	.word 0xf49c33e6, 0x782fda7e, 0x1fe6346c, 0x0ffe981c
	.word 0x78b97c3d, 0x956e8ee8, 0x49ab721c, 0x2672138a
	.word 0x037ea242, 0xce5fe8a4, 0x225f7158, 0x32d83e3e
	.word 0xe118f6aa, 0x1fb83751, 0x4d27715c, 0xed2fba4e
	.word 0x8dfbc56d, 0xe0a907db, 0xe4af091c, 0x5e123225
	.word 0xd0e8d2e1, 0xcc4501fb, 0x8422a8f0, 0x46a12f92
	.word 0x415152ad, 0xf55417f5, 0x38738248, 0xc6e29ded
	.word 0x5723715e, 0xabfa788c, 0xc3646af7, 0x64af9186
	.word 0x8fc855ec, 0x2bc36989, 0x5e6b28e3, 0xe0f5f592
	.word 0xeb3dd108, 0x0551012a, 0x50e4221d, 0x97e85c0f
	.word 0x4e258e14, 0x92298f0b, 0x771269c3, 0x6f934254
	.word 0xc0933b6b, 0x421159b8, 0xd76953f4, 0x6a3e36be
	.word 0x53b656fb, 0x610c22e0, 0x9f399330, 0xacf7e7e9
	.word 0xfe0b573b, 0xcbb73085, 0x89ed67fc, 0x77014cef
	.word 0xe1b8431f, 0xba1b4105, 0x06de3450, 0xb3f5b2fe
	.word 0xdf1cec27, 0xfb22bd10, 0x8e3de6fe, 0x3d4acd27
	.word 0xc5444873, 0x5bec968b, 0x8b2af393, 0x11e2f6ca
	.word 0x9cb3694f, 0x94c56b91, 0x939a1a93, 0x27f101bb
	.word 0x5381bae7, 0x48ebd1b1, 0xf6d5fca7, 0x0ca24bbc
	.word 0x7b03490b, 0xde00acfb, 0xc7f8abfe, 0x410a14c1
	.word 0xd37932a9, 0x14029327, 0xbd948525, 0x2c75004d
	.word 0xc52486d5, 0x0f07e2fa, 0x1963e1fd, 0x882719c3


.section .text

.global LEA192_ENC
.type LEA192_ENC, @function


LEA192_ENC:
/////////////////////////////////////
//s2,3,4,5 // s6~~s11 // temp --> t3, t4, t5, t6

   lw   s2,      0(a0)//0
   lw   s3,      4(a0)//1
   lw   s4,      8(a0)//2
   lw   s5,      12(a0)//3

   la      a2, LEA192KEYTABLE

//0 Round
   lw   s6,      0(a2) //r0
   lw   s7,      4(a2) //r1
   lw   s8,      8(a2) //r2
   lw   s9,      12(a2) //r3
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

     ////////////////////////////////////////////Routine end

//24 Round
   lw   s6,      576(a2) //r0
   lw   s7,      580(a2) //r1
   lw   s8,      584(a2) //r2
   lw   s9,      588(a2) //r3
   lw   s10,   592(a2) //r4
   lw   s11,   596(a2) //5

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

//25 Round

   lw   s6,      600(a2) //r0
   lw   s7,      604(a2) //r1
   lw   s8,      608(a2) //r2
   lw   s9,      612(a2) //r3
   lw   s10,   616(a2) //r4
   lw   s11,   620(a2) //55

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


//26 Round

   lw   s6,      624(a2) //r0
   lw   s7,      628(a2) //r1
   lw   s8,      632(a2) //r2
   lw   s9,      636(a2) //r3
   lw   s10,   640(a2) //r4
   lw   s11,   644(a2) //55

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

//27 Round

   lw   s6,      648(a2) //r0
   lw   s7,      652(a2) //r1
   lw   s8,      656(a2) //r2
   lw   s9,      660(a2) //r3
   lw   s10,   664(a2) //r4
   lw   s11,   668(a2) //55

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
