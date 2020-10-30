.section .rodata

.section .data
.align 3
LEA256KEYTABLE:
	.word 0x003a0fd4, 0x02497010, 0x194f7db1, 0x090d0883
	.word 0x2ff5805a, 0xc2580b27, 0xa83e7ef9, 0x053eca29
	.word 0xd359f988, 0x8101a243, 0x9bbf34b3, 0x9228434f
	.word 0x2efee506, 0x8b5f7bd4, 0x9991e811, 0x72dbc20c
	.word 0x2384c97f, 0xcefee47f, 0xc571782c, 0x00da90b1
	.word 0xb940a552, 0x5db79619, 0x4bc9a125, 0x5d08a419
	.word 0x72de26cc, 0xd69bc26f, 0x46a7f207, 0x66ff4d81
	.word 0xa87862fc, 0xa5f63601, 0x7909c4fa, 0xf3f93651
	.word 0x72cb0bcd, 0xae69b2e3, 0x80f2ca4b, 0xf13efcce
	.word 0x7869db69, 0x6b7a5b8e, 0xfefbf6b1, 0xec608c8e
	.word 0x76e9d5d2, 0x13ca4bf6, 0xc5eeec7a, 0xaa42a59d
	.word 0x1f22cd00, 0xfdd92bdc, 0xd6bbe3e8, 0x15d459ec
	.word 0xcda7632a, 0x9cf01bef, 0x6596e261, 0x8c1de14c
	.word 0x1127c3b8, 0x48b3f629, 0x3723d0e1, 0xfc0317ec
	.word 0x3fdd5378, 0x0201ae1d, 0xe55db65e, 0xe4c84dbc
	.word 0x3633db3f, 0xe4c24fc2, 0xbb1e1fd7, 0xa339425c
	.word 0xfe3e1bdf, 0xd61c808d, 0xbdca3449, 0xbeb8aa4e
	.word 0x145a9687, 0xeb6fcd87, 0x8b88ca72, 0x7677a84b
	.word 0xd11005e9, 0x558275c5, 0xbc742819, 0x3f17e888
	.word 0x20fcb71f, 0x60886959, 0x8d9446c4, 0x67d2d167
	.word 0x855a6aef, 0x69ea517c, 0x36e48e11, 0x0d3f4e86
	.word 0xbb0ede65, 0xcceecc06, 0xefc9c49f, 0x44902261
	.word 0xbd8549c0, 0xa7e7f682, 0x772101e6, 0xb4b9a250
	.word 0x6faa7b73, 0x7318b792, 0x1e57e751, 0xfd43b41c
	.word 0x4ec21b5f, 0xdcfbf30b, 0xa4046947, 0xbe0e781c
	.word 0xd74e21ac, 0x6b1f5d22, 0xe8b8e02b, 0x4a662d2d
	.word 0xb50f9ca9, 0x01c98c69, 0x9eb28089, 0x216cfd3f
	.word 0x92f0126b, 0x7b9961aa, 0x581f94ac, 0xab4be6dd
	.word 0xc2a91af5, 0xfb4e8e0c, 0x4c2c8f04, 0x81a45991
	.word 0x1fcb946c, 0xbccbb5b5, 0x808899cb, 0x8c1b2f89
	.word 0x192061be, 0x78e5cf04, 0xf239ab5c, 0xe8471e86
	.word 0x9e6217c7, 0xe5fdf35c, 0x83c3150d, 0x766887f8
	.word 0xa1092ac7, 0x6aa6f41d, 0x16e200f9, 0x6bdc26ca
	.word 0x52345706, 0xdb70d6af, 0xa8d8ffeb, 0x492ee661
	.word 0x4cd1e991, 0xd75d8352, 0x85a9c5fb, 0x1e0f569e
	.word 0x7ff7c600, 0x3f36a1d8, 0xe406ad00, 0x4ded8f16
	.word 0x512bb2f4, 0x772b192c, 0x2e6168bd, 0x76af67e1
	.word 0xd893a786, 0x3e276f69, 0xd11ee3ad, 0xb7f8c612
	.word 0xd3b19318, 0x89fee4db, 0xb6c3aedd, 0x05420f90
	.word 0x04f662f0, 0x8fb41a6c, 0x2f42dd5e, 0xa8ad1839
	.word 0x46474e45, 0x46418de0, 0x351550c8, 0x668014f6
	.word 0x04924365, 0x5f353d6f, 0x4eba8d76, 0x924a4318
	.word 0x5aba711c, 0xa36b1398, 0x5b3e7bf4, 0x7b3a2cf9
	.word 0x1d006ebe, 0x0d5683e5, 0x4f56916f, 0x215dccd2
	.word 0x9f57886f, 0x876d1357, 0x46013d49, 0x2a4932a3
	.word 0xaa285691, 0xebefe7d3, 0xe960e64b, 0xdd893f0f
	.word 0x6a234412, 0x495d13c9, 0x71c683e8, 0x8069dfd0
	.word 0x6c1a501d, 0x00699418, 0x262142f0, 0xa91a7393


.section .text

.global LEA256_ENC
.type LEA256_ENC, @function

LEA256_ENC:
/////////////////////////////////////
//s2,3,4,5 // s6~~s11 // temp --> t3, t4, t5, t6

   lw   s2,      0(a0)//0
   lw   s3,      4(a0)//1
   lw   s4,      8(a0)//2
   lw   s5,      12(a0)//3

   la      a2, LEA256KEYTABLE

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

       ////////////////////////////////////////////Routine end

//24 Round
   lw   s6,      672(a2) //r0
   lw   s7,      676(a2) //r1
   lw   s8,      680(a2) //r2
   lw   s9,      684(a2) //r3
   lw   s10,   688(a2) //r4
   lw   s11,   692(a2) //5

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

   lw   s6,      696(a2) //r0
   lw   s7,      700(a2) //r1
   lw   s8,      704(a2) //r2
   lw   s9,      708(a2) //r3
   lw   s10,   712(a2) //r4
   lw   s11,   716(a2) //55

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

   lw   s6,      720(a2) //r0
   lw   s7,      724(a2) //r1
   lw   s8,      728(a2) //r2
   lw   s9,      732(a2) //r3
   lw   s10,   736(a2) //r4
   lw   s11,   740(a2) //55

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

   lw   s6,      744(a2) //r0
   lw   s7,      748(a2) //r1
   lw   s8,      752(a2) //r2
   lw   s9,      756(a2) //r3
   lw   s10,   760(a2) //r4
   lw   s11,   764(a2) //55

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
