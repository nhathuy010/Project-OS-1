
user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	1800                	addi	s0,sp,48
   a:	84aa                	mv	s1,a0
   c:	382000ef          	jal	38e <strlen>
  10:	02051793          	slli	a5,a0,0x20
  14:	9381                	srli	a5,a5,0x20
  16:	97a6                	add	a5,a5,s1
  18:	02f00693          	li	a3,47
  1c:	0097e963          	bltu	a5,s1,2e <fmtname+0x2e>
  20:	0007c703          	lbu	a4,0(a5)
  24:	00d70563          	beq	a4,a3,2e <fmtname+0x2e>
  28:	17fd                	addi	a5,a5,-1
  2a:	fe97fbe3          	bgeu	a5,s1,20 <fmtname+0x20>
  2e:	00178493          	addi	s1,a5,1
  32:	8526                	mv	a0,s1
  34:	35a000ef          	jal	38e <strlen>
  38:	2501                	sext.w	a0,a0
  3a:	47b5                	li	a5,13
  3c:	00a7f863          	bgeu	a5,a0,4c <fmtname+0x4c>
  40:	8526                	mv	a0,s1
  42:	70a2                	ld	ra,40(sp)
  44:	7402                	ld	s0,32(sp)
  46:	64e2                	ld	s1,24(sp)
  48:	6145                	addi	sp,sp,48
  4a:	8082                	ret
  4c:	e84a                	sd	s2,16(sp)
  4e:	e44e                	sd	s3,8(sp)
  50:	8526                	mv	a0,s1
  52:	33c000ef          	jal	38e <strlen>
  56:	00001997          	auipc	s3,0x1
  5a:	fba98993          	addi	s3,s3,-70 # 1010 <buf.0>
  5e:	0005061b          	sext.w	a2,a0
  62:	85a6                	mv	a1,s1
  64:	854e                	mv	a0,s3
  66:	48a000ef          	jal	4f0 <memmove>
  6a:	8526                	mv	a0,s1
  6c:	322000ef          	jal	38e <strlen>
  70:	0005091b          	sext.w	s2,a0
  74:	8526                	mv	a0,s1
  76:	318000ef          	jal	38e <strlen>
  7a:	1902                	slli	s2,s2,0x20
  7c:	02095913          	srli	s2,s2,0x20
  80:	4639                	li	a2,14
  82:	9e09                	subw	a2,a2,a0
  84:	4581                	li	a1,0
  86:	01298533          	add	a0,s3,s2
  8a:	32e000ef          	jal	3b8 <memset>
  8e:	84ce                	mv	s1,s3
  90:	6942                	ld	s2,16(sp)
  92:	69a2                	ld	s3,8(sp)
  94:	b775                	j	40 <fmtname+0x40>

0000000000000096 <searchDir>:
  96:	7171                	addi	sp,sp,-176
  98:	f506                	sd	ra,168(sp)
  9a:	f122                	sd	s0,160(sp)
  9c:	ed26                	sd	s1,152(sp)
  9e:	e94a                	sd	s2,144(sp)
  a0:	e54e                	sd	s3,136(sp)
  a2:	fcd6                	sd	s5,120(sp)
  a4:	f8da                	sd	s6,112(sp)
  a6:	1900                	addi	s0,sp,176
  a8:	8aaa                	mv	s5,a0
  aa:	84ae                	mv	s1,a1
  ac:	8932                	mv	s2,a2
  ae:	89b6                	mv	s3,a3
  b0:	8b3a                	mv	s6,a4
  b2:	2dc000ef          	jal	38e <strlen>
  b6:	2541                	addiw	a0,a0,16
  b8:	20000793          	li	a5,512
  bc:	08a7e963          	bltu	a5,a0,14e <searchDir+0xb8>
  c0:	e152                	sd	s4,128(sp)
  c2:	f4de                	sd	s7,104(sp)
  c4:	f0e2                	sd	s8,96(sp)
  c6:	ece6                	sd	s9,88(sp)
  c8:	85d6                	mv	a1,s5
  ca:	8526                	mv	a0,s1
  cc:	27a000ef          	jal	346 <strcpy>
  d0:	8526                	mv	a0,s1
  d2:	2bc000ef          	jal	38e <strlen>
  d6:	02051a13          	slli	s4,a0,0x20
  da:	020a5a13          	srli	s4,s4,0x20
  de:	9a26                	add	s4,s4,s1
  e0:	001a0b93          	addi	s7,s4,1
  e4:	02f00793          	li	a5,47
  e8:	00fa0023          	sb	a5,0(s4)
  ec:	4c05                	li	s8,1
  ee:	4c89                	li	s9,2
  f0:	4641                	li	a2,16
  f2:	f9040593          	addi	a1,s0,-112
  f6:	854a                	mv	a0,s2
  f8:	4be000ef          	jal	5b6 <read>
  fc:	47c1                	li	a5,16
  fe:	10f51263          	bne	a0,a5,202 <searchDir+0x16c>
 102:	f9045783          	lhu	a5,-112(s0)
 106:	d7ed                	beqz	a5,f0 <searchDir+0x5a>
 108:	4639                	li	a2,14
 10a:	f9240593          	addi	a1,s0,-110
 10e:	855e                	mv	a0,s7
 110:	3e0000ef          	jal	4f0 <memmove>
 114:	000a07a3          	sb	zero,15(s4)
 118:	85ce                	mv	a1,s3
 11a:	8526                	mv	a0,s1
 11c:	352000ef          	jal	46e <stat>
 120:	02054e63          	bltz	a0,15c <searchDir+0xc6>
 124:	00899783          	lh	a5,8(s3)
 128:	05878263          	beq	a5,s8,16c <searchDir+0xd6>
 12c:	fd9792e3          	bne	a5,s9,f0 <searchDir+0x5a>
 130:	8526                	mv	a0,s1
 132:	ecfff0ef          	jal	0 <fmtname>
 136:	85da                	mv	a1,s6
 138:	22a000ef          	jal	362 <strcmp>
 13c:	f955                	bnez	a0,f0 <searchDir+0x5a>
 13e:	85a6                	mv	a1,s1
 140:	00001517          	auipc	a0,0x1
 144:	a7050513          	addi	a0,a0,-1424 # bb0 <malloc+0x146>
 148:	06f000ef          	jal	9b6 <printf>
 14c:	b755                	j	f0 <searchDir+0x5a>
 14e:	00001517          	auipc	a0,0x1
 152:	a2250513          	addi	a0,a0,-1502 # b70 <malloc+0x106>
 156:	061000ef          	jal	9b6 <printf>
 15a:	a845                	j	20a <searchDir+0x174>
 15c:	85a6                	mv	a1,s1
 15e:	00001517          	auipc	a0,0x1
 162:	a2a50513          	addi	a0,a0,-1494 # b88 <malloc+0x11e>
 166:	051000ef          	jal	9b6 <printf>
 16a:	b759                	j	f0 <searchDir+0x5a>
 16c:	8526                	mv	a0,s1
 16e:	e93ff0ef          	jal	0 <fmtname>
 172:	00001597          	auipc	a1,0x1
 176:	a2e58593          	addi	a1,a1,-1490 # ba0 <malloc+0x136>
 17a:	1e8000ef          	jal	362 <strcmp>
 17e:	d92d                	beqz	a0,f0 <searchDir+0x5a>
 180:	8526                	mv	a0,s1
 182:	e7fff0ef          	jal	0 <fmtname>
 186:	00001597          	auipc	a1,0x1
 18a:	a2258593          	addi	a1,a1,-1502 # ba8 <malloc+0x13e>
 18e:	1d4000ef          	jal	362 <strcmp>
 192:	dd39                	beqz	a0,f0 <searchDir+0x5a>
 194:	e8ea                	sd	s10,80(sp)
 196:	4581                	li	a1,0
 198:	8526                	mv	a0,s1
 19a:	444000ef          	jal	5de <open>
 19e:	8d2a                	mv	s10,a0
 1a0:	f7840593          	addi	a1,s0,-136
 1a4:	854a                	mv	a0,s2
 1a6:	450000ef          	jal	5f6 <fstat>
 1aa:	02054b63          	bltz	a0,1e0 <searchDir+0x14a>
 1ae:	f7843783          	ld	a5,-136(s0)
 1b2:	f4f43823          	sd	a5,-176(s0)
 1b6:	f8043783          	ld	a5,-128(s0)
 1ba:	f4f43c23          	sd	a5,-168(s0)
 1be:	f8843783          	ld	a5,-120(s0)
 1c2:	f6f43023          	sd	a5,-160(s0)
 1c6:	875a                	mv	a4,s6
 1c8:	f5040693          	addi	a3,s0,-176
 1cc:	866a                	mv	a2,s10
 1ce:	85a6                	mv	a1,s1
 1d0:	8526                	mv	a0,s1
 1d2:	ec5ff0ef          	jal	96 <searchDir>
 1d6:	856a                	mv	a0,s10
 1d8:	3ee000ef          	jal	5c6 <close>
 1dc:	6d46                	ld	s10,80(sp)
 1de:	bf09                	j	f0 <searchDir+0x5a>
 1e0:	8656                	mv	a2,s5
 1e2:	00001597          	auipc	a1,0x1
 1e6:	9a658593          	addi	a1,a1,-1626 # b88 <malloc+0x11e>
 1ea:	4509                	li	a0,2
 1ec:	7a0000ef          	jal	98c <fprintf>
 1f0:	854a                	mv	a0,s2
 1f2:	3d4000ef          	jal	5c6 <close>
 1f6:	6a0a                	ld	s4,128(sp)
 1f8:	7ba6                	ld	s7,104(sp)
 1fa:	7c06                	ld	s8,96(sp)
 1fc:	6ce6                	ld	s9,88(sp)
 1fe:	6d46                	ld	s10,80(sp)
 200:	a029                	j	20a <searchDir+0x174>
 202:	6a0a                	ld	s4,128(sp)
 204:	7ba6                	ld	s7,104(sp)
 206:	7c06                	ld	s8,96(sp)
 208:	6ce6                	ld	s9,88(sp)
 20a:	70aa                	ld	ra,168(sp)
 20c:	740a                	ld	s0,160(sp)
 20e:	64ea                	ld	s1,152(sp)
 210:	694a                	ld	s2,144(sp)
 212:	69aa                	ld	s3,136(sp)
 214:	7ae6                	ld	s5,120(sp)
 216:	7b46                	ld	s6,112(sp)
 218:	614d                	addi	sp,sp,176
 21a:	8082                	ret

000000000000021c <find>:
 21c:	d9010113          	addi	sp,sp,-624
 220:	26113423          	sd	ra,616(sp)
 224:	26813023          	sd	s0,608(sp)
 228:	25213823          	sd	s2,592(sp)
 22c:	25313423          	sd	s3,584(sp)
 230:	1c80                	addi	s0,sp,624
 232:	892a                	mv	s2,a0
 234:	89ae                	mv	s3,a1
 236:	4581                	li	a1,0
 238:	3a6000ef          	jal	5de <open>
 23c:	04054063          	bltz	a0,27c <find+0x60>
 240:	24913c23          	sd	s1,600(sp)
 244:	84aa                	mv	s1,a0
 246:	db840593          	addi	a1,s0,-584
 24a:	3ac000ef          	jal	5f6 <fstat>
 24e:	04054063          	bltz	a0,28e <find+0x72>
 252:	dc041703          	lh	a4,-576(s0)
 256:	4785                	li	a5,1
 258:	04f70963          	beq	a4,a5,2aa <find+0x8e>
 25c:	8526                	mv	a0,s1
 25e:	368000ef          	jal	5c6 <close>
 262:	25813483          	ld	s1,600(sp)
 266:	26813083          	ld	ra,616(sp)
 26a:	26013403          	ld	s0,608(sp)
 26e:	25013903          	ld	s2,592(sp)
 272:	24813983          	ld	s3,584(sp)
 276:	27010113          	addi	sp,sp,624
 27a:	8082                	ret
 27c:	864a                	mv	a2,s2
 27e:	00001597          	auipc	a1,0x1
 282:	93a58593          	addi	a1,a1,-1734 # bb8 <malloc+0x14e>
 286:	4509                	li	a0,2
 288:	704000ef          	jal	98c <fprintf>
 28c:	bfe9                	j	266 <find+0x4a>
 28e:	864a                	mv	a2,s2
 290:	00001597          	auipc	a1,0x1
 294:	8f858593          	addi	a1,a1,-1800 # b88 <malloc+0x11e>
 298:	4509                	li	a0,2
 29a:	6f2000ef          	jal	98c <fprintf>
 29e:	8526                	mv	a0,s1
 2a0:	326000ef          	jal	5c6 <close>
 2a4:	25813483          	ld	s1,600(sp)
 2a8:	bf7d                	j	266 <find+0x4a>
 2aa:	db843783          	ld	a5,-584(s0)
 2ae:	d8f43823          	sd	a5,-624(s0)
 2b2:	dc043783          	ld	a5,-576(s0)
 2b6:	d8f43c23          	sd	a5,-616(s0)
 2ba:	dc843783          	ld	a5,-568(s0)
 2be:	daf43023          	sd	a5,-608(s0)
 2c2:	874e                	mv	a4,s3
 2c4:	d9040693          	addi	a3,s0,-624
 2c8:	8626                	mv	a2,s1
 2ca:	dd040593          	addi	a1,s0,-560
 2ce:	854a                	mv	a0,s2
 2d0:	dc7ff0ef          	jal	96 <searchDir>
 2d4:	b761                	j	25c <find+0x40>

00000000000002d6 <main>:
 2d6:	7179                	addi	sp,sp,-48
 2d8:	f406                	sd	ra,40(sp)
 2da:	f022                	sd	s0,32(sp)
 2dc:	ec26                	sd	s1,24(sp)
 2de:	e84a                	sd	s2,16(sp)
 2e0:	e44e                	sd	s3,8(sp)
 2e2:	e052                	sd	s4,0(sp)
 2e4:	1800                	addi	s0,sp,48
 2e6:	4785                	li	a5,1
 2e8:	02a7d763          	bge	a5,a0,316 <main+0x40>
 2ec:	89aa                	mv	s3,a0
 2ee:	8a2e                	mv	s4,a1
 2f0:	4789                	li	a5,2
 2f2:	01058913          	addi	s2,a1,16
 2f6:	4489                	li	s1,2
 2f8:	02f50663          	beq	a0,a5,324 <main+0x4e>
 2fc:	00093583          	ld	a1,0(s2)
 300:	008a3503          	ld	a0,8(s4)
 304:	f19ff0ef          	jal	21c <find>
 308:	2485                	addiw	s1,s1,1
 30a:	0921                	addi	s2,s2,8
 30c:	ff34c8e3          	blt	s1,s3,2fc <main+0x26>
 310:	4501                	li	a0,0
 312:	28c000ef          	jal	59e <exit>
 316:	00001517          	auipc	a0,0x1
 31a:	8ba50513          	addi	a0,a0,-1862 # bd0 <malloc+0x166>
 31e:	698000ef          	jal	9b6 <printf>
 322:	b7fd                	j	310 <main+0x3a>
 324:	658c                	ld	a1,8(a1)
 326:	00001517          	auipc	a0,0x1
 32a:	87a50513          	addi	a0,a0,-1926 # ba0 <malloc+0x136>
 32e:	eefff0ef          	jal	21c <find>
 332:	bff9                	j	310 <main+0x3a>

0000000000000334 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 334:	1141                	addi	sp,sp,-16
 336:	e406                	sd	ra,8(sp)
 338:	e022                	sd	s0,0(sp)
 33a:	0800                	addi	s0,sp,16
  extern int main();
  main();
 33c:	f9bff0ef          	jal	2d6 <main>
  exit(0);
 340:	4501                	li	a0,0
 342:	25c000ef          	jal	59e <exit>

0000000000000346 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 346:	1141                	addi	sp,sp,-16
 348:	e422                	sd	s0,8(sp)
 34a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 34c:	87aa                	mv	a5,a0
 34e:	0585                	addi	a1,a1,1
 350:	0785                	addi	a5,a5,1
 352:	fff5c703          	lbu	a4,-1(a1)
 356:	fee78fa3          	sb	a4,-1(a5)
 35a:	fb75                	bnez	a4,34e <strcpy+0x8>
    ;
  return os;
}
 35c:	6422                	ld	s0,8(sp)
 35e:	0141                	addi	sp,sp,16
 360:	8082                	ret

0000000000000362 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 362:	1141                	addi	sp,sp,-16
 364:	e422                	sd	s0,8(sp)
 366:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 368:	00054783          	lbu	a5,0(a0)
 36c:	cb91                	beqz	a5,380 <strcmp+0x1e>
 36e:	0005c703          	lbu	a4,0(a1)
 372:	00f71763          	bne	a4,a5,380 <strcmp+0x1e>
    p++, q++;
 376:	0505                	addi	a0,a0,1
 378:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 37a:	00054783          	lbu	a5,0(a0)
 37e:	fbe5                	bnez	a5,36e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 380:	0005c503          	lbu	a0,0(a1)
}
 384:	40a7853b          	subw	a0,a5,a0
 388:	6422                	ld	s0,8(sp)
 38a:	0141                	addi	sp,sp,16
 38c:	8082                	ret

000000000000038e <strlen>:

uint
strlen(const char *s)
{
 38e:	1141                	addi	sp,sp,-16
 390:	e422                	sd	s0,8(sp)
 392:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 394:	00054783          	lbu	a5,0(a0)
 398:	cf91                	beqz	a5,3b4 <strlen+0x26>
 39a:	0505                	addi	a0,a0,1
 39c:	87aa                	mv	a5,a0
 39e:	86be                	mv	a3,a5
 3a0:	0785                	addi	a5,a5,1
 3a2:	fff7c703          	lbu	a4,-1(a5)
 3a6:	ff65                	bnez	a4,39e <strlen+0x10>
 3a8:	40a6853b          	subw	a0,a3,a0
 3ac:	2505                	addiw	a0,a0,1
    ;
  return n;
}
 3ae:	6422                	ld	s0,8(sp)
 3b0:	0141                	addi	sp,sp,16
 3b2:	8082                	ret
  for(n = 0; s[n]; n++)
 3b4:	4501                	li	a0,0
 3b6:	bfe5                	j	3ae <strlen+0x20>

00000000000003b8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3b8:	1141                	addi	sp,sp,-16
 3ba:	e422                	sd	s0,8(sp)
 3bc:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 3be:	ca19                	beqz	a2,3d4 <memset+0x1c>
 3c0:	87aa                	mv	a5,a0
 3c2:	1602                	slli	a2,a2,0x20
 3c4:	9201                	srli	a2,a2,0x20
 3c6:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 3ca:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 3ce:	0785                	addi	a5,a5,1
 3d0:	fee79de3          	bne	a5,a4,3ca <memset+0x12>
  }
  return dst;
}
 3d4:	6422                	ld	s0,8(sp)
 3d6:	0141                	addi	sp,sp,16
 3d8:	8082                	ret

00000000000003da <strchr>:

char*
strchr(const char *s, char c)
{
 3da:	1141                	addi	sp,sp,-16
 3dc:	e422                	sd	s0,8(sp)
 3de:	0800                	addi	s0,sp,16
  for(; *s; s++)
 3e0:	00054783          	lbu	a5,0(a0)
 3e4:	cb99                	beqz	a5,3fa <strchr+0x20>
    if(*s == c)
 3e6:	00f58763          	beq	a1,a5,3f4 <strchr+0x1a>
  for(; *s; s++)
 3ea:	0505                	addi	a0,a0,1
 3ec:	00054783          	lbu	a5,0(a0)
 3f0:	fbfd                	bnez	a5,3e6 <strchr+0xc>
      return (char*)s;
  return 0;
 3f2:	4501                	li	a0,0
}
 3f4:	6422                	ld	s0,8(sp)
 3f6:	0141                	addi	sp,sp,16
 3f8:	8082                	ret
  return 0;
 3fa:	4501                	li	a0,0
 3fc:	bfe5                	j	3f4 <strchr+0x1a>

00000000000003fe <gets>:

char*
gets(char *buf, int max)
{
 3fe:	711d                	addi	sp,sp,-96
 400:	ec86                	sd	ra,88(sp)
 402:	e8a2                	sd	s0,80(sp)
 404:	e4a6                	sd	s1,72(sp)
 406:	e0ca                	sd	s2,64(sp)
 408:	fc4e                	sd	s3,56(sp)
 40a:	f852                	sd	s4,48(sp)
 40c:	f456                	sd	s5,40(sp)
 40e:	f05a                	sd	s6,32(sp)
 410:	ec5e                	sd	s7,24(sp)
 412:	1080                	addi	s0,sp,96
 414:	8baa                	mv	s7,a0
 416:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 418:	892a                	mv	s2,a0
 41a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 41c:	4aa9                	li	s5,10
 41e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 420:	89a6                	mv	s3,s1
 422:	2485                	addiw	s1,s1,1
 424:	0344d663          	bge	s1,s4,450 <gets+0x52>
    cc = read(0, &c, 1);
 428:	4605                	li	a2,1
 42a:	faf40593          	addi	a1,s0,-81
 42e:	4501                	li	a0,0
 430:	186000ef          	jal	5b6 <read>
    if(cc < 1)
 434:	00a05e63          	blez	a0,450 <gets+0x52>
    buf[i++] = c;
 438:	faf44783          	lbu	a5,-81(s0)
 43c:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 440:	01578763          	beq	a5,s5,44e <gets+0x50>
 444:	0905                	addi	s2,s2,1
 446:	fd679de3          	bne	a5,s6,420 <gets+0x22>
    buf[i++] = c;
 44a:	89a6                	mv	s3,s1
 44c:	a011                	j	450 <gets+0x52>
 44e:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 450:	99de                	add	s3,s3,s7
 452:	00098023          	sb	zero,0(s3)
  return buf;
}
 456:	855e                	mv	a0,s7
 458:	60e6                	ld	ra,88(sp)
 45a:	6446                	ld	s0,80(sp)
 45c:	64a6                	ld	s1,72(sp)
 45e:	6906                	ld	s2,64(sp)
 460:	79e2                	ld	s3,56(sp)
 462:	7a42                	ld	s4,48(sp)
 464:	7aa2                	ld	s5,40(sp)
 466:	7b02                	ld	s6,32(sp)
 468:	6be2                	ld	s7,24(sp)
 46a:	6125                	addi	sp,sp,96
 46c:	8082                	ret

000000000000046e <stat>:

int
stat(const char *n, struct stat *st)
{
 46e:	1101                	addi	sp,sp,-32
 470:	ec06                	sd	ra,24(sp)
 472:	e822                	sd	s0,16(sp)
 474:	e04a                	sd	s2,0(sp)
 476:	1000                	addi	s0,sp,32
 478:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 47a:	4581                	li	a1,0
 47c:	162000ef          	jal	5de <open>
  if(fd < 0)
 480:	02054263          	bltz	a0,4a4 <stat+0x36>
 484:	e426                	sd	s1,8(sp)
 486:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 488:	85ca                	mv	a1,s2
 48a:	16c000ef          	jal	5f6 <fstat>
 48e:	892a                	mv	s2,a0
  close(fd);
 490:	8526                	mv	a0,s1
 492:	134000ef          	jal	5c6 <close>
  return r;
 496:	64a2                	ld	s1,8(sp)
}
 498:	854a                	mv	a0,s2
 49a:	60e2                	ld	ra,24(sp)
 49c:	6442                	ld	s0,16(sp)
 49e:	6902                	ld	s2,0(sp)
 4a0:	6105                	addi	sp,sp,32
 4a2:	8082                	ret
    return -1;
 4a4:	597d                	li	s2,-1
 4a6:	bfcd                	j	498 <stat+0x2a>

00000000000004a8 <atoi>:

int
atoi(const char *s)
{
 4a8:	1141                	addi	sp,sp,-16
 4aa:	e422                	sd	s0,8(sp)
 4ac:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ae:	00054683          	lbu	a3,0(a0)
 4b2:	fd06879b          	addiw	a5,a3,-48
 4b6:	0ff7f793          	zext.b	a5,a5
 4ba:	4625                	li	a2,9
 4bc:	02f66863          	bltu	a2,a5,4ec <atoi+0x44>
 4c0:	872a                	mv	a4,a0
  n = 0;
 4c2:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 4c4:	0705                	addi	a4,a4,1
 4c6:	0025179b          	slliw	a5,a0,0x2
 4ca:	9fa9                	addw	a5,a5,a0
 4cc:	0017979b          	slliw	a5,a5,0x1
 4d0:	9fb5                	addw	a5,a5,a3
 4d2:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 4d6:	00074683          	lbu	a3,0(a4)
 4da:	fd06879b          	addiw	a5,a3,-48
 4de:	0ff7f793          	zext.b	a5,a5
 4e2:	fef671e3          	bgeu	a2,a5,4c4 <atoi+0x1c>
  return n;
}
 4e6:	6422                	ld	s0,8(sp)
 4e8:	0141                	addi	sp,sp,16
 4ea:	8082                	ret
  n = 0;
 4ec:	4501                	li	a0,0
 4ee:	bfe5                	j	4e6 <atoi+0x3e>

00000000000004f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4f0:	1141                	addi	sp,sp,-16
 4f2:	e422                	sd	s0,8(sp)
 4f4:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 4f6:	02b57463          	bgeu	a0,a1,51e <memmove+0x2e>
    while(n-- > 0)
 4fa:	00c05f63          	blez	a2,518 <memmove+0x28>
 4fe:	1602                	slli	a2,a2,0x20
 500:	9201                	srli	a2,a2,0x20
 502:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 506:	872a                	mv	a4,a0
      *dst++ = *src++;
 508:	0585                	addi	a1,a1,1
 50a:	0705                	addi	a4,a4,1
 50c:	fff5c683          	lbu	a3,-1(a1)
 510:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 514:	fef71ae3          	bne	a4,a5,508 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 518:	6422                	ld	s0,8(sp)
 51a:	0141                	addi	sp,sp,16
 51c:	8082                	ret
    dst += n;
 51e:	00c50733          	add	a4,a0,a2
    src += n;
 522:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 524:	fec05ae3          	blez	a2,518 <memmove+0x28>
 528:	fff6079b          	addiw	a5,a2,-1
 52c:	1782                	slli	a5,a5,0x20
 52e:	9381                	srli	a5,a5,0x20
 530:	fff7c793          	not	a5,a5
 534:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 536:	15fd                	addi	a1,a1,-1
 538:	177d                	addi	a4,a4,-1
 53a:	0005c683          	lbu	a3,0(a1)
 53e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 542:	fee79ae3          	bne	a5,a4,536 <memmove+0x46>
 546:	bfc9                	j	518 <memmove+0x28>

0000000000000548 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 548:	1141                	addi	sp,sp,-16
 54a:	e422                	sd	s0,8(sp)
 54c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 54e:	ca05                	beqz	a2,57e <memcmp+0x36>
 550:	fff6069b          	addiw	a3,a2,-1
 554:	1682                	slli	a3,a3,0x20
 556:	9281                	srli	a3,a3,0x20
 558:	0685                	addi	a3,a3,1
 55a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 55c:	00054783          	lbu	a5,0(a0)
 560:	0005c703          	lbu	a4,0(a1)
 564:	00e79863          	bne	a5,a4,574 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 568:	0505                	addi	a0,a0,1
    p2++;
 56a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 56c:	fed518e3          	bne	a0,a3,55c <memcmp+0x14>
  }
  return 0;
 570:	4501                	li	a0,0
 572:	a019                	j	578 <memcmp+0x30>
      return *p1 - *p2;
 574:	40e7853b          	subw	a0,a5,a4
}
 578:	6422                	ld	s0,8(sp)
 57a:	0141                	addi	sp,sp,16
 57c:	8082                	ret
  return 0;
 57e:	4501                	li	a0,0
 580:	bfe5                	j	578 <memcmp+0x30>

0000000000000582 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 582:	1141                	addi	sp,sp,-16
 584:	e406                	sd	ra,8(sp)
 586:	e022                	sd	s0,0(sp)
 588:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 58a:	f67ff0ef          	jal	4f0 <memmove>
}
 58e:	60a2                	ld	ra,8(sp)
 590:	6402                	ld	s0,0(sp)
 592:	0141                	addi	sp,sp,16
 594:	8082                	ret

0000000000000596 <fork>:
 596:	4885                	li	a7,1
 598:	00000073          	ecall
 59c:	8082                	ret

000000000000059e <exit>:
 59e:	4889                	li	a7,2
 5a0:	00000073          	ecall
 5a4:	8082                	ret

00000000000005a6 <wait>:
 5a6:	488d                	li	a7,3
 5a8:	00000073          	ecall
 5ac:	8082                	ret

00000000000005ae <pipe>:
 5ae:	4891                	li	a7,4
 5b0:	00000073          	ecall
 5b4:	8082                	ret

00000000000005b6 <read>:
 5b6:	4895                	li	a7,5
 5b8:	00000073          	ecall
 5bc:	8082                	ret

00000000000005be <write>:
 5be:	48c1                	li	a7,16
 5c0:	00000073          	ecall
 5c4:	8082                	ret

00000000000005c6 <close>:
 5c6:	48d5                	li	a7,21
 5c8:	00000073          	ecall
 5cc:	8082                	ret

00000000000005ce <kill>:
 5ce:	4899                	li	a7,6
 5d0:	00000073          	ecall
 5d4:	8082                	ret

00000000000005d6 <exec>:
 5d6:	489d                	li	a7,7
 5d8:	00000073          	ecall
 5dc:	8082                	ret

00000000000005de <open>:
 5de:	48bd                	li	a7,15
 5e0:	00000073          	ecall
 5e4:	8082                	ret

00000000000005e6 <mknod>:
 5e6:	48c5                	li	a7,17
 5e8:	00000073          	ecall
 5ec:	8082                	ret

00000000000005ee <unlink>:
 5ee:	48c9                	li	a7,18
 5f0:	00000073          	ecall
 5f4:	8082                	ret

00000000000005f6 <fstat>:
 5f6:	48a1                	li	a7,8
 5f8:	00000073          	ecall
 5fc:	8082                	ret

00000000000005fe <link>:
 5fe:	48cd                	li	a7,19
 600:	00000073          	ecall
 604:	8082                	ret

0000000000000606 <mkdir>:
 606:	48d1                	li	a7,20
 608:	00000073          	ecall
 60c:	8082                	ret

000000000000060e <chdir>:
 60e:	48a5                	li	a7,9
 610:	00000073          	ecall
 614:	8082                	ret

0000000000000616 <dup>:
 616:	48a9                	li	a7,10
 618:	00000073          	ecall
 61c:	8082                	ret

000000000000061e <getpid>:
 61e:	48ad                	li	a7,11
 620:	00000073          	ecall
 624:	8082                	ret

0000000000000626 <sbrk>:
 626:	48b1                	li	a7,12
 628:	00000073          	ecall
 62c:	8082                	ret

000000000000062e <sleep>:
 62e:	48b5                	li	a7,13
 630:	00000073          	ecall
 634:	8082                	ret

0000000000000636 <uptime>:
 636:	48b9                	li	a7,14
 638:	00000073          	ecall
 63c:	8082                	ret

000000000000063e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 63e:	1101                	addi	sp,sp,-32
 640:	ec06                	sd	ra,24(sp)
 642:	e822                	sd	s0,16(sp)
 644:	1000                	addi	s0,sp,32
 646:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 64a:	4605                	li	a2,1
 64c:	fef40593          	addi	a1,s0,-17
 650:	f6fff0ef          	jal	5be <write>
}
 654:	60e2                	ld	ra,24(sp)
 656:	6442                	ld	s0,16(sp)
 658:	6105                	addi	sp,sp,32
 65a:	8082                	ret

000000000000065c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 65c:	7139                	addi	sp,sp,-64
 65e:	fc06                	sd	ra,56(sp)
 660:	f822                	sd	s0,48(sp)
 662:	f426                	sd	s1,40(sp)
 664:	0080                	addi	s0,sp,64
 666:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 668:	c299                	beqz	a3,66e <printint+0x12>
 66a:	0805c963          	bltz	a1,6fc <printint+0xa0>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 66e:	2581                	sext.w	a1,a1
  neg = 0;
 670:	4881                	li	a7,0
 672:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 676:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 678:	2601                	sext.w	a2,a2
 67a:	00000517          	auipc	a0,0x0
 67e:	58e50513          	addi	a0,a0,1422 # c08 <digits>
 682:	883a                	mv	a6,a4
 684:	2705                	addiw	a4,a4,1
 686:	02c5f7bb          	remuw	a5,a1,a2
 68a:	1782                	slli	a5,a5,0x20
 68c:	9381                	srli	a5,a5,0x20
 68e:	97aa                	add	a5,a5,a0
 690:	0007c783          	lbu	a5,0(a5)
 694:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 698:	0005879b          	sext.w	a5,a1
 69c:	02c5d5bb          	divuw	a1,a1,a2
 6a0:	0685                	addi	a3,a3,1
 6a2:	fec7f0e3          	bgeu	a5,a2,682 <printint+0x26>
  if(neg)
 6a6:	00088c63          	beqz	a7,6be <printint+0x62>
    buf[i++] = '-';
 6aa:	fd070793          	addi	a5,a4,-48
 6ae:	00878733          	add	a4,a5,s0
 6b2:	02d00793          	li	a5,45
 6b6:	fef70823          	sb	a5,-16(a4)
 6ba:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 6be:	02e05a63          	blez	a4,6f2 <printint+0x96>
 6c2:	f04a                	sd	s2,32(sp)
 6c4:	ec4e                	sd	s3,24(sp)
 6c6:	fc040793          	addi	a5,s0,-64
 6ca:	00e78933          	add	s2,a5,a4
 6ce:	fff78993          	addi	s3,a5,-1
 6d2:	99ba                	add	s3,s3,a4
 6d4:	377d                	addiw	a4,a4,-1
 6d6:	1702                	slli	a4,a4,0x20
 6d8:	9301                	srli	a4,a4,0x20
 6da:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 6de:	fff94583          	lbu	a1,-1(s2)
 6e2:	8526                	mv	a0,s1
 6e4:	f5bff0ef          	jal	63e <putc>
  while(--i >= 0)
 6e8:	197d                	addi	s2,s2,-1
 6ea:	ff391ae3          	bne	s2,s3,6de <printint+0x82>
 6ee:	7902                	ld	s2,32(sp)
 6f0:	69e2                	ld	s3,24(sp)
}
 6f2:	70e2                	ld	ra,56(sp)
 6f4:	7442                	ld	s0,48(sp)
 6f6:	74a2                	ld	s1,40(sp)
 6f8:	6121                	addi	sp,sp,64
 6fa:	8082                	ret
    x = -xx;
 6fc:	40b005bb          	negw	a1,a1
    neg = 1;
 700:	4885                	li	a7,1
    x = -xx;
 702:	bf85                	j	672 <printint+0x16>

0000000000000704 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 704:	711d                	addi	sp,sp,-96
 706:	ec86                	sd	ra,88(sp)
 708:	e8a2                	sd	s0,80(sp)
 70a:	e0ca                	sd	s2,64(sp)
 70c:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 70e:	0005c903          	lbu	s2,0(a1)
 712:	26090863          	beqz	s2,982 <vprintf+0x27e>
 716:	e4a6                	sd	s1,72(sp)
 718:	fc4e                	sd	s3,56(sp)
 71a:	f852                	sd	s4,48(sp)
 71c:	f456                	sd	s5,40(sp)
 71e:	f05a                	sd	s6,32(sp)
 720:	ec5e                	sd	s7,24(sp)
 722:	e862                	sd	s8,16(sp)
 724:	e466                	sd	s9,8(sp)
 726:	8b2a                	mv	s6,a0
 728:	8a2e                	mv	s4,a1
 72a:	8bb2                	mv	s7,a2
  state = 0;
 72c:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 72e:	4481                	li	s1,0
 730:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 732:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 736:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 73a:	06c00c93          	li	s9,108
 73e:	a005                	j	75e <vprintf+0x5a>
        putc(fd, c0);
 740:	85ca                	mv	a1,s2
 742:	855a                	mv	a0,s6
 744:	efbff0ef          	jal	63e <putc>
 748:	a019                	j	74e <vprintf+0x4a>
    } else if(state == '%'){
 74a:	03598263          	beq	s3,s5,76e <vprintf+0x6a>
  for(i = 0; fmt[i]; i++){
 74e:	2485                	addiw	s1,s1,1
 750:	8726                	mv	a4,s1
 752:	009a07b3          	add	a5,s4,s1
 756:	0007c903          	lbu	s2,0(a5)
 75a:	20090c63          	beqz	s2,972 <vprintf+0x26e>
    c0 = fmt[i] & 0xff;
 75e:	0009079b          	sext.w	a5,s2
    if(state == 0){
 762:	fe0994e3          	bnez	s3,74a <vprintf+0x46>
      if(c0 == '%'){
 766:	fd579de3          	bne	a5,s5,740 <vprintf+0x3c>
        state = '%';
 76a:	89be                	mv	s3,a5
 76c:	b7cd                	j	74e <vprintf+0x4a>
      if(c0) c1 = fmt[i+1] & 0xff;
 76e:	00ea06b3          	add	a3,s4,a4
 772:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 776:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 778:	c681                	beqz	a3,780 <vprintf+0x7c>
 77a:	9752                	add	a4,a4,s4
 77c:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 780:	03878f63          	beq	a5,s8,7be <vprintf+0xba>
      } else if(c0 == 'l' && c1 == 'd'){
 784:	05978963          	beq	a5,s9,7d6 <vprintf+0xd2>
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 788:	07500713          	li	a4,117
 78c:	0ee78363          	beq	a5,a4,872 <vprintf+0x16e>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 790:	07800713          	li	a4,120
 794:	12e78563          	beq	a5,a4,8be <vprintf+0x1ba>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 798:	07000713          	li	a4,112
 79c:	14e78a63          	beq	a5,a4,8f0 <vprintf+0x1ec>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
 7a0:	07300713          	li	a4,115
 7a4:	18e78a63          	beq	a5,a4,938 <vprintf+0x234>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 7a8:	02500713          	li	a4,37
 7ac:	04e79563          	bne	a5,a4,7f6 <vprintf+0xf2>
        putc(fd, '%');
 7b0:	02500593          	li	a1,37
 7b4:	855a                	mv	a0,s6
 7b6:	e89ff0ef          	jal	63e <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
 7ba:	4981                	li	s3,0
 7bc:	bf49                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 1);
 7be:	008b8913          	addi	s2,s7,8
 7c2:	4685                	li	a3,1
 7c4:	4629                	li	a2,10
 7c6:	000ba583          	lw	a1,0(s7)
 7ca:	855a                	mv	a0,s6
 7cc:	e91ff0ef          	jal	65c <printint>
 7d0:	8bca                	mv	s7,s2
      state = 0;
 7d2:	4981                	li	s3,0
 7d4:	bfad                	j	74e <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'd'){
 7d6:	06400793          	li	a5,100
 7da:	02f68963          	beq	a3,a5,80c <vprintf+0x108>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 7de:	06c00793          	li	a5,108
 7e2:	04f68263          	beq	a3,a5,826 <vprintf+0x122>
      } else if(c0 == 'l' && c1 == 'u'){
 7e6:	07500793          	li	a5,117
 7ea:	0af68063          	beq	a3,a5,88a <vprintf+0x186>
      } else if(c0 == 'l' && c1 == 'x'){
 7ee:	07800793          	li	a5,120
 7f2:	0ef68263          	beq	a3,a5,8d6 <vprintf+0x1d2>
        putc(fd, '%');
 7f6:	02500593          	li	a1,37
 7fa:	855a                	mv	a0,s6
 7fc:	e43ff0ef          	jal	63e <putc>
        putc(fd, c0);
 800:	85ca                	mv	a1,s2
 802:	855a                	mv	a0,s6
 804:	e3bff0ef          	jal	63e <putc>
      state = 0;
 808:	4981                	li	s3,0
 80a:	b791                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 80c:	008b8913          	addi	s2,s7,8
 810:	4685                	li	a3,1
 812:	4629                	li	a2,10
 814:	000ba583          	lw	a1,0(s7)
 818:	855a                	mv	a0,s6
 81a:	e43ff0ef          	jal	65c <printint>
        i += 1;
 81e:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 820:	8bca                	mv	s7,s2
      state = 0;
 822:	4981                	li	s3,0
        i += 1;
 824:	b72d                	j	74e <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 826:	06400793          	li	a5,100
 82a:	02f60763          	beq	a2,a5,858 <vprintf+0x154>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 82e:	07500793          	li	a5,117
 832:	06f60963          	beq	a2,a5,8a4 <vprintf+0x1a0>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 836:	07800793          	li	a5,120
 83a:	faf61ee3          	bne	a2,a5,7f6 <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
 83e:	008b8913          	addi	s2,s7,8
 842:	4681                	li	a3,0
 844:	4641                	li	a2,16
 846:	000ba583          	lw	a1,0(s7)
 84a:	855a                	mv	a0,s6
 84c:	e11ff0ef          	jal	65c <printint>
        i += 2;
 850:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 852:	8bca                	mv	s7,s2
      state = 0;
 854:	4981                	li	s3,0
        i += 2;
 856:	bde5                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 858:	008b8913          	addi	s2,s7,8
 85c:	4685                	li	a3,1
 85e:	4629                	li	a2,10
 860:	000ba583          	lw	a1,0(s7)
 864:	855a                	mv	a0,s6
 866:	df7ff0ef          	jal	65c <printint>
        i += 2;
 86a:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 86c:	8bca                	mv	s7,s2
      state = 0;
 86e:	4981                	li	s3,0
        i += 2;
 870:	bdf9                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 0);
 872:	008b8913          	addi	s2,s7,8
 876:	4681                	li	a3,0
 878:	4629                	li	a2,10
 87a:	000ba583          	lw	a1,0(s7)
 87e:	855a                	mv	a0,s6
 880:	dddff0ef          	jal	65c <printint>
 884:	8bca                	mv	s7,s2
      state = 0;
 886:	4981                	li	s3,0
 888:	b5d9                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 88a:	008b8913          	addi	s2,s7,8
 88e:	4681                	li	a3,0
 890:	4629                	li	a2,10
 892:	000ba583          	lw	a1,0(s7)
 896:	855a                	mv	a0,s6
 898:	dc5ff0ef          	jal	65c <printint>
        i += 1;
 89c:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 89e:	8bca                	mv	s7,s2
      state = 0;
 8a0:	4981                	li	s3,0
        i += 1;
 8a2:	b575                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 8a4:	008b8913          	addi	s2,s7,8
 8a8:	4681                	li	a3,0
 8aa:	4629                	li	a2,10
 8ac:	000ba583          	lw	a1,0(s7)
 8b0:	855a                	mv	a0,s6
 8b2:	dabff0ef          	jal	65c <printint>
        i += 2;
 8b6:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 8b8:	8bca                	mv	s7,s2
      state = 0;
 8ba:	4981                	li	s3,0
        i += 2;
 8bc:	bd49                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 16, 0);
 8be:	008b8913          	addi	s2,s7,8
 8c2:	4681                	li	a3,0
 8c4:	4641                	li	a2,16
 8c6:	000ba583          	lw	a1,0(s7)
 8ca:	855a                	mv	a0,s6
 8cc:	d91ff0ef          	jal	65c <printint>
 8d0:	8bca                	mv	s7,s2
      state = 0;
 8d2:	4981                	li	s3,0
 8d4:	bdad                	j	74e <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 8d6:	008b8913          	addi	s2,s7,8
 8da:	4681                	li	a3,0
 8dc:	4641                	li	a2,16
 8de:	000ba583          	lw	a1,0(s7)
 8e2:	855a                	mv	a0,s6
 8e4:	d79ff0ef          	jal	65c <printint>
        i += 1;
 8e8:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 8ea:	8bca                	mv	s7,s2
      state = 0;
 8ec:	4981                	li	s3,0
        i += 1;
 8ee:	b585                	j	74e <vprintf+0x4a>
 8f0:	e06a                	sd	s10,0(sp)
        printptr(fd, va_arg(ap, uint64));
 8f2:	008b8d13          	addi	s10,s7,8
 8f6:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 8fa:	03000593          	li	a1,48
 8fe:	855a                	mv	a0,s6
 900:	d3fff0ef          	jal	63e <putc>
  putc(fd, 'x');
 904:	07800593          	li	a1,120
 908:	855a                	mv	a0,s6
 90a:	d35ff0ef          	jal	63e <putc>
 90e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 910:	00000b97          	auipc	s7,0x0
 914:	2f8b8b93          	addi	s7,s7,760 # c08 <digits>
 918:	03c9d793          	srli	a5,s3,0x3c
 91c:	97de                	add	a5,a5,s7
 91e:	0007c583          	lbu	a1,0(a5)
 922:	855a                	mv	a0,s6
 924:	d1bff0ef          	jal	63e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 928:	0992                	slli	s3,s3,0x4
 92a:	397d                	addiw	s2,s2,-1
 92c:	fe0916e3          	bnez	s2,918 <vprintf+0x214>
        printptr(fd, va_arg(ap, uint64));
 930:	8bea                	mv	s7,s10
      state = 0;
 932:	4981                	li	s3,0
 934:	6d02                	ld	s10,0(sp)
 936:	bd21                	j	74e <vprintf+0x4a>
        if((s = va_arg(ap, char*)) == 0)
 938:	008b8993          	addi	s3,s7,8
 93c:	000bb903          	ld	s2,0(s7)
 940:	00090f63          	beqz	s2,95e <vprintf+0x25a>
        for(; *s; s++)
 944:	00094583          	lbu	a1,0(s2)
 948:	c195                	beqz	a1,96c <vprintf+0x268>
          putc(fd, *s);
 94a:	855a                	mv	a0,s6
 94c:	cf3ff0ef          	jal	63e <putc>
        for(; *s; s++)
 950:	0905                	addi	s2,s2,1
 952:	00094583          	lbu	a1,0(s2)
 956:	f9f5                	bnez	a1,94a <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
 958:	8bce                	mv	s7,s3
      state = 0;
 95a:	4981                	li	s3,0
 95c:	bbcd                	j	74e <vprintf+0x4a>
          s = "(null)";
 95e:	00000917          	auipc	s2,0x0
 962:	2a290913          	addi	s2,s2,674 # c00 <malloc+0x196>
        for(; *s; s++)
 966:	02800593          	li	a1,40
 96a:	b7c5                	j	94a <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
 96c:	8bce                	mv	s7,s3
      state = 0;
 96e:	4981                	li	s3,0
 970:	bbf9                	j	74e <vprintf+0x4a>
 972:	64a6                	ld	s1,72(sp)
 974:	79e2                	ld	s3,56(sp)
 976:	7a42                	ld	s4,48(sp)
 978:	7aa2                	ld	s5,40(sp)
 97a:	7b02                	ld	s6,32(sp)
 97c:	6be2                	ld	s7,24(sp)
 97e:	6c42                	ld	s8,16(sp)
 980:	6ca2                	ld	s9,8(sp)
    }
  }
}
 982:	60e6                	ld	ra,88(sp)
 984:	6446                	ld	s0,80(sp)
 986:	6906                	ld	s2,64(sp)
 988:	6125                	addi	sp,sp,96
 98a:	8082                	ret

000000000000098c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 98c:	715d                	addi	sp,sp,-80
 98e:	ec06                	sd	ra,24(sp)
 990:	e822                	sd	s0,16(sp)
 992:	1000                	addi	s0,sp,32
 994:	e010                	sd	a2,0(s0)
 996:	e414                	sd	a3,8(s0)
 998:	e818                	sd	a4,16(s0)
 99a:	ec1c                	sd	a5,24(s0)
 99c:	03043023          	sd	a6,32(s0)
 9a0:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 9a4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 9a8:	8622                	mv	a2,s0
 9aa:	d5bff0ef          	jal	704 <vprintf>
}
 9ae:	60e2                	ld	ra,24(sp)
 9b0:	6442                	ld	s0,16(sp)
 9b2:	6161                	addi	sp,sp,80
 9b4:	8082                	ret

00000000000009b6 <printf>:

void
printf(const char *fmt, ...)
{
 9b6:	711d                	addi	sp,sp,-96
 9b8:	ec06                	sd	ra,24(sp)
 9ba:	e822                	sd	s0,16(sp)
 9bc:	1000                	addi	s0,sp,32
 9be:	e40c                	sd	a1,8(s0)
 9c0:	e810                	sd	a2,16(s0)
 9c2:	ec14                	sd	a3,24(s0)
 9c4:	f018                	sd	a4,32(s0)
 9c6:	f41c                	sd	a5,40(s0)
 9c8:	03043823          	sd	a6,48(s0)
 9cc:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 9d0:	00840613          	addi	a2,s0,8
 9d4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 9d8:	85aa                	mv	a1,a0
 9da:	4505                	li	a0,1
 9dc:	d29ff0ef          	jal	704 <vprintf>
}
 9e0:	60e2                	ld	ra,24(sp)
 9e2:	6442                	ld	s0,16(sp)
 9e4:	6125                	addi	sp,sp,96
 9e6:	8082                	ret

00000000000009e8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9e8:	1141                	addi	sp,sp,-16
 9ea:	e422                	sd	s0,8(sp)
 9ec:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9ee:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f2:	00000797          	auipc	a5,0x0
 9f6:	60e7b783          	ld	a5,1550(a5) # 1000 <freep>
 9fa:	a02d                	j	a24 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9fc:	4618                	lw	a4,8(a2)
 9fe:	9f2d                	addw	a4,a4,a1
 a00:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 a04:	6398                	ld	a4,0(a5)
 a06:	6310                	ld	a2,0(a4)
 a08:	a83d                	j	a46 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a0a:	ff852703          	lw	a4,-8(a0)
 a0e:	9f31                	addw	a4,a4,a2
 a10:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 a12:	ff053683          	ld	a3,-16(a0)
 a16:	a091                	j	a5a <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a18:	6398                	ld	a4,0(a5)
 a1a:	00e7e463          	bltu	a5,a4,a22 <free+0x3a>
 a1e:	00e6ea63          	bltu	a3,a4,a32 <free+0x4a>
{
 a22:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a24:	fed7fae3          	bgeu	a5,a3,a18 <free+0x30>
 a28:	6398                	ld	a4,0(a5)
 a2a:	00e6e463          	bltu	a3,a4,a32 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a2e:	fee7eae3          	bltu	a5,a4,a22 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 a32:	ff852583          	lw	a1,-8(a0)
 a36:	6390                	ld	a2,0(a5)
 a38:	02059813          	slli	a6,a1,0x20
 a3c:	01c85713          	srli	a4,a6,0x1c
 a40:	9736                	add	a4,a4,a3
 a42:	fae60de3          	beq	a2,a4,9fc <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 a46:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 a4a:	4790                	lw	a2,8(a5)
 a4c:	02061593          	slli	a1,a2,0x20
 a50:	01c5d713          	srli	a4,a1,0x1c
 a54:	973e                	add	a4,a4,a5
 a56:	fae68ae3          	beq	a3,a4,a0a <free+0x22>
    p->s.ptr = bp->s.ptr;
 a5a:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 a5c:	00000717          	auipc	a4,0x0
 a60:	5af73223          	sd	a5,1444(a4) # 1000 <freep>
}
 a64:	6422                	ld	s0,8(sp)
 a66:	0141                	addi	sp,sp,16
 a68:	8082                	ret

0000000000000a6a <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a6a:	7139                	addi	sp,sp,-64
 a6c:	fc06                	sd	ra,56(sp)
 a6e:	f822                	sd	s0,48(sp)
 a70:	f426                	sd	s1,40(sp)
 a72:	ec4e                	sd	s3,24(sp)
 a74:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a76:	02051493          	slli	s1,a0,0x20
 a7a:	9081                	srli	s1,s1,0x20
 a7c:	04bd                	addi	s1,s1,15
 a7e:	8091                	srli	s1,s1,0x4
 a80:	0014899b          	addiw	s3,s1,1
 a84:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a86:	00000517          	auipc	a0,0x0
 a8a:	57a53503          	ld	a0,1402(a0) # 1000 <freep>
 a8e:	c915                	beqz	a0,ac2 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a90:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a92:	4798                	lw	a4,8(a5)
 a94:	08977a63          	bgeu	a4,s1,b28 <malloc+0xbe>
 a98:	f04a                	sd	s2,32(sp)
 a9a:	e852                	sd	s4,16(sp)
 a9c:	e456                	sd	s5,8(sp)
 a9e:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 aa0:	8a4e                	mv	s4,s3
 aa2:	0009871b          	sext.w	a4,s3
 aa6:	6685                	lui	a3,0x1
 aa8:	00d77363          	bgeu	a4,a3,aae <malloc+0x44>
 aac:	6a05                	lui	s4,0x1
 aae:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 ab2:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ab6:	00000917          	auipc	s2,0x0
 aba:	54a90913          	addi	s2,s2,1354 # 1000 <freep>
  if(p == (char*)-1)
 abe:	5afd                	li	s5,-1
 ac0:	a081                	j	b00 <malloc+0x96>
 ac2:	f04a                	sd	s2,32(sp)
 ac4:	e852                	sd	s4,16(sp)
 ac6:	e456                	sd	s5,8(sp)
 ac8:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 aca:	00000797          	auipc	a5,0x0
 ace:	55678793          	addi	a5,a5,1366 # 1020 <base>
 ad2:	00000717          	auipc	a4,0x0
 ad6:	52f73723          	sd	a5,1326(a4) # 1000 <freep>
 ada:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 adc:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 ae0:	b7c1                	j	aa0 <malloc+0x36>
        prevp->s.ptr = p->s.ptr;
 ae2:	6398                	ld	a4,0(a5)
 ae4:	e118                	sd	a4,0(a0)
 ae6:	a8a9                	j	b40 <malloc+0xd6>
  hp->s.size = nu;
 ae8:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 aec:	0541                	addi	a0,a0,16
 aee:	efbff0ef          	jal	9e8 <free>
  return freep;
 af2:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 af6:	c12d                	beqz	a0,b58 <malloc+0xee>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 afa:	4798                	lw	a4,8(a5)
 afc:	02977263          	bgeu	a4,s1,b20 <malloc+0xb6>
    if(p == freep)
 b00:	00093703          	ld	a4,0(s2)
 b04:	853e                	mv	a0,a5
 b06:	fef719e3          	bne	a4,a5,af8 <malloc+0x8e>
  p = sbrk(nu * sizeof(Header));
 b0a:	8552                	mv	a0,s4
 b0c:	b1bff0ef          	jal	626 <sbrk>
  if(p == (char*)-1)
 b10:	fd551ce3          	bne	a0,s5,ae8 <malloc+0x7e>
        return 0;
 b14:	4501                	li	a0,0
 b16:	7902                	ld	s2,32(sp)
 b18:	6a42                	ld	s4,16(sp)
 b1a:	6aa2                	ld	s5,8(sp)
 b1c:	6b02                	ld	s6,0(sp)
 b1e:	a03d                	j	b4c <malloc+0xe2>
 b20:	7902                	ld	s2,32(sp)
 b22:	6a42                	ld	s4,16(sp)
 b24:	6aa2                	ld	s5,8(sp)
 b26:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 b28:	fae48de3          	beq	s1,a4,ae2 <malloc+0x78>
        p->s.size -= nunits;
 b2c:	4137073b          	subw	a4,a4,s3
 b30:	c798                	sw	a4,8(a5)
        p += p->s.size;
 b32:	02071693          	slli	a3,a4,0x20
 b36:	01c6d713          	srli	a4,a3,0x1c
 b3a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 b3c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 b40:	00000717          	auipc	a4,0x0
 b44:	4ca73023          	sd	a0,1216(a4) # 1000 <freep>
      return (void*)(p + 1);
 b48:	01078513          	addi	a0,a5,16
  }
}
 b4c:	70e2                	ld	ra,56(sp)
 b4e:	7442                	ld	s0,48(sp)
 b50:	74a2                	ld	s1,40(sp)
 b52:	69e2                	ld	s3,24(sp)
 b54:	6121                	addi	sp,sp,64
 b56:	8082                	ret
 b58:	7902                	ld	s2,32(sp)
 b5a:	6a42                	ld	s4,16(sp)
 b5c:	6aa2                	ld	s5,8(sp)
 b5e:	6b02                	ld	s6,0(sp)
 b60:	b7f5                	j	b4c <malloc+0xe2>
