
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <sieve>:
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	e84a                	sd	s2,16(sp)
   8:	1800                	addi	s0,sp,48
   a:	892a                	mv	s2,a0
   c:	4611                	li	a2,4
   e:	fdc40593          	addi	a1,s0,-36
  12:	4cc000ef          	jal	4de <read>
  16:	c905                	beqz	a0,46 <sieve+0x46>
  18:	ec26                	sd	s1,24(sp)
  1a:	84aa                	mv	s1,a0
  1c:	4791                	li	a5,4
  1e:	02f50b63          	beq	a0,a5,54 <sieve+0x54>
  22:	524000ef          	jal	546 <getpid>
  26:	862a                	mv	a2,a0
  28:	8726                	mv	a4,s1
  2a:	4691                	li	a3,4
  2c:	00001597          	auipc	a1,0x1
  30:	a6458593          	addi	a1,a1,-1436 # a90 <malloc+0xfe>
  34:	4509                	li	a0,2
  36:	07f000ef          	jal	8b4 <fprintf>
  3a:	854a                	mv	a0,s2
  3c:	4b2000ef          	jal	4ee <close>
  40:	4505                	li	a0,1
  42:	484000ef          	jal	4c6 <exit>
  46:	ec26                	sd	s1,24(sp)
  48:	854a                	mv	a0,s2
  4a:	4a4000ef          	jal	4ee <close>
  4e:	4501                	li	a0,0
  50:	476000ef          	jal	4c6 <exit>
  54:	fdc42583          	lw	a1,-36(s0)
  58:	00001517          	auipc	a0,0x1
  5c:	a7050513          	addi	a0,a0,-1424 # ac8 <malloc+0x136>
  60:	07f000ef          	jal	8de <printf>
  64:	fd040513          	addi	a0,s0,-48
  68:	46e000ef          	jal	4d6 <pipe>
  6c:	02054263          	bltz	a0,90 <sieve+0x90>
  70:	44e000ef          	jal	4be <fork>
  74:	02054e63          	bltz	a0,b0 <sieve+0xb0>
  78:	e525                	bnez	a0,e0 <sieve+0xe0>
  7a:	fd442503          	lw	a0,-44(s0)
  7e:	470000ef          	jal	4ee <close>
  82:	854a                	mv	a0,s2
  84:	46a000ef          	jal	4ee <close>
  88:	fd042503          	lw	a0,-48(s0)
  8c:	f75ff0ef          	jal	0 <sieve>
  90:	4b6000ef          	jal	546 <getpid>
  94:	862a                	mv	a2,a0
  96:	00001597          	auipc	a1,0x1
  9a:	a4258593          	addi	a1,a1,-1470 # ad8 <malloc+0x146>
  9e:	4509                	li	a0,2
  a0:	015000ef          	jal	8b4 <fprintf>
  a4:	854a                	mv	a0,s2
  a6:	448000ef          	jal	4ee <close>
  aa:	4505                	li	a0,1
  ac:	41a000ef          	jal	4c6 <exit>
  b0:	496000ef          	jal	546 <getpid>
  b4:	862a                	mv	a2,a0
  b6:	00001597          	auipc	a1,0x1
  ba:	a3a58593          	addi	a1,a1,-1478 # af0 <malloc+0x15e>
  be:	4509                	li	a0,2
  c0:	7f4000ef          	jal	8b4 <fprintf>
  c4:	854a                	mv	a0,s2
  c6:	428000ef          	jal	4ee <close>
  ca:	fd042503          	lw	a0,-48(s0)
  ce:	420000ef          	jal	4ee <close>
  d2:	fd442503          	lw	a0,-44(s0)
  d6:	418000ef          	jal	4ee <close>
  da:	4505                	li	a0,1
  dc:	3ea000ef          	jal	4c6 <exit>
  e0:	fd042503          	lw	a0,-48(s0)
  e4:	40a000ef          	jal	4ee <close>
  e8:	4611                	li	a2,4
  ea:	fd840593          	addi	a1,s0,-40
  ee:	854a                	mv	a0,s2
  f0:	3ee000ef          	jal	4de <read>
  f4:	4791                	li	a5,4
  f6:	04f51763          	bne	a0,a5,144 <sieve+0x144>
  fa:	fd842783          	lw	a5,-40(s0)
  fe:	fdc42703          	lw	a4,-36(s0)
 102:	02e7e7bb          	remw	a5,a5,a4
 106:	d3ed                	beqz	a5,e8 <sieve+0xe8>
 108:	4611                	li	a2,4
 10a:	fd840593          	addi	a1,s0,-40
 10e:	fd442503          	lw	a0,-44(s0)
 112:	3d4000ef          	jal	4e6 <write>
 116:	4791                	li	a5,4
 118:	fcf508e3          	beq	a0,a5,e8 <sieve+0xe8>
 11c:	42a000ef          	jal	546 <getpid>
 120:	862a                	mv	a2,a0
 122:	00001597          	auipc	a1,0x1
 126:	9e658593          	addi	a1,a1,-1562 # b08 <malloc+0x176>
 12a:	4509                	li	a0,2
 12c:	788000ef          	jal	8b4 <fprintf>
 130:	854a                	mv	a0,s2
 132:	3bc000ef          	jal	4ee <close>
 136:	fd442503          	lw	a0,-44(s0)
 13a:	3b4000ef          	jal	4ee <close>
 13e:	4505                	li	a0,1
 140:	386000ef          	jal	4c6 <exit>
 144:	00054f63          	bltz	a0,162 <sieve+0x162>
 148:	854a                	mv	a0,s2
 14a:	3a4000ef          	jal	4ee <close>
 14e:	fd442503          	lw	a0,-44(s0)
 152:	39c000ef          	jal	4ee <close>
 156:	4501                	li	a0,0
 158:	376000ef          	jal	4ce <wait>
 15c:	4501                	li	a0,0
 15e:	368000ef          	jal	4c6 <exit>
 162:	3e4000ef          	jal	546 <getpid>
 166:	862a                	mv	a2,a0
 168:	00001597          	auipc	a1,0x1
 16c:	9b858593          	addi	a1,a1,-1608 # b20 <malloc+0x18e>
 170:	4509                	li	a0,2
 172:	742000ef          	jal	8b4 <fprintf>
 176:	854a                	mv	a0,s2
 178:	376000ef          	jal	4ee <close>
 17c:	fd442503          	lw	a0,-44(s0)
 180:	36e000ef          	jal	4ee <close>
 184:	4505                	li	a0,1
 186:	340000ef          	jal	4c6 <exit>

000000000000018a <main>:
 18a:	7179                	addi	sp,sp,-48
 18c:	f406                	sd	ra,40(sp)
 18e:	f022                	sd	s0,32(sp)
 190:	ec26                	sd	s1,24(sp)
 192:	1800                	addi	s0,sp,48
 194:	fd840513          	addi	a0,s0,-40
 198:	33e000ef          	jal	4d6 <pipe>
 19c:	00054f63          	bltz	a0,1ba <main+0x30>
 1a0:	31e000ef          	jal	4be <fork>
 1a4:	02054863          	bltz	a0,1d4 <main+0x4a>
 1a8:	e139                	bnez	a0,1ee <main+0x64>
 1aa:	fdc42503          	lw	a0,-36(s0)
 1ae:	340000ef          	jal	4ee <close>
 1b2:	fd842503          	lw	a0,-40(s0)
 1b6:	e4bff0ef          	jal	0 <sieve>
 1ba:	38c000ef          	jal	546 <getpid>
 1be:	862a                	mv	a2,a0
 1c0:	00001597          	auipc	a1,0x1
 1c4:	91858593          	addi	a1,a1,-1768 # ad8 <malloc+0x146>
 1c8:	4509                	li	a0,2
 1ca:	6ea000ef          	jal	8b4 <fprintf>
 1ce:	4505                	li	a0,1
 1d0:	2f6000ef          	jal	4c6 <exit>
 1d4:	372000ef          	jal	546 <getpid>
 1d8:	862a                	mv	a2,a0
 1da:	00001597          	auipc	a1,0x1
 1de:	91658593          	addi	a1,a1,-1770 # af0 <malloc+0x15e>
 1e2:	4509                	li	a0,2
 1e4:	6d0000ef          	jal	8b4 <fprintf>
 1e8:	4505                	li	a0,1
 1ea:	2dc000ef          	jal	4c6 <exit>
 1ee:	fd842503          	lw	a0,-40(s0)
 1f2:	2fc000ef          	jal	4ee <close>
 1f6:	4789                	li	a5,2
 1f8:	fcf42a23          	sw	a5,-44(s0)
 1fc:	11800493          	li	s1,280
 200:	4611                	li	a2,4
 202:	fd440593          	addi	a1,s0,-44
 206:	fdc42503          	lw	a0,-36(s0)
 20a:	2dc000ef          	jal	4e6 <write>
 20e:	4791                	li	a5,4
 210:	02f51563          	bne	a0,a5,23a <main+0xb0>
 214:	fd442783          	lw	a5,-44(s0)
 218:	2785                	addiw	a5,a5,1
 21a:	0007871b          	sext.w	a4,a5
 21e:	fcf42a23          	sw	a5,-44(s0)
 222:	fce4dfe3          	bge	s1,a4,200 <main+0x76>
 226:	fdc42503          	lw	a0,-36(s0)
 22a:	2c4000ef          	jal	4ee <close>
 22e:	4501                	li	a0,0
 230:	29e000ef          	jal	4ce <wait>
 234:	4501                	li	a0,0
 236:	290000ef          	jal	4c6 <exit>
 23a:	30c000ef          	jal	546 <getpid>
 23e:	862a                	mv	a2,a0
 240:	00001597          	auipc	a1,0x1
 244:	90058593          	addi	a1,a1,-1792 # b40 <malloc+0x1ae>
 248:	4509                	li	a0,2
 24a:	66a000ef          	jal	8b4 <fprintf>
 24e:	fdc42503          	lw	a0,-36(s0)
 252:	29c000ef          	jal	4ee <close>
 256:	4505                	li	a0,1
 258:	26e000ef          	jal	4c6 <exit>

000000000000025c <start>:
 25c:	1141                	addi	sp,sp,-16
 25e:	e406                	sd	ra,8(sp)
 260:	e022                	sd	s0,0(sp)
 262:	0800                	addi	s0,sp,16
 264:	f27ff0ef          	jal	18a <main>
 268:	4501                	li	a0,0
 26a:	25c000ef          	jal	4c6 <exit>

000000000000026e <strcpy>:
 26e:	1141                	addi	sp,sp,-16
 270:	e422                	sd	s0,8(sp)
 272:	0800                	addi	s0,sp,16
 274:	87aa                	mv	a5,a0
 276:	0585                	addi	a1,a1,1
 278:	0785                	addi	a5,a5,1
 27a:	fff5c703          	lbu	a4,-1(a1)
 27e:	fee78fa3          	sb	a4,-1(a5)
 282:	fb75                	bnez	a4,276 <strcpy+0x8>
 284:	6422                	ld	s0,8(sp)
 286:	0141                	addi	sp,sp,16
 288:	8082                	ret

000000000000028a <strcmp>:
 28a:	1141                	addi	sp,sp,-16
 28c:	e422                	sd	s0,8(sp)
 28e:	0800                	addi	s0,sp,16
 290:	00054783          	lbu	a5,0(a0)
 294:	cb91                	beqz	a5,2a8 <strcmp+0x1e>
 296:	0005c703          	lbu	a4,0(a1)
 29a:	00f71763          	bne	a4,a5,2a8 <strcmp+0x1e>
 29e:	0505                	addi	a0,a0,1
 2a0:	0585                	addi	a1,a1,1
 2a2:	00054783          	lbu	a5,0(a0)
 2a6:	fbe5                	bnez	a5,296 <strcmp+0xc>
 2a8:	0005c503          	lbu	a0,0(a1)
 2ac:	40a7853b          	subw	a0,a5,a0
 2b0:	6422                	ld	s0,8(sp)
 2b2:	0141                	addi	sp,sp,16
 2b4:	8082                	ret

00000000000002b6 <strlen>:
 2b6:	1141                	addi	sp,sp,-16
 2b8:	e422                	sd	s0,8(sp)
 2ba:	0800                	addi	s0,sp,16
 2bc:	00054783          	lbu	a5,0(a0)
 2c0:	cf91                	beqz	a5,2dc <strlen+0x26>
 2c2:	0505                	addi	a0,a0,1
 2c4:	87aa                	mv	a5,a0
 2c6:	86be                	mv	a3,a5
 2c8:	0785                	addi	a5,a5,1
 2ca:	fff7c703          	lbu	a4,-1(a5)
 2ce:	ff65                	bnez	a4,2c6 <strlen+0x10>
 2d0:	40a6853b          	subw	a0,a3,a0
 2d4:	2505                	addiw	a0,a0,1
 2d6:	6422                	ld	s0,8(sp)
 2d8:	0141                	addi	sp,sp,16
 2da:	8082                	ret
 2dc:	4501                	li	a0,0
 2de:	bfe5                	j	2d6 <strlen+0x20>

00000000000002e0 <memset>:
 2e0:	1141                	addi	sp,sp,-16
 2e2:	e422                	sd	s0,8(sp)
 2e4:	0800                	addi	s0,sp,16
 2e6:	ca19                	beqz	a2,2fc <memset+0x1c>
 2e8:	87aa                	mv	a5,a0
 2ea:	1602                	slli	a2,a2,0x20
 2ec:	9201                	srli	a2,a2,0x20
 2ee:	00a60733          	add	a4,a2,a0
 2f2:	00b78023          	sb	a1,0(a5)
 2f6:	0785                	addi	a5,a5,1
 2f8:	fee79de3          	bne	a5,a4,2f2 <memset+0x12>
 2fc:	6422                	ld	s0,8(sp)
 2fe:	0141                	addi	sp,sp,16
 300:	8082                	ret

0000000000000302 <strchr>:
 302:	1141                	addi	sp,sp,-16
 304:	e422                	sd	s0,8(sp)
 306:	0800                	addi	s0,sp,16
 308:	00054783          	lbu	a5,0(a0)
 30c:	cb99                	beqz	a5,322 <strchr+0x20>
 30e:	00f58763          	beq	a1,a5,31c <strchr+0x1a>
 312:	0505                	addi	a0,a0,1
 314:	00054783          	lbu	a5,0(a0)
 318:	fbfd                	bnez	a5,30e <strchr+0xc>
 31a:	4501                	li	a0,0
 31c:	6422                	ld	s0,8(sp)
 31e:	0141                	addi	sp,sp,16
 320:	8082                	ret
 322:	4501                	li	a0,0
 324:	bfe5                	j	31c <strchr+0x1a>

0000000000000326 <gets>:
 326:	711d                	addi	sp,sp,-96
 328:	ec86                	sd	ra,88(sp)
 32a:	e8a2                	sd	s0,80(sp)
 32c:	e4a6                	sd	s1,72(sp)
 32e:	e0ca                	sd	s2,64(sp)
 330:	fc4e                	sd	s3,56(sp)
 332:	f852                	sd	s4,48(sp)
 334:	f456                	sd	s5,40(sp)
 336:	f05a                	sd	s6,32(sp)
 338:	ec5e                	sd	s7,24(sp)
 33a:	1080                	addi	s0,sp,96
 33c:	8baa                	mv	s7,a0
 33e:	8a2e                	mv	s4,a1
 340:	892a                	mv	s2,a0
 342:	4481                	li	s1,0
 344:	4aa9                	li	s5,10
 346:	4b35                	li	s6,13
 348:	89a6                	mv	s3,s1
 34a:	2485                	addiw	s1,s1,1
 34c:	0344d663          	bge	s1,s4,378 <gets+0x52>
 350:	4605                	li	a2,1
 352:	faf40593          	addi	a1,s0,-81
 356:	4501                	li	a0,0
 358:	186000ef          	jal	4de <read>
 35c:	00a05e63          	blez	a0,378 <gets+0x52>
 360:	faf44783          	lbu	a5,-81(s0)
 364:	00f90023          	sb	a5,0(s2)
 368:	01578763          	beq	a5,s5,376 <gets+0x50>
 36c:	0905                	addi	s2,s2,1
 36e:	fd679de3          	bne	a5,s6,348 <gets+0x22>
 372:	89a6                	mv	s3,s1
 374:	a011                	j	378 <gets+0x52>
 376:	89a6                	mv	s3,s1
 378:	99de                	add	s3,s3,s7
 37a:	00098023          	sb	zero,0(s3)
 37e:	855e                	mv	a0,s7
 380:	60e6                	ld	ra,88(sp)
 382:	6446                	ld	s0,80(sp)
 384:	64a6                	ld	s1,72(sp)
 386:	6906                	ld	s2,64(sp)
 388:	79e2                	ld	s3,56(sp)
 38a:	7a42                	ld	s4,48(sp)
 38c:	7aa2                	ld	s5,40(sp)
 38e:	7b02                	ld	s6,32(sp)
 390:	6be2                	ld	s7,24(sp)
 392:	6125                	addi	sp,sp,96
 394:	8082                	ret

0000000000000396 <stat>:
 396:	1101                	addi	sp,sp,-32
 398:	ec06                	sd	ra,24(sp)
 39a:	e822                	sd	s0,16(sp)
 39c:	e04a                	sd	s2,0(sp)
 39e:	1000                	addi	s0,sp,32
 3a0:	892e                	mv	s2,a1
 3a2:	4581                	li	a1,0
 3a4:	162000ef          	jal	506 <open>
 3a8:	02054263          	bltz	a0,3cc <stat+0x36>
 3ac:	e426                	sd	s1,8(sp)
 3ae:	84aa                	mv	s1,a0
 3b0:	85ca                	mv	a1,s2
 3b2:	16c000ef          	jal	51e <fstat>
 3b6:	892a                	mv	s2,a0
 3b8:	8526                	mv	a0,s1
 3ba:	134000ef          	jal	4ee <close>
 3be:	64a2                	ld	s1,8(sp)
 3c0:	854a                	mv	a0,s2
 3c2:	60e2                	ld	ra,24(sp)
 3c4:	6442                	ld	s0,16(sp)
 3c6:	6902                	ld	s2,0(sp)
 3c8:	6105                	addi	sp,sp,32
 3ca:	8082                	ret
 3cc:	597d                	li	s2,-1
 3ce:	bfcd                	j	3c0 <stat+0x2a>

00000000000003d0 <atoi>:
 3d0:	1141                	addi	sp,sp,-16
 3d2:	e422                	sd	s0,8(sp)
 3d4:	0800                	addi	s0,sp,16
 3d6:	00054683          	lbu	a3,0(a0)
 3da:	fd06879b          	addiw	a5,a3,-48
 3de:	0ff7f793          	zext.b	a5,a5
 3e2:	4625                	li	a2,9
 3e4:	02f66863          	bltu	a2,a5,414 <atoi+0x44>
 3e8:	872a                	mv	a4,a0
 3ea:	4501                	li	a0,0
 3ec:	0705                	addi	a4,a4,1
 3ee:	0025179b          	slliw	a5,a0,0x2
 3f2:	9fa9                	addw	a5,a5,a0
 3f4:	0017979b          	slliw	a5,a5,0x1
 3f8:	9fb5                	addw	a5,a5,a3
 3fa:	fd07851b          	addiw	a0,a5,-48
 3fe:	00074683          	lbu	a3,0(a4)
 402:	fd06879b          	addiw	a5,a3,-48
 406:	0ff7f793          	zext.b	a5,a5
 40a:	fef671e3          	bgeu	a2,a5,3ec <atoi+0x1c>
 40e:	6422                	ld	s0,8(sp)
 410:	0141                	addi	sp,sp,16
 412:	8082                	ret
 414:	4501                	li	a0,0
 416:	bfe5                	j	40e <atoi+0x3e>

0000000000000418 <memmove>:
 418:	1141                	addi	sp,sp,-16
 41a:	e422                	sd	s0,8(sp)
 41c:	0800                	addi	s0,sp,16
 41e:	02b57463          	bgeu	a0,a1,446 <memmove+0x2e>
 422:	00c05f63          	blez	a2,440 <memmove+0x28>
 426:	1602                	slli	a2,a2,0x20
 428:	9201                	srli	a2,a2,0x20
 42a:	00c507b3          	add	a5,a0,a2
 42e:	872a                	mv	a4,a0
 430:	0585                	addi	a1,a1,1
 432:	0705                	addi	a4,a4,1
 434:	fff5c683          	lbu	a3,-1(a1)
 438:	fed70fa3          	sb	a3,-1(a4)
 43c:	fef71ae3          	bne	a4,a5,430 <memmove+0x18>
 440:	6422                	ld	s0,8(sp)
 442:	0141                	addi	sp,sp,16
 444:	8082                	ret
 446:	00c50733          	add	a4,a0,a2
 44a:	95b2                	add	a1,a1,a2
 44c:	fec05ae3          	blez	a2,440 <memmove+0x28>
 450:	fff6079b          	addiw	a5,a2,-1
 454:	1782                	slli	a5,a5,0x20
 456:	9381                	srli	a5,a5,0x20
 458:	fff7c793          	not	a5,a5
 45c:	97ba                	add	a5,a5,a4
 45e:	15fd                	addi	a1,a1,-1
 460:	177d                	addi	a4,a4,-1
 462:	0005c683          	lbu	a3,0(a1)
 466:	00d70023          	sb	a3,0(a4)
 46a:	fee79ae3          	bne	a5,a4,45e <memmove+0x46>
 46e:	bfc9                	j	440 <memmove+0x28>

0000000000000470 <memcmp>:
 470:	1141                	addi	sp,sp,-16
 472:	e422                	sd	s0,8(sp)
 474:	0800                	addi	s0,sp,16
 476:	ca05                	beqz	a2,4a6 <memcmp+0x36>
 478:	fff6069b          	addiw	a3,a2,-1
 47c:	1682                	slli	a3,a3,0x20
 47e:	9281                	srli	a3,a3,0x20
 480:	0685                	addi	a3,a3,1
 482:	96aa                	add	a3,a3,a0
 484:	00054783          	lbu	a5,0(a0)
 488:	0005c703          	lbu	a4,0(a1)
 48c:	00e79863          	bne	a5,a4,49c <memcmp+0x2c>
 490:	0505                	addi	a0,a0,1
 492:	0585                	addi	a1,a1,1
 494:	fed518e3          	bne	a0,a3,484 <memcmp+0x14>
 498:	4501                	li	a0,0
 49a:	a019                	j	4a0 <memcmp+0x30>
 49c:	40e7853b          	subw	a0,a5,a4
 4a0:	6422                	ld	s0,8(sp)
 4a2:	0141                	addi	sp,sp,16
 4a4:	8082                	ret
 4a6:	4501                	li	a0,0
 4a8:	bfe5                	j	4a0 <memcmp+0x30>

00000000000004aa <memcpy>:
 4aa:	1141                	addi	sp,sp,-16
 4ac:	e406                	sd	ra,8(sp)
 4ae:	e022                	sd	s0,0(sp)
 4b0:	0800                	addi	s0,sp,16
 4b2:	f67ff0ef          	jal	418 <memmove>
 4b6:	60a2                	ld	ra,8(sp)
 4b8:	6402                	ld	s0,0(sp)
 4ba:	0141                	addi	sp,sp,16
 4bc:	8082                	ret

00000000000004be <fork>:
 4be:	4885                	li	a7,1
 4c0:	00000073          	ecall
 4c4:	8082                	ret

00000000000004c6 <exit>:
 4c6:	4889                	li	a7,2
 4c8:	00000073          	ecall
 4cc:	8082                	ret

00000000000004ce <wait>:
 4ce:	488d                	li	a7,3
 4d0:	00000073          	ecall
 4d4:	8082                	ret

00000000000004d6 <pipe>:
 4d6:	4891                	li	a7,4
 4d8:	00000073          	ecall
 4dc:	8082                	ret

00000000000004de <read>:
 4de:	4895                	li	a7,5
 4e0:	00000073          	ecall
 4e4:	8082                	ret

00000000000004e6 <write>:
 4e6:	48c1                	li	a7,16
 4e8:	00000073          	ecall
 4ec:	8082                	ret

00000000000004ee <close>:
 4ee:	48d5                	li	a7,21
 4f0:	00000073          	ecall
 4f4:	8082                	ret

00000000000004f6 <kill>:
 4f6:	4899                	li	a7,6
 4f8:	00000073          	ecall
 4fc:	8082                	ret

00000000000004fe <exec>:
 4fe:	489d                	li	a7,7
 500:	00000073          	ecall
 504:	8082                	ret

0000000000000506 <open>:
 506:	48bd                	li	a7,15
 508:	00000073          	ecall
 50c:	8082                	ret

000000000000050e <mknod>:
 50e:	48c5                	li	a7,17
 510:	00000073          	ecall
 514:	8082                	ret

0000000000000516 <unlink>:
 516:	48c9                	li	a7,18
 518:	00000073          	ecall
 51c:	8082                	ret

000000000000051e <fstat>:
 51e:	48a1                	li	a7,8
 520:	00000073          	ecall
 524:	8082                	ret

0000000000000526 <link>:
 526:	48cd                	li	a7,19
 528:	00000073          	ecall
 52c:	8082                	ret

000000000000052e <mkdir>:
 52e:	48d1                	li	a7,20
 530:	00000073          	ecall
 534:	8082                	ret

0000000000000536 <chdir>:
 536:	48a5                	li	a7,9
 538:	00000073          	ecall
 53c:	8082                	ret

000000000000053e <dup>:
 53e:	48a9                	li	a7,10
 540:	00000073          	ecall
 544:	8082                	ret

0000000000000546 <getpid>:
 546:	48ad                	li	a7,11
 548:	00000073          	ecall
 54c:	8082                	ret

000000000000054e <sbrk>:
 54e:	48b1                	li	a7,12
 550:	00000073          	ecall
 554:	8082                	ret

0000000000000556 <sleep>:
 556:	48b5                	li	a7,13
 558:	00000073          	ecall
 55c:	8082                	ret

000000000000055e <uptime>:
 55e:	48b9                	li	a7,14
 560:	00000073          	ecall
 564:	8082                	ret

0000000000000566 <putc>:
 566:	1101                	addi	sp,sp,-32
 568:	ec06                	sd	ra,24(sp)
 56a:	e822                	sd	s0,16(sp)
 56c:	1000                	addi	s0,sp,32
 56e:	feb407a3          	sb	a1,-17(s0)
 572:	4605                	li	a2,1
 574:	fef40593          	addi	a1,s0,-17
 578:	f6fff0ef          	jal	4e6 <write>
 57c:	60e2                	ld	ra,24(sp)
 57e:	6442                	ld	s0,16(sp)
 580:	6105                	addi	sp,sp,32
 582:	8082                	ret

0000000000000584 <printint>:
 584:	7139                	addi	sp,sp,-64
 586:	fc06                	sd	ra,56(sp)
 588:	f822                	sd	s0,48(sp)
 58a:	f426                	sd	s1,40(sp)
 58c:	0080                	addi	s0,sp,64
 58e:	84aa                	mv	s1,a0
 590:	c299                	beqz	a3,596 <printint+0x12>
 592:	0805c963          	bltz	a1,624 <printint+0xa0>
 596:	2581                	sext.w	a1,a1
 598:	4881                	li	a7,0
 59a:	fc040693          	addi	a3,s0,-64
 59e:	4701                	li	a4,0
 5a0:	2601                	sext.w	a2,a2
 5a2:	00000517          	auipc	a0,0x0
 5a6:	5c650513          	addi	a0,a0,1478 # b68 <digits>
 5aa:	883a                	mv	a6,a4
 5ac:	2705                	addiw	a4,a4,1
 5ae:	02c5f7bb          	remuw	a5,a1,a2
 5b2:	1782                	slli	a5,a5,0x20
 5b4:	9381                	srli	a5,a5,0x20
 5b6:	97aa                	add	a5,a5,a0
 5b8:	0007c783          	lbu	a5,0(a5)
 5bc:	00f68023          	sb	a5,0(a3)
 5c0:	0005879b          	sext.w	a5,a1
 5c4:	02c5d5bb          	divuw	a1,a1,a2
 5c8:	0685                	addi	a3,a3,1
 5ca:	fec7f0e3          	bgeu	a5,a2,5aa <printint+0x26>
 5ce:	00088c63          	beqz	a7,5e6 <printint+0x62>
 5d2:	fd070793          	addi	a5,a4,-48
 5d6:	00878733          	add	a4,a5,s0
 5da:	02d00793          	li	a5,45
 5de:	fef70823          	sb	a5,-16(a4)
 5e2:	0028071b          	addiw	a4,a6,2
 5e6:	02e05a63          	blez	a4,61a <printint+0x96>
 5ea:	f04a                	sd	s2,32(sp)
 5ec:	ec4e                	sd	s3,24(sp)
 5ee:	fc040793          	addi	a5,s0,-64
 5f2:	00e78933          	add	s2,a5,a4
 5f6:	fff78993          	addi	s3,a5,-1
 5fa:	99ba                	add	s3,s3,a4
 5fc:	377d                	addiw	a4,a4,-1
 5fe:	1702                	slli	a4,a4,0x20
 600:	9301                	srli	a4,a4,0x20
 602:	40e989b3          	sub	s3,s3,a4
 606:	fff94583          	lbu	a1,-1(s2)
 60a:	8526                	mv	a0,s1
 60c:	f5bff0ef          	jal	566 <putc>
 610:	197d                	addi	s2,s2,-1
 612:	ff391ae3          	bne	s2,s3,606 <printint+0x82>
 616:	7902                	ld	s2,32(sp)
 618:	69e2                	ld	s3,24(sp)
 61a:	70e2                	ld	ra,56(sp)
 61c:	7442                	ld	s0,48(sp)
 61e:	74a2                	ld	s1,40(sp)
 620:	6121                	addi	sp,sp,64
 622:	8082                	ret
 624:	40b005bb          	negw	a1,a1
 628:	4885                	li	a7,1
 62a:	bf85                	j	59a <printint+0x16>

000000000000062c <vprintf>:
 62c:	711d                	addi	sp,sp,-96
 62e:	ec86                	sd	ra,88(sp)
 630:	e8a2                	sd	s0,80(sp)
 632:	e0ca                	sd	s2,64(sp)
 634:	1080                	addi	s0,sp,96
 636:	0005c903          	lbu	s2,0(a1)
 63a:	26090863          	beqz	s2,8aa <vprintf+0x27e>
 63e:	e4a6                	sd	s1,72(sp)
 640:	fc4e                	sd	s3,56(sp)
 642:	f852                	sd	s4,48(sp)
 644:	f456                	sd	s5,40(sp)
 646:	f05a                	sd	s6,32(sp)
 648:	ec5e                	sd	s7,24(sp)
 64a:	e862                	sd	s8,16(sp)
 64c:	e466                	sd	s9,8(sp)
 64e:	8b2a                	mv	s6,a0
 650:	8a2e                	mv	s4,a1
 652:	8bb2                	mv	s7,a2
 654:	4981                	li	s3,0
 656:	4481                	li	s1,0
 658:	4701                	li	a4,0
 65a:	02500a93          	li	s5,37
 65e:	06400c13          	li	s8,100
 662:	06c00c93          	li	s9,108
 666:	a005                	j	686 <vprintf+0x5a>
 668:	85ca                	mv	a1,s2
 66a:	855a                	mv	a0,s6
 66c:	efbff0ef          	jal	566 <putc>
 670:	a019                	j	676 <vprintf+0x4a>
 672:	03598263          	beq	s3,s5,696 <vprintf+0x6a>
 676:	2485                	addiw	s1,s1,1
 678:	8726                	mv	a4,s1
 67a:	009a07b3          	add	a5,s4,s1
 67e:	0007c903          	lbu	s2,0(a5)
 682:	20090c63          	beqz	s2,89a <vprintf+0x26e>
 686:	0009079b          	sext.w	a5,s2
 68a:	fe0994e3          	bnez	s3,672 <vprintf+0x46>
 68e:	fd579de3          	bne	a5,s5,668 <vprintf+0x3c>
 692:	89be                	mv	s3,a5
 694:	b7cd                	j	676 <vprintf+0x4a>
 696:	00ea06b3          	add	a3,s4,a4
 69a:	0016c683          	lbu	a3,1(a3)
 69e:	8636                	mv	a2,a3
 6a0:	c681                	beqz	a3,6a8 <vprintf+0x7c>
 6a2:	9752                	add	a4,a4,s4
 6a4:	00274603          	lbu	a2,2(a4)
 6a8:	03878f63          	beq	a5,s8,6e6 <vprintf+0xba>
 6ac:	05978963          	beq	a5,s9,6fe <vprintf+0xd2>
 6b0:	07500713          	li	a4,117
 6b4:	0ee78363          	beq	a5,a4,79a <vprintf+0x16e>
 6b8:	07800713          	li	a4,120
 6bc:	12e78563          	beq	a5,a4,7e6 <vprintf+0x1ba>
 6c0:	07000713          	li	a4,112
 6c4:	14e78a63          	beq	a5,a4,818 <vprintf+0x1ec>
 6c8:	07300713          	li	a4,115
 6cc:	18e78a63          	beq	a5,a4,860 <vprintf+0x234>
 6d0:	02500713          	li	a4,37
 6d4:	04e79563          	bne	a5,a4,71e <vprintf+0xf2>
 6d8:	02500593          	li	a1,37
 6dc:	855a                	mv	a0,s6
 6de:	e89ff0ef          	jal	566 <putc>
 6e2:	4981                	li	s3,0
 6e4:	bf49                	j	676 <vprintf+0x4a>
 6e6:	008b8913          	addi	s2,s7,8
 6ea:	4685                	li	a3,1
 6ec:	4629                	li	a2,10
 6ee:	000ba583          	lw	a1,0(s7)
 6f2:	855a                	mv	a0,s6
 6f4:	e91ff0ef          	jal	584 <printint>
 6f8:	8bca                	mv	s7,s2
 6fa:	4981                	li	s3,0
 6fc:	bfad                	j	676 <vprintf+0x4a>
 6fe:	06400793          	li	a5,100
 702:	02f68963          	beq	a3,a5,734 <vprintf+0x108>
 706:	06c00793          	li	a5,108
 70a:	04f68263          	beq	a3,a5,74e <vprintf+0x122>
 70e:	07500793          	li	a5,117
 712:	0af68063          	beq	a3,a5,7b2 <vprintf+0x186>
 716:	07800793          	li	a5,120
 71a:	0ef68263          	beq	a3,a5,7fe <vprintf+0x1d2>
 71e:	02500593          	li	a1,37
 722:	855a                	mv	a0,s6
 724:	e43ff0ef          	jal	566 <putc>
 728:	85ca                	mv	a1,s2
 72a:	855a                	mv	a0,s6
 72c:	e3bff0ef          	jal	566 <putc>
 730:	4981                	li	s3,0
 732:	b791                	j	676 <vprintf+0x4a>
 734:	008b8913          	addi	s2,s7,8
 738:	4685                	li	a3,1
 73a:	4629                	li	a2,10
 73c:	000ba583          	lw	a1,0(s7)
 740:	855a                	mv	a0,s6
 742:	e43ff0ef          	jal	584 <printint>
 746:	2485                	addiw	s1,s1,1
 748:	8bca                	mv	s7,s2
 74a:	4981                	li	s3,0
 74c:	b72d                	j	676 <vprintf+0x4a>
 74e:	06400793          	li	a5,100
 752:	02f60763          	beq	a2,a5,780 <vprintf+0x154>
 756:	07500793          	li	a5,117
 75a:	06f60963          	beq	a2,a5,7cc <vprintf+0x1a0>
 75e:	07800793          	li	a5,120
 762:	faf61ee3          	bne	a2,a5,71e <vprintf+0xf2>
 766:	008b8913          	addi	s2,s7,8
 76a:	4681                	li	a3,0
 76c:	4641                	li	a2,16
 76e:	000ba583          	lw	a1,0(s7)
 772:	855a                	mv	a0,s6
 774:	e11ff0ef          	jal	584 <printint>
 778:	2489                	addiw	s1,s1,2
 77a:	8bca                	mv	s7,s2
 77c:	4981                	li	s3,0
 77e:	bde5                	j	676 <vprintf+0x4a>
 780:	008b8913          	addi	s2,s7,8
 784:	4685                	li	a3,1
 786:	4629                	li	a2,10
 788:	000ba583          	lw	a1,0(s7)
 78c:	855a                	mv	a0,s6
 78e:	df7ff0ef          	jal	584 <printint>
 792:	2489                	addiw	s1,s1,2
 794:	8bca                	mv	s7,s2
 796:	4981                	li	s3,0
 798:	bdf9                	j	676 <vprintf+0x4a>
 79a:	008b8913          	addi	s2,s7,8
 79e:	4681                	li	a3,0
 7a0:	4629                	li	a2,10
 7a2:	000ba583          	lw	a1,0(s7)
 7a6:	855a                	mv	a0,s6
 7a8:	dddff0ef          	jal	584 <printint>
 7ac:	8bca                	mv	s7,s2
 7ae:	4981                	li	s3,0
 7b0:	b5d9                	j	676 <vprintf+0x4a>
 7b2:	008b8913          	addi	s2,s7,8
 7b6:	4681                	li	a3,0
 7b8:	4629                	li	a2,10
 7ba:	000ba583          	lw	a1,0(s7)
 7be:	855a                	mv	a0,s6
 7c0:	dc5ff0ef          	jal	584 <printint>
 7c4:	2485                	addiw	s1,s1,1
 7c6:	8bca                	mv	s7,s2
 7c8:	4981                	li	s3,0
 7ca:	b575                	j	676 <vprintf+0x4a>
 7cc:	008b8913          	addi	s2,s7,8
 7d0:	4681                	li	a3,0
 7d2:	4629                	li	a2,10
 7d4:	000ba583          	lw	a1,0(s7)
 7d8:	855a                	mv	a0,s6
 7da:	dabff0ef          	jal	584 <printint>
 7de:	2489                	addiw	s1,s1,2
 7e0:	8bca                	mv	s7,s2
 7e2:	4981                	li	s3,0
 7e4:	bd49                	j	676 <vprintf+0x4a>
 7e6:	008b8913          	addi	s2,s7,8
 7ea:	4681                	li	a3,0
 7ec:	4641                	li	a2,16
 7ee:	000ba583          	lw	a1,0(s7)
 7f2:	855a                	mv	a0,s6
 7f4:	d91ff0ef          	jal	584 <printint>
 7f8:	8bca                	mv	s7,s2
 7fa:	4981                	li	s3,0
 7fc:	bdad                	j	676 <vprintf+0x4a>
 7fe:	008b8913          	addi	s2,s7,8
 802:	4681                	li	a3,0
 804:	4641                	li	a2,16
 806:	000ba583          	lw	a1,0(s7)
 80a:	855a                	mv	a0,s6
 80c:	d79ff0ef          	jal	584 <printint>
 810:	2485                	addiw	s1,s1,1
 812:	8bca                	mv	s7,s2
 814:	4981                	li	s3,0
 816:	b585                	j	676 <vprintf+0x4a>
 818:	e06a                	sd	s10,0(sp)
 81a:	008b8d13          	addi	s10,s7,8
 81e:	000bb983          	ld	s3,0(s7)
 822:	03000593          	li	a1,48
 826:	855a                	mv	a0,s6
 828:	d3fff0ef          	jal	566 <putc>
 82c:	07800593          	li	a1,120
 830:	855a                	mv	a0,s6
 832:	d35ff0ef          	jal	566 <putc>
 836:	4941                	li	s2,16
 838:	00000b97          	auipc	s7,0x0
 83c:	330b8b93          	addi	s7,s7,816 # b68 <digits>
 840:	03c9d793          	srli	a5,s3,0x3c
 844:	97de                	add	a5,a5,s7
 846:	0007c583          	lbu	a1,0(a5)
 84a:	855a                	mv	a0,s6
 84c:	d1bff0ef          	jal	566 <putc>
 850:	0992                	slli	s3,s3,0x4
 852:	397d                	addiw	s2,s2,-1
 854:	fe0916e3          	bnez	s2,840 <vprintf+0x214>
 858:	8bea                	mv	s7,s10
 85a:	4981                	li	s3,0
 85c:	6d02                	ld	s10,0(sp)
 85e:	bd21                	j	676 <vprintf+0x4a>
 860:	008b8993          	addi	s3,s7,8
 864:	000bb903          	ld	s2,0(s7)
 868:	00090f63          	beqz	s2,886 <vprintf+0x25a>
 86c:	00094583          	lbu	a1,0(s2)
 870:	c195                	beqz	a1,894 <vprintf+0x268>
 872:	855a                	mv	a0,s6
 874:	cf3ff0ef          	jal	566 <putc>
 878:	0905                	addi	s2,s2,1
 87a:	00094583          	lbu	a1,0(s2)
 87e:	f9f5                	bnez	a1,872 <vprintf+0x246>
 880:	8bce                	mv	s7,s3
 882:	4981                	li	s3,0
 884:	bbcd                	j	676 <vprintf+0x4a>
 886:	00000917          	auipc	s2,0x0
 88a:	2da90913          	addi	s2,s2,730 # b60 <malloc+0x1ce>
 88e:	02800593          	li	a1,40
 892:	b7c5                	j	872 <vprintf+0x246>
 894:	8bce                	mv	s7,s3
 896:	4981                	li	s3,0
 898:	bbf9                	j	676 <vprintf+0x4a>
 89a:	64a6                	ld	s1,72(sp)
 89c:	79e2                	ld	s3,56(sp)
 89e:	7a42                	ld	s4,48(sp)
 8a0:	7aa2                	ld	s5,40(sp)
 8a2:	7b02                	ld	s6,32(sp)
 8a4:	6be2                	ld	s7,24(sp)
 8a6:	6c42                	ld	s8,16(sp)
 8a8:	6ca2                	ld	s9,8(sp)
 8aa:	60e6                	ld	ra,88(sp)
 8ac:	6446                	ld	s0,80(sp)
 8ae:	6906                	ld	s2,64(sp)
 8b0:	6125                	addi	sp,sp,96
 8b2:	8082                	ret

00000000000008b4 <fprintf>:
 8b4:	715d                	addi	sp,sp,-80
 8b6:	ec06                	sd	ra,24(sp)
 8b8:	e822                	sd	s0,16(sp)
 8ba:	1000                	addi	s0,sp,32
 8bc:	e010                	sd	a2,0(s0)
 8be:	e414                	sd	a3,8(s0)
 8c0:	e818                	sd	a4,16(s0)
 8c2:	ec1c                	sd	a5,24(s0)
 8c4:	03043023          	sd	a6,32(s0)
 8c8:	03143423          	sd	a7,40(s0)
 8cc:	fe843423          	sd	s0,-24(s0)
 8d0:	8622                	mv	a2,s0
 8d2:	d5bff0ef          	jal	62c <vprintf>
 8d6:	60e2                	ld	ra,24(sp)
 8d8:	6442                	ld	s0,16(sp)
 8da:	6161                	addi	sp,sp,80
 8dc:	8082                	ret

00000000000008de <printf>:
 8de:	711d                	addi	sp,sp,-96
 8e0:	ec06                	sd	ra,24(sp)
 8e2:	e822                	sd	s0,16(sp)
 8e4:	1000                	addi	s0,sp,32
 8e6:	e40c                	sd	a1,8(s0)
 8e8:	e810                	sd	a2,16(s0)
 8ea:	ec14                	sd	a3,24(s0)
 8ec:	f018                	sd	a4,32(s0)
 8ee:	f41c                	sd	a5,40(s0)
 8f0:	03043823          	sd	a6,48(s0)
 8f4:	03143c23          	sd	a7,56(s0)
 8f8:	00840613          	addi	a2,s0,8
 8fc:	fec43423          	sd	a2,-24(s0)
 900:	85aa                	mv	a1,a0
 902:	4505                	li	a0,1
 904:	d29ff0ef          	jal	62c <vprintf>
 908:	60e2                	ld	ra,24(sp)
 90a:	6442                	ld	s0,16(sp)
 90c:	6125                	addi	sp,sp,96
 90e:	8082                	ret

0000000000000910 <free>:
 910:	1141                	addi	sp,sp,-16
 912:	e422                	sd	s0,8(sp)
 914:	0800                	addi	s0,sp,16
 916:	ff050693          	addi	a3,a0,-16
 91a:	00000797          	auipc	a5,0x0
 91e:	6e67b783          	ld	a5,1766(a5) # 1000 <freep>
 922:	a02d                	j	94c <free+0x3c>
 924:	4618                	lw	a4,8(a2)
 926:	9f2d                	addw	a4,a4,a1
 928:	fee52c23          	sw	a4,-8(a0)
 92c:	6398                	ld	a4,0(a5)
 92e:	6310                	ld	a2,0(a4)
 930:	a83d                	j	96e <free+0x5e>
 932:	ff852703          	lw	a4,-8(a0)
 936:	9f31                	addw	a4,a4,a2
 938:	c798                	sw	a4,8(a5)
 93a:	ff053683          	ld	a3,-16(a0)
 93e:	a091                	j	982 <free+0x72>
 940:	6398                	ld	a4,0(a5)
 942:	00e7e463          	bltu	a5,a4,94a <free+0x3a>
 946:	00e6ea63          	bltu	a3,a4,95a <free+0x4a>
 94a:	87ba                	mv	a5,a4
 94c:	fed7fae3          	bgeu	a5,a3,940 <free+0x30>
 950:	6398                	ld	a4,0(a5)
 952:	00e6e463          	bltu	a3,a4,95a <free+0x4a>
 956:	fee7eae3          	bltu	a5,a4,94a <free+0x3a>
 95a:	ff852583          	lw	a1,-8(a0)
 95e:	6390                	ld	a2,0(a5)
 960:	02059813          	slli	a6,a1,0x20
 964:	01c85713          	srli	a4,a6,0x1c
 968:	9736                	add	a4,a4,a3
 96a:	fae60de3          	beq	a2,a4,924 <free+0x14>
 96e:	fec53823          	sd	a2,-16(a0)
 972:	4790                	lw	a2,8(a5)
 974:	02061593          	slli	a1,a2,0x20
 978:	01c5d713          	srli	a4,a1,0x1c
 97c:	973e                	add	a4,a4,a5
 97e:	fae68ae3          	beq	a3,a4,932 <free+0x22>
 982:	e394                	sd	a3,0(a5)
 984:	00000717          	auipc	a4,0x0
 988:	66f73e23          	sd	a5,1660(a4) # 1000 <freep>
 98c:	6422                	ld	s0,8(sp)
 98e:	0141                	addi	sp,sp,16
 990:	8082                	ret

0000000000000992 <malloc>:
 992:	7139                	addi	sp,sp,-64
 994:	fc06                	sd	ra,56(sp)
 996:	f822                	sd	s0,48(sp)
 998:	f426                	sd	s1,40(sp)
 99a:	ec4e                	sd	s3,24(sp)
 99c:	0080                	addi	s0,sp,64
 99e:	02051493          	slli	s1,a0,0x20
 9a2:	9081                	srli	s1,s1,0x20
 9a4:	04bd                	addi	s1,s1,15
 9a6:	8091                	srli	s1,s1,0x4
 9a8:	0014899b          	addiw	s3,s1,1
 9ac:	0485                	addi	s1,s1,1
 9ae:	00000517          	auipc	a0,0x0
 9b2:	65253503          	ld	a0,1618(a0) # 1000 <freep>
 9b6:	c915                	beqz	a0,9ea <malloc+0x58>
 9b8:	611c                	ld	a5,0(a0)
 9ba:	4798                	lw	a4,8(a5)
 9bc:	08977a63          	bgeu	a4,s1,a50 <malloc+0xbe>
 9c0:	f04a                	sd	s2,32(sp)
 9c2:	e852                	sd	s4,16(sp)
 9c4:	e456                	sd	s5,8(sp)
 9c6:	e05a                	sd	s6,0(sp)
 9c8:	8a4e                	mv	s4,s3
 9ca:	0009871b          	sext.w	a4,s3
 9ce:	6685                	lui	a3,0x1
 9d0:	00d77363          	bgeu	a4,a3,9d6 <malloc+0x44>
 9d4:	6a05                	lui	s4,0x1
 9d6:	000a0b1b          	sext.w	s6,s4
 9da:	004a1a1b          	slliw	s4,s4,0x4
 9de:	00000917          	auipc	s2,0x0
 9e2:	62290913          	addi	s2,s2,1570 # 1000 <freep>
 9e6:	5afd                	li	s5,-1
 9e8:	a081                	j	a28 <malloc+0x96>
 9ea:	f04a                	sd	s2,32(sp)
 9ec:	e852                	sd	s4,16(sp)
 9ee:	e456                	sd	s5,8(sp)
 9f0:	e05a                	sd	s6,0(sp)
 9f2:	00000797          	auipc	a5,0x0
 9f6:	61e78793          	addi	a5,a5,1566 # 1010 <base>
 9fa:	00000717          	auipc	a4,0x0
 9fe:	60f73323          	sd	a5,1542(a4) # 1000 <freep>
 a02:	e39c                	sd	a5,0(a5)
 a04:	0007a423          	sw	zero,8(a5)
 a08:	b7c1                	j	9c8 <malloc+0x36>
 a0a:	6398                	ld	a4,0(a5)
 a0c:	e118                	sd	a4,0(a0)
 a0e:	a8a9                	j	a68 <malloc+0xd6>
 a10:	01652423          	sw	s6,8(a0)
 a14:	0541                	addi	a0,a0,16
 a16:	efbff0ef          	jal	910 <free>
 a1a:	00093503          	ld	a0,0(s2)
 a1e:	c12d                	beqz	a0,a80 <malloc+0xee>
 a20:	611c                	ld	a5,0(a0)
 a22:	4798                	lw	a4,8(a5)
 a24:	02977263          	bgeu	a4,s1,a48 <malloc+0xb6>
 a28:	00093703          	ld	a4,0(s2)
 a2c:	853e                	mv	a0,a5
 a2e:	fef719e3          	bne	a4,a5,a20 <malloc+0x8e>
 a32:	8552                	mv	a0,s4
 a34:	b1bff0ef          	jal	54e <sbrk>
 a38:	fd551ce3          	bne	a0,s5,a10 <malloc+0x7e>
 a3c:	4501                	li	a0,0
 a3e:	7902                	ld	s2,32(sp)
 a40:	6a42                	ld	s4,16(sp)
 a42:	6aa2                	ld	s5,8(sp)
 a44:	6b02                	ld	s6,0(sp)
 a46:	a03d                	j	a74 <malloc+0xe2>
 a48:	7902                	ld	s2,32(sp)
 a4a:	6a42                	ld	s4,16(sp)
 a4c:	6aa2                	ld	s5,8(sp)
 a4e:	6b02                	ld	s6,0(sp)
 a50:	fae48de3          	beq	s1,a4,a0a <malloc+0x78>
 a54:	4137073b          	subw	a4,a4,s3
 a58:	c798                	sw	a4,8(a5)
 a5a:	02071693          	slli	a3,a4,0x20
 a5e:	01c6d713          	srli	a4,a3,0x1c
 a62:	97ba                	add	a5,a5,a4
 a64:	0137a423          	sw	s3,8(a5)
 a68:	00000717          	auipc	a4,0x0
 a6c:	58a73c23          	sd	a0,1432(a4) # 1000 <freep>
 a70:	01078513          	addi	a0,a5,16
 a74:	70e2                	ld	ra,56(sp)
 a76:	7442                	ld	s0,48(sp)
 a78:	74a2                	ld	s1,40(sp)
 a7a:	69e2                	ld	s3,24(sp)
 a7c:	6121                	addi	sp,sp,64
 a7e:	8082                	ret
 a80:	7902                	ld	s2,32(sp)
 a82:	6a42                	ld	s4,16(sp)
 a84:	6aa2                	ld	s5,8(sp)
 a86:	6b02                	ld	s6,0(sp)
 a88:	b7f5                	j	a74 <malloc+0xe2>
