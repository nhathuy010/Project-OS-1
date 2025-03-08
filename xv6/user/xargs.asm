
user/_xargs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <xargs>:
#include "user/user.h"
#include "kernel/param.h"

// Hàm xargs: đọc dòng từ stdin và thực thi lệnh với mỗi dòng làm đối số
void xargs(char *cmd[], int use_dash_n)
{
   0:	ac010113          	addi	sp,sp,-1344
   4:	52113c23          	sd	ra,1336(sp)
   8:	52813823          	sd	s0,1328(sp)
   c:	52913423          	sd	s1,1320(sp)
  10:	53213023          	sd	s2,1312(sp)
  14:	51313c23          	sd	s3,1304(sp)
  18:	51413823          	sd	s4,1296(sp)
  1c:	54010413          	addi	s0,sp,1344
  20:	872a                	mv	a4,a0
    char buf[512];
    char line[512];
    char c;
    
    // Đếm số lượng đối số trong cmd, bỏ qua các tham số -n 1 nếu cần
    if (use_dash_n) {
  22:	e98d                	bnez	a1,54 <xargs+0x54>
        // cmd[0] là "echo", bỏ qua "-n" và "1"
        cmd_full[0] = cmd[0];
        nargs = 1;
    } else {
        // Đếm tất cả các đối số
        while (cmd[nargs] != 0)
  24:	6110                	ld	a2,0(a0)
  26:	00850693          	addi	a3,a0,8
    int pid, j, k = 0, nargs = 0;
  2a:	87ae                	mv	a5,a1
        while (cmd[nargs] != 0)
  2c:	ca05                	beqz	a2,5c <xargs+0x5c>
            nargs++;
  2e:	863e                	mv	a2,a5
  30:	2785                	addiw	a5,a5,1
        while (cmd[nargs] != 0)
  32:	06a1                	addi	a3,a3,8
  34:	ff86b503          	ld	a0,-8(a3)
  38:	f97d                	bnez	a0,2e <xargs+0x2e>
            
        // Sao chép các đối số
        for (j = 0; j < nargs; j++) {
  3a:	02f05163          	blez	a5,5c <xargs+0x5c>
  3e:	ed040693          	addi	a3,s0,-304
            cmd_full[j] = cmd[j];
  42:	6308                	ld	a0,0(a4)
  44:	e288                	sd	a0,0(a3)
        for (j = 0; j < nargs; j++) {
  46:	852e                	mv	a0,a1
  48:	2585                	addiw	a1,a1,1
  4a:	0721                	addi	a4,a4,8
  4c:	06a1                	addi	a3,a3,8
  4e:	fec54ae3          	blt	a0,a2,42 <xargs+0x42>
  52:	a029                	j	5c <xargs+0x5c>
        cmd_full[0] = cmd[0];
  54:	611c                	ld	a5,0(a0)
  56:	ecf43823          	sd	a5,-304(s0)
        nargs = 1;
  5a:	4785                	li	a5,1
        }
    }
        
    // Đọc từ stdin một ký tự một cho đến khi hết input
    while (read(0, &c, 1) > 0) {
        buf[k++] = c;
  5c:	4901                	li	s2,0
  5e:	cd040493          	addi	s1,s0,-816
                
            // Copy chuỗi từ buf vào line
            strcpy(line, buf);
            
            // Thêm dòng hiện tại làm đối số cuối cùng
            cmd_full[nargs] = malloc(strlen(line) + 1);
  62:	00379a13          	slli	s4,a5,0x3
  66:	fd0a0713          	addi	a4,s4,-48
  6a:	00870a33          	add	s4,a4,s0
            strcpy(cmd_full[nargs], line);
            
            // Kết thúc danh sách đối số
            cmd_full[nargs + 1] = 0;
  6e:	0017899b          	addiw	s3,a5,1
  72:	098e                	slli	s3,s3,0x3
  74:	fd098793          	addi	a5,s3,-48
  78:	008789b3          	add	s3,a5,s0
  7c:	a8b1                	j	d8 <xargs+0xd8>
            buf[k-1] = '\0'; // Thay thế '\n' bằng '\0'
  7e:	fd090793          	addi	a5,s2,-48
  82:	00878933          	add	s2,a5,s0
  86:	d0090023          	sb	zero,-768(s2)
            for (j = 0; j < 512; j++)
  8a:	ad040793          	addi	a5,s0,-1328
                line[j] = '\0';
  8e:	00078023          	sb	zero,0(a5)
            for (j = 0; j < 512; j++)
  92:	0785                	addi	a5,a5,1
  94:	fef49de3          	bne	s1,a5,8e <xargs+0x8e>
            strcpy(line, buf);
  98:	85a6                	mv	a1,s1
  9a:	ad040513          	addi	a0,s0,-1328
  9e:	1b0000ef          	jal	24e <strcpy>
            cmd_full[nargs] = malloc(strlen(line) + 1);
  a2:	ad040513          	addi	a0,s0,-1328
  a6:	1f0000ef          	jal	296 <strlen>
  aa:	2505                	addiw	a0,a0,1
  ac:	0c7000ef          	jal	972 <malloc>
  b0:	f0aa3023          	sd	a0,-256(s4)
            strcpy(cmd_full[nargs], line);
  b4:	ad040593          	addi	a1,s0,-1328
  b8:	196000ef          	jal	24e <strcpy>
            cmd_full[nargs + 1] = 0;
  bc:	f009b023          	sd	zero,-256(s3)
            
            // Thực thi lệnh
            if ((pid = fork()) > 0) {
  c0:	3de000ef          	jal	49e <fork>
  c4:	02a05f63          	blez	a0,102 <xargs+0x102>
                // Tiến trình cha đợi tiến trình con hoàn thành
                wait(0);
  c8:	4501                	li	a0,0
  ca:	3e4000ef          	jal	4ae <wait>
                fprintf(2, "fork failed\n");
                exit(1);
            }
            
            // Giải phóng bộ nhớ
            free(cmd_full[nargs]);
  ce:	f00a3503          	ld	a0,-256(s4)
  d2:	01f000ef          	jal	8f0 <free>
            k = 0; // Reset biến đếm k
  d6:	4901                	li	s2,0
    while (read(0, &c, 1) > 0) {
  d8:	4605                	li	a2,1
  da:	acf40593          	addi	a1,s0,-1329
  de:	4501                	li	a0,0
  e0:	3de000ef          	jal	4be <read>
  e4:	04a05c63          	blez	a0,13c <xargs+0x13c>
        buf[k++] = c;
  e8:	acf44783          	lbu	a5,-1329(s0)
        if (c == '\n' || c == '\0') {
  ec:	4729                	li	a4,10
  ee:	f8e788e3          	beq	a5,a4,7e <xargs+0x7e>
  f2:	d7d1                	beqz	a5,7e <xargs+0x7e>
        buf[k++] = c;
  f4:	fd090713          	addi	a4,s2,-48
  f8:	9722                	add	a4,a4,s0
  fa:	d0f70023          	sb	a5,-768(a4)
  fe:	2905                	addiw	s2,s2,1
 100:	bfe1                	j	d8 <xargs+0xd8>
            else if (pid == 0) {
 102:	e11d                	bnez	a0,128 <xargs+0x128>
                exec(cmd_full[0], cmd_full);
 104:	ed040593          	addi	a1,s0,-304
 108:	ed043503          	ld	a0,-304(s0)
 10c:	3d2000ef          	jal	4de <exec>
                fprintf(2, "exec %s failed\n", cmd_full[0]);
 110:	ed043603          	ld	a2,-304(s0)
 114:	00001597          	auipc	a1,0x1
 118:	95c58593          	addi	a1,a1,-1700 # a70 <malloc+0xfe>
 11c:	4509                	li	a0,2
 11e:	776000ef          	jal	894 <fprintf>
                exit(1);
 122:	4505                	li	a0,1
 124:	382000ef          	jal	4a6 <exit>
                fprintf(2, "fork failed\n");
 128:	00001597          	auipc	a1,0x1
 12c:	95858593          	addi	a1,a1,-1704 # a80 <malloc+0x10e>
 130:	4509                	li	a0,2
 132:	762000ef          	jal	894 <fprintf>
                exit(1);
 136:	4505                	li	a0,1
 138:	36e000ef          	jal	4a6 <exit>
        }
    }
}
 13c:	53813083          	ld	ra,1336(sp)
 140:	53013403          	ld	s0,1328(sp)
 144:	52813483          	ld	s1,1320(sp)
 148:	52013903          	ld	s2,1312(sp)
 14c:	51813983          	ld	s3,1304(sp)
 150:	51013a03          	ld	s4,1296(sp)
 154:	54010113          	addi	sp,sp,1344
 158:	8082                	ret

000000000000015a <main>:

int main(int argc, char *argv[])
{
 15a:	7179                	addi	sp,sp,-48
 15c:	f406                	sd	ra,40(sp)
 15e:	f022                	sd	s0,32(sp)
 160:	ec26                	sd	s1,24(sp)
 162:	e84a                	sd	s2,16(sp)
 164:	e44e                	sd	s3,8(sp)
 166:	1800                	addi	s0,sp,48
    char **cmdarg;
    int i;
    int use_dash_n = 0;
    
    // Kiểm tra số lượng đối số
    if (argc < 2) {
 168:	4785                	li	a5,1
 16a:	06a7df63          	bge	a5,a0,1e8 <main+0x8e>
 16e:	84aa                	mv	s1,a0
 170:	892e                	mv	s2,a1
        fprintf(2, "Usage: xargs command [args...]\n");
        exit(1);
    }
    
    // Kiểm tra có tùy chọn -n hay không
    if (argc >= 4 && strcmp(argv[1], "-n") == 0 && strcmp(argv[2], "1") == 0) {
 172:	478d                	li	a5,3
 174:	02a7d463          	bge	a5,a0,19c <main+0x42>
 178:	00001597          	auipc	a1,0x1
 17c:	94058593          	addi	a1,a1,-1728 # ab8 <malloc+0x146>
 180:	00893503          	ld	a0,8(s2)
 184:	0e6000ef          	jal	26a <strcmp>
 188:	e911                	bnez	a0,19c <main+0x42>
 18a:	00001597          	auipc	a1,0x1
 18e:	93658593          	addi	a1,a1,-1738 # ac0 <malloc+0x14e>
 192:	01093503          	ld	a0,16(s2)
 196:	0d4000ef          	jal	26a <strcmp>
 19a:	c12d                	beqz	a0,1fc <main+0xa2>
        
        cmdarg[0] = argv[3];  // "echo"
        cmdarg[1] = 0;        // NULL terminate
    } else {
        // Cấp phát mảng mới cho cmdarg
        cmdarg = malloc(argc * sizeof(char*));
 19c:	0034951b          	slliw	a0,s1,0x3
 1a0:	7d2000ef          	jal	972 <malloc>
 1a4:	89aa                	mv	s3,a0
        if (cmdarg == 0) {
 1a6:	c149                	beqz	a0,228 <main+0xce>
 1a8:	00890793          	addi	a5,s2,8
 1ac:	872a                	mv	a4,a0
 1ae:	ffe4869b          	addiw	a3,s1,-2
 1b2:	02069613          	slli	a2,a3,0x20
 1b6:	01d65693          	srli	a3,a2,0x1d
 1ba:	0941                	addi	s2,s2,16
 1bc:	012685b3          	add	a1,a3,s2
            exit(1);
        }
        
        // Sao chép các đối số từ argv[1] trở đi
        for (i = 1; i < argc; i++)
            cmdarg[i - 1] = argv[i];
 1c0:	6394                	ld	a3,0(a5)
 1c2:	e314                	sd	a3,0(a4)
        for (i = 1; i < argc; i++)
 1c4:	07a1                	addi	a5,a5,8
 1c6:	0721                	addi	a4,a4,8
 1c8:	feb79ce3          	bne	a5,a1,1c0 <main+0x66>
        
        // Đảm bảo null-terminate
        cmdarg[argc - 1] = 0;
 1cc:	048e                	slli	s1,s1,0x3
 1ce:	94ce                	add	s1,s1,s3
 1d0:	fe04bc23          	sd	zero,-8(s1)
    int use_dash_n = 0;
 1d4:	4581                	li	a1,0
    }
    
    // Gọi hàm xargs
    xargs(cmdarg, use_dash_n);
 1d6:	854e                	mv	a0,s3
 1d8:	e29ff0ef          	jal	0 <xargs>
    
    // Giải phóng bộ nhớ
    free(cmdarg);
 1dc:	854e                	mv	a0,s3
 1de:	712000ef          	jal	8f0 <free>
    exit(0);
 1e2:	4501                	li	a0,0
 1e4:	2c2000ef          	jal	4a6 <exit>
        fprintf(2, "Usage: xargs command [args...]\n");
 1e8:	00001597          	auipc	a1,0x1
 1ec:	8b058593          	addi	a1,a1,-1872 # a98 <malloc+0x126>
 1f0:	4509                	li	a0,2
 1f2:	6a2000ef          	jal	894 <fprintf>
        exit(1);
 1f6:	4505                	li	a0,1
 1f8:	2ae000ef          	jal	4a6 <exit>
        cmdarg = malloc(2 * sizeof(char*));
 1fc:	4541                	li	a0,16
 1fe:	774000ef          	jal	972 <malloc>
 202:	89aa                	mv	s3,a0
        if (cmdarg == 0) {
 204:	c901                	beqz	a0,214 <main+0xba>
        cmdarg[0] = argv[3];  // "echo"
 206:	01893783          	ld	a5,24(s2)
 20a:	e11c                	sd	a5,0(a0)
        cmdarg[1] = 0;        // NULL terminate
 20c:	00053423          	sd	zero,8(a0)
        use_dash_n = 1;
 210:	4585                	li	a1,1
        cmdarg[1] = 0;        // NULL terminate
 212:	b7d1                	j	1d6 <main+0x7c>
            fprintf(2, "xargs: malloc failed\n");
 214:	00001597          	auipc	a1,0x1
 218:	8b458593          	addi	a1,a1,-1868 # ac8 <malloc+0x156>
 21c:	4509                	li	a0,2
 21e:	676000ef          	jal	894 <fprintf>
            exit(1);
 222:	4505                	li	a0,1
 224:	282000ef          	jal	4a6 <exit>
            fprintf(2, "xargs: malloc failed\n");
 228:	00001597          	auipc	a1,0x1
 22c:	8a058593          	addi	a1,a1,-1888 # ac8 <malloc+0x156>
 230:	4509                	li	a0,2
 232:	662000ef          	jal	894 <fprintf>
            exit(1);
 236:	4505                	li	a0,1
 238:	26e000ef          	jal	4a6 <exit>

000000000000023c <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 23c:	1141                	addi	sp,sp,-16
 23e:	e406                	sd	ra,8(sp)
 240:	e022                	sd	s0,0(sp)
 242:	0800                	addi	s0,sp,16
  extern int main();
  main();
 244:	f17ff0ef          	jal	15a <main>
  exit(0);
 248:	4501                	li	a0,0
 24a:	25c000ef          	jal	4a6 <exit>

000000000000024e <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 24e:	1141                	addi	sp,sp,-16
 250:	e422                	sd	s0,8(sp)
 252:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 254:	87aa                	mv	a5,a0
 256:	0585                	addi	a1,a1,1
 258:	0785                	addi	a5,a5,1
 25a:	fff5c703          	lbu	a4,-1(a1)
 25e:	fee78fa3          	sb	a4,-1(a5)
 262:	fb75                	bnez	a4,256 <strcpy+0x8>
    ;
  return os;
}
 264:	6422                	ld	s0,8(sp)
 266:	0141                	addi	sp,sp,16
 268:	8082                	ret

000000000000026a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 270:	00054783          	lbu	a5,0(a0)
 274:	cb91                	beqz	a5,288 <strcmp+0x1e>
 276:	0005c703          	lbu	a4,0(a1)
 27a:	00f71763          	bne	a4,a5,288 <strcmp+0x1e>
    p++, q++;
 27e:	0505                	addi	a0,a0,1
 280:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 282:	00054783          	lbu	a5,0(a0)
 286:	fbe5                	bnez	a5,276 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 288:	0005c503          	lbu	a0,0(a1)
}
 28c:	40a7853b          	subw	a0,a5,a0
 290:	6422                	ld	s0,8(sp)
 292:	0141                	addi	sp,sp,16
 294:	8082                	ret

0000000000000296 <strlen>:

uint
strlen(const char *s)
{
 296:	1141                	addi	sp,sp,-16
 298:	e422                	sd	s0,8(sp)
 29a:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 29c:	00054783          	lbu	a5,0(a0)
 2a0:	cf91                	beqz	a5,2bc <strlen+0x26>
 2a2:	0505                	addi	a0,a0,1
 2a4:	87aa                	mv	a5,a0
 2a6:	86be                	mv	a3,a5
 2a8:	0785                	addi	a5,a5,1
 2aa:	fff7c703          	lbu	a4,-1(a5)
 2ae:	ff65                	bnez	a4,2a6 <strlen+0x10>
 2b0:	40a6853b          	subw	a0,a3,a0
 2b4:	2505                	addiw	a0,a0,1
    ;
  return n;
}
 2b6:	6422                	ld	s0,8(sp)
 2b8:	0141                	addi	sp,sp,16
 2ba:	8082                	ret
  for(n = 0; s[n]; n++)
 2bc:	4501                	li	a0,0
 2be:	bfe5                	j	2b6 <strlen+0x20>

00000000000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	1141                	addi	sp,sp,-16
 2c2:	e422                	sd	s0,8(sp)
 2c4:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2c6:	ca19                	beqz	a2,2dc <memset+0x1c>
 2c8:	87aa                	mv	a5,a0
 2ca:	1602                	slli	a2,a2,0x20
 2cc:	9201                	srli	a2,a2,0x20
 2ce:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2d2:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2d6:	0785                	addi	a5,a5,1
 2d8:	fee79de3          	bne	a5,a4,2d2 <memset+0x12>
  }
  return dst;
}
 2dc:	6422                	ld	s0,8(sp)
 2de:	0141                	addi	sp,sp,16
 2e0:	8082                	ret

00000000000002e2 <strchr>:

char*
strchr(const char *s, char c)
{
 2e2:	1141                	addi	sp,sp,-16
 2e4:	e422                	sd	s0,8(sp)
 2e6:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2e8:	00054783          	lbu	a5,0(a0)
 2ec:	cb99                	beqz	a5,302 <strchr+0x20>
    if(*s == c)
 2ee:	00f58763          	beq	a1,a5,2fc <strchr+0x1a>
  for(; *s; s++)
 2f2:	0505                	addi	a0,a0,1
 2f4:	00054783          	lbu	a5,0(a0)
 2f8:	fbfd                	bnez	a5,2ee <strchr+0xc>
      return (char*)s;
  return 0;
 2fa:	4501                	li	a0,0
}
 2fc:	6422                	ld	s0,8(sp)
 2fe:	0141                	addi	sp,sp,16
 300:	8082                	ret
  return 0;
 302:	4501                	li	a0,0
 304:	bfe5                	j	2fc <strchr+0x1a>

0000000000000306 <gets>:

char*
gets(char *buf, int max)
{
 306:	711d                	addi	sp,sp,-96
 308:	ec86                	sd	ra,88(sp)
 30a:	e8a2                	sd	s0,80(sp)
 30c:	e4a6                	sd	s1,72(sp)
 30e:	e0ca                	sd	s2,64(sp)
 310:	fc4e                	sd	s3,56(sp)
 312:	f852                	sd	s4,48(sp)
 314:	f456                	sd	s5,40(sp)
 316:	f05a                	sd	s6,32(sp)
 318:	ec5e                	sd	s7,24(sp)
 31a:	1080                	addi	s0,sp,96
 31c:	8baa                	mv	s7,a0
 31e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 320:	892a                	mv	s2,a0
 322:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 324:	4aa9                	li	s5,10
 326:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 328:	89a6                	mv	s3,s1
 32a:	2485                	addiw	s1,s1,1
 32c:	0344d663          	bge	s1,s4,358 <gets+0x52>
    cc = read(0, &c, 1);
 330:	4605                	li	a2,1
 332:	faf40593          	addi	a1,s0,-81
 336:	4501                	li	a0,0
 338:	186000ef          	jal	4be <read>
    if(cc < 1)
 33c:	00a05e63          	blez	a0,358 <gets+0x52>
    buf[i++] = c;
 340:	faf44783          	lbu	a5,-81(s0)
 344:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 348:	01578763          	beq	a5,s5,356 <gets+0x50>
 34c:	0905                	addi	s2,s2,1
 34e:	fd679de3          	bne	a5,s6,328 <gets+0x22>
    buf[i++] = c;
 352:	89a6                	mv	s3,s1
 354:	a011                	j	358 <gets+0x52>
 356:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 358:	99de                	add	s3,s3,s7
 35a:	00098023          	sb	zero,0(s3)
  return buf;
}
 35e:	855e                	mv	a0,s7
 360:	60e6                	ld	ra,88(sp)
 362:	6446                	ld	s0,80(sp)
 364:	64a6                	ld	s1,72(sp)
 366:	6906                	ld	s2,64(sp)
 368:	79e2                	ld	s3,56(sp)
 36a:	7a42                	ld	s4,48(sp)
 36c:	7aa2                	ld	s5,40(sp)
 36e:	7b02                	ld	s6,32(sp)
 370:	6be2                	ld	s7,24(sp)
 372:	6125                	addi	sp,sp,96
 374:	8082                	ret

0000000000000376 <stat>:

int
stat(const char *n, struct stat *st)
{
 376:	1101                	addi	sp,sp,-32
 378:	ec06                	sd	ra,24(sp)
 37a:	e822                	sd	s0,16(sp)
 37c:	e04a                	sd	s2,0(sp)
 37e:	1000                	addi	s0,sp,32
 380:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 382:	4581                	li	a1,0
 384:	162000ef          	jal	4e6 <open>
  if(fd < 0)
 388:	02054263          	bltz	a0,3ac <stat+0x36>
 38c:	e426                	sd	s1,8(sp)
 38e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 390:	85ca                	mv	a1,s2
 392:	16c000ef          	jal	4fe <fstat>
 396:	892a                	mv	s2,a0
  close(fd);
 398:	8526                	mv	a0,s1
 39a:	134000ef          	jal	4ce <close>
  return r;
 39e:	64a2                	ld	s1,8(sp)
}
 3a0:	854a                	mv	a0,s2
 3a2:	60e2                	ld	ra,24(sp)
 3a4:	6442                	ld	s0,16(sp)
 3a6:	6902                	ld	s2,0(sp)
 3a8:	6105                	addi	sp,sp,32
 3aa:	8082                	ret
    return -1;
 3ac:	597d                	li	s2,-1
 3ae:	bfcd                	j	3a0 <stat+0x2a>

00000000000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	1141                	addi	sp,sp,-16
 3b2:	e422                	sd	s0,8(sp)
 3b4:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b6:	00054683          	lbu	a3,0(a0)
 3ba:	fd06879b          	addiw	a5,a3,-48
 3be:	0ff7f793          	zext.b	a5,a5
 3c2:	4625                	li	a2,9
 3c4:	02f66863          	bltu	a2,a5,3f4 <atoi+0x44>
 3c8:	872a                	mv	a4,a0
  n = 0;
 3ca:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 3cc:	0705                	addi	a4,a4,1
 3ce:	0025179b          	slliw	a5,a0,0x2
 3d2:	9fa9                	addw	a5,a5,a0
 3d4:	0017979b          	slliw	a5,a5,0x1
 3d8:	9fb5                	addw	a5,a5,a3
 3da:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 3de:	00074683          	lbu	a3,0(a4)
 3e2:	fd06879b          	addiw	a5,a3,-48
 3e6:	0ff7f793          	zext.b	a5,a5
 3ea:	fef671e3          	bgeu	a2,a5,3cc <atoi+0x1c>
  return n;
}
 3ee:	6422                	ld	s0,8(sp)
 3f0:	0141                	addi	sp,sp,16
 3f2:	8082                	ret
  n = 0;
 3f4:	4501                	li	a0,0
 3f6:	bfe5                	j	3ee <atoi+0x3e>

00000000000003f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f8:	1141                	addi	sp,sp,-16
 3fa:	e422                	sd	s0,8(sp)
 3fc:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3fe:	02b57463          	bgeu	a0,a1,426 <memmove+0x2e>
    while(n-- > 0)
 402:	00c05f63          	blez	a2,420 <memmove+0x28>
 406:	1602                	slli	a2,a2,0x20
 408:	9201                	srli	a2,a2,0x20
 40a:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 40e:	872a                	mv	a4,a0
      *dst++ = *src++;
 410:	0585                	addi	a1,a1,1
 412:	0705                	addi	a4,a4,1
 414:	fff5c683          	lbu	a3,-1(a1)
 418:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 41c:	fef71ae3          	bne	a4,a5,410 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 420:	6422                	ld	s0,8(sp)
 422:	0141                	addi	sp,sp,16
 424:	8082                	ret
    dst += n;
 426:	00c50733          	add	a4,a0,a2
    src += n;
 42a:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 42c:	fec05ae3          	blez	a2,420 <memmove+0x28>
 430:	fff6079b          	addiw	a5,a2,-1
 434:	1782                	slli	a5,a5,0x20
 436:	9381                	srli	a5,a5,0x20
 438:	fff7c793          	not	a5,a5
 43c:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 43e:	15fd                	addi	a1,a1,-1
 440:	177d                	addi	a4,a4,-1
 442:	0005c683          	lbu	a3,0(a1)
 446:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 44a:	fee79ae3          	bne	a5,a4,43e <memmove+0x46>
 44e:	bfc9                	j	420 <memmove+0x28>

0000000000000450 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 450:	1141                	addi	sp,sp,-16
 452:	e422                	sd	s0,8(sp)
 454:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 456:	ca05                	beqz	a2,486 <memcmp+0x36>
 458:	fff6069b          	addiw	a3,a2,-1
 45c:	1682                	slli	a3,a3,0x20
 45e:	9281                	srli	a3,a3,0x20
 460:	0685                	addi	a3,a3,1
 462:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 464:	00054783          	lbu	a5,0(a0)
 468:	0005c703          	lbu	a4,0(a1)
 46c:	00e79863          	bne	a5,a4,47c <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 470:	0505                	addi	a0,a0,1
    p2++;
 472:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 474:	fed518e3          	bne	a0,a3,464 <memcmp+0x14>
  }
  return 0;
 478:	4501                	li	a0,0
 47a:	a019                	j	480 <memcmp+0x30>
      return *p1 - *p2;
 47c:	40e7853b          	subw	a0,a5,a4
}
 480:	6422                	ld	s0,8(sp)
 482:	0141                	addi	sp,sp,16
 484:	8082                	ret
  return 0;
 486:	4501                	li	a0,0
 488:	bfe5                	j	480 <memcmp+0x30>

000000000000048a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 48a:	1141                	addi	sp,sp,-16
 48c:	e406                	sd	ra,8(sp)
 48e:	e022                	sd	s0,0(sp)
 490:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 492:	f67ff0ef          	jal	3f8 <memmove>
}
 496:	60a2                	ld	ra,8(sp)
 498:	6402                	ld	s0,0(sp)
 49a:	0141                	addi	sp,sp,16
 49c:	8082                	ret

000000000000049e <fork>:
 49e:	4885                	li	a7,1
 4a0:	00000073          	ecall
 4a4:	8082                	ret

00000000000004a6 <exit>:
 4a6:	4889                	li	a7,2
 4a8:	00000073          	ecall
 4ac:	8082                	ret

00000000000004ae <wait>:
 4ae:	488d                	li	a7,3
 4b0:	00000073          	ecall
 4b4:	8082                	ret

00000000000004b6 <pipe>:
 4b6:	4891                	li	a7,4
 4b8:	00000073          	ecall
 4bc:	8082                	ret

00000000000004be <read>:
 4be:	4895                	li	a7,5
 4c0:	00000073          	ecall
 4c4:	8082                	ret

00000000000004c6 <write>:
 4c6:	48c1                	li	a7,16
 4c8:	00000073          	ecall
 4cc:	8082                	ret

00000000000004ce <close>:
 4ce:	48d5                	li	a7,21
 4d0:	00000073          	ecall
 4d4:	8082                	ret

00000000000004d6 <kill>:
 4d6:	4899                	li	a7,6
 4d8:	00000073          	ecall
 4dc:	8082                	ret

00000000000004de <exec>:
 4de:	489d                	li	a7,7
 4e0:	00000073          	ecall
 4e4:	8082                	ret

00000000000004e6 <open>:
 4e6:	48bd                	li	a7,15
 4e8:	00000073          	ecall
 4ec:	8082                	ret

00000000000004ee <mknod>:
 4ee:	48c5                	li	a7,17
 4f0:	00000073          	ecall
 4f4:	8082                	ret

00000000000004f6 <unlink>:
 4f6:	48c9                	li	a7,18
 4f8:	00000073          	ecall
 4fc:	8082                	ret

00000000000004fe <fstat>:
 4fe:	48a1                	li	a7,8
 500:	00000073          	ecall
 504:	8082                	ret

0000000000000506 <link>:
 506:	48cd                	li	a7,19
 508:	00000073          	ecall
 50c:	8082                	ret

000000000000050e <mkdir>:
 50e:	48d1                	li	a7,20
 510:	00000073          	ecall
 514:	8082                	ret

0000000000000516 <chdir>:
 516:	48a5                	li	a7,9
 518:	00000073          	ecall
 51c:	8082                	ret

000000000000051e <dup>:
 51e:	48a9                	li	a7,10
 520:	00000073          	ecall
 524:	8082                	ret

0000000000000526 <getpid>:
 526:	48ad                	li	a7,11
 528:	00000073          	ecall
 52c:	8082                	ret

000000000000052e <sbrk>:
 52e:	48b1                	li	a7,12
 530:	00000073          	ecall
 534:	8082                	ret

0000000000000536 <sleep>:
 536:	48b5                	li	a7,13
 538:	00000073          	ecall
 53c:	8082                	ret

000000000000053e <uptime>:
 53e:	48b9                	li	a7,14
 540:	00000073          	ecall
 544:	8082                	ret

0000000000000546 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 546:	1101                	addi	sp,sp,-32
 548:	ec06                	sd	ra,24(sp)
 54a:	e822                	sd	s0,16(sp)
 54c:	1000                	addi	s0,sp,32
 54e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 552:	4605                	li	a2,1
 554:	fef40593          	addi	a1,s0,-17
 558:	f6fff0ef          	jal	4c6 <write>
}
 55c:	60e2                	ld	ra,24(sp)
 55e:	6442                	ld	s0,16(sp)
 560:	6105                	addi	sp,sp,32
 562:	8082                	ret

0000000000000564 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 564:	7139                	addi	sp,sp,-64
 566:	fc06                	sd	ra,56(sp)
 568:	f822                	sd	s0,48(sp)
 56a:	f426                	sd	s1,40(sp)
 56c:	0080                	addi	s0,sp,64
 56e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 570:	c299                	beqz	a3,576 <printint+0x12>
 572:	0805c963          	bltz	a1,604 <printint+0xa0>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 576:	2581                	sext.w	a1,a1
  neg = 0;
 578:	4881                	li	a7,0
 57a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 57e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 580:	2601                	sext.w	a2,a2
 582:	00000517          	auipc	a0,0x0
 586:	56650513          	addi	a0,a0,1382 # ae8 <digits>
 58a:	883a                	mv	a6,a4
 58c:	2705                	addiw	a4,a4,1
 58e:	02c5f7bb          	remuw	a5,a1,a2
 592:	1782                	slli	a5,a5,0x20
 594:	9381                	srli	a5,a5,0x20
 596:	97aa                	add	a5,a5,a0
 598:	0007c783          	lbu	a5,0(a5)
 59c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5a0:	0005879b          	sext.w	a5,a1
 5a4:	02c5d5bb          	divuw	a1,a1,a2
 5a8:	0685                	addi	a3,a3,1
 5aa:	fec7f0e3          	bgeu	a5,a2,58a <printint+0x26>
  if(neg)
 5ae:	00088c63          	beqz	a7,5c6 <printint+0x62>
    buf[i++] = '-';
 5b2:	fd070793          	addi	a5,a4,-48
 5b6:	00878733          	add	a4,a5,s0
 5ba:	02d00793          	li	a5,45
 5be:	fef70823          	sb	a5,-16(a4)
 5c2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5c6:	02e05a63          	blez	a4,5fa <printint+0x96>
 5ca:	f04a                	sd	s2,32(sp)
 5cc:	ec4e                	sd	s3,24(sp)
 5ce:	fc040793          	addi	a5,s0,-64
 5d2:	00e78933          	add	s2,a5,a4
 5d6:	fff78993          	addi	s3,a5,-1
 5da:	99ba                	add	s3,s3,a4
 5dc:	377d                	addiw	a4,a4,-1
 5de:	1702                	slli	a4,a4,0x20
 5e0:	9301                	srli	a4,a4,0x20
 5e2:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5e6:	fff94583          	lbu	a1,-1(s2)
 5ea:	8526                	mv	a0,s1
 5ec:	f5bff0ef          	jal	546 <putc>
  while(--i >= 0)
 5f0:	197d                	addi	s2,s2,-1
 5f2:	ff391ae3          	bne	s2,s3,5e6 <printint+0x82>
 5f6:	7902                	ld	s2,32(sp)
 5f8:	69e2                	ld	s3,24(sp)
}
 5fa:	70e2                	ld	ra,56(sp)
 5fc:	7442                	ld	s0,48(sp)
 5fe:	74a2                	ld	s1,40(sp)
 600:	6121                	addi	sp,sp,64
 602:	8082                	ret
    x = -xx;
 604:	40b005bb          	negw	a1,a1
    neg = 1;
 608:	4885                	li	a7,1
    x = -xx;
 60a:	bf85                	j	57a <printint+0x16>

000000000000060c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 60c:	711d                	addi	sp,sp,-96
 60e:	ec86                	sd	ra,88(sp)
 610:	e8a2                	sd	s0,80(sp)
 612:	e0ca                	sd	s2,64(sp)
 614:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 616:	0005c903          	lbu	s2,0(a1)
 61a:	26090863          	beqz	s2,88a <vprintf+0x27e>
 61e:	e4a6                	sd	s1,72(sp)
 620:	fc4e                	sd	s3,56(sp)
 622:	f852                	sd	s4,48(sp)
 624:	f456                	sd	s5,40(sp)
 626:	f05a                	sd	s6,32(sp)
 628:	ec5e                	sd	s7,24(sp)
 62a:	e862                	sd	s8,16(sp)
 62c:	e466                	sd	s9,8(sp)
 62e:	8b2a                	mv	s6,a0
 630:	8a2e                	mv	s4,a1
 632:	8bb2                	mv	s7,a2
  state = 0;
 634:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 636:	4481                	li	s1,0
 638:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 63a:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 63e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 642:	06c00c93          	li	s9,108
 646:	a005                	j	666 <vprintf+0x5a>
        putc(fd, c0);
 648:	85ca                	mv	a1,s2
 64a:	855a                	mv	a0,s6
 64c:	efbff0ef          	jal	546 <putc>
 650:	a019                	j	656 <vprintf+0x4a>
    } else if(state == '%'){
 652:	03598263          	beq	s3,s5,676 <vprintf+0x6a>
  for(i = 0; fmt[i]; i++){
 656:	2485                	addiw	s1,s1,1
 658:	8726                	mv	a4,s1
 65a:	009a07b3          	add	a5,s4,s1
 65e:	0007c903          	lbu	s2,0(a5)
 662:	20090c63          	beqz	s2,87a <vprintf+0x26e>
    c0 = fmt[i] & 0xff;
 666:	0009079b          	sext.w	a5,s2
    if(state == 0){
 66a:	fe0994e3          	bnez	s3,652 <vprintf+0x46>
      if(c0 == '%'){
 66e:	fd579de3          	bne	a5,s5,648 <vprintf+0x3c>
        state = '%';
 672:	89be                	mv	s3,a5
 674:	b7cd                	j	656 <vprintf+0x4a>
      if(c0) c1 = fmt[i+1] & 0xff;
 676:	00ea06b3          	add	a3,s4,a4
 67a:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 67e:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 680:	c681                	beqz	a3,688 <vprintf+0x7c>
 682:	9752                	add	a4,a4,s4
 684:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 688:	03878f63          	beq	a5,s8,6c6 <vprintf+0xba>
      } else if(c0 == 'l' && c1 == 'd'){
 68c:	05978963          	beq	a5,s9,6de <vprintf+0xd2>
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 690:	07500713          	li	a4,117
 694:	0ee78363          	beq	a5,a4,77a <vprintf+0x16e>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 698:	07800713          	li	a4,120
 69c:	12e78563          	beq	a5,a4,7c6 <vprintf+0x1ba>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 6a0:	07000713          	li	a4,112
 6a4:	14e78a63          	beq	a5,a4,7f8 <vprintf+0x1ec>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
 6a8:	07300713          	li	a4,115
 6ac:	18e78a63          	beq	a5,a4,840 <vprintf+0x234>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 6b0:	02500713          	li	a4,37
 6b4:	04e79563          	bne	a5,a4,6fe <vprintf+0xf2>
        putc(fd, '%');
 6b8:	02500593          	li	a1,37
 6bc:	855a                	mv	a0,s6
 6be:	e89ff0ef          	jal	546 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
 6c2:	4981                	li	s3,0
 6c4:	bf49                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 1);
 6c6:	008b8913          	addi	s2,s7,8
 6ca:	4685                	li	a3,1
 6cc:	4629                	li	a2,10
 6ce:	000ba583          	lw	a1,0(s7)
 6d2:	855a                	mv	a0,s6
 6d4:	e91ff0ef          	jal	564 <printint>
 6d8:	8bca                	mv	s7,s2
      state = 0;
 6da:	4981                	li	s3,0
 6dc:	bfad                	j	656 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'd'){
 6de:	06400793          	li	a5,100
 6e2:	02f68963          	beq	a3,a5,714 <vprintf+0x108>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 6e6:	06c00793          	li	a5,108
 6ea:	04f68263          	beq	a3,a5,72e <vprintf+0x122>
      } else if(c0 == 'l' && c1 == 'u'){
 6ee:	07500793          	li	a5,117
 6f2:	0af68063          	beq	a3,a5,792 <vprintf+0x186>
      } else if(c0 == 'l' && c1 == 'x'){
 6f6:	07800793          	li	a5,120
 6fa:	0ef68263          	beq	a3,a5,7de <vprintf+0x1d2>
        putc(fd, '%');
 6fe:	02500593          	li	a1,37
 702:	855a                	mv	a0,s6
 704:	e43ff0ef          	jal	546 <putc>
        putc(fd, c0);
 708:	85ca                	mv	a1,s2
 70a:	855a                	mv	a0,s6
 70c:	e3bff0ef          	jal	546 <putc>
      state = 0;
 710:	4981                	li	s3,0
 712:	b791                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 714:	008b8913          	addi	s2,s7,8
 718:	4685                	li	a3,1
 71a:	4629                	li	a2,10
 71c:	000ba583          	lw	a1,0(s7)
 720:	855a                	mv	a0,s6
 722:	e43ff0ef          	jal	564 <printint>
        i += 1;
 726:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 728:	8bca                	mv	s7,s2
      state = 0;
 72a:	4981                	li	s3,0
        i += 1;
 72c:	b72d                	j	656 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 72e:	06400793          	li	a5,100
 732:	02f60763          	beq	a2,a5,760 <vprintf+0x154>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 736:	07500793          	li	a5,117
 73a:	06f60963          	beq	a2,a5,7ac <vprintf+0x1a0>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 73e:	07800793          	li	a5,120
 742:	faf61ee3          	bne	a2,a5,6fe <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
 746:	008b8913          	addi	s2,s7,8
 74a:	4681                	li	a3,0
 74c:	4641                	li	a2,16
 74e:	000ba583          	lw	a1,0(s7)
 752:	855a                	mv	a0,s6
 754:	e11ff0ef          	jal	564 <printint>
        i += 2;
 758:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 75a:	8bca                	mv	s7,s2
      state = 0;
 75c:	4981                	li	s3,0
        i += 2;
 75e:	bde5                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 760:	008b8913          	addi	s2,s7,8
 764:	4685                	li	a3,1
 766:	4629                	li	a2,10
 768:	000ba583          	lw	a1,0(s7)
 76c:	855a                	mv	a0,s6
 76e:	df7ff0ef          	jal	564 <printint>
        i += 2;
 772:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 774:	8bca                	mv	s7,s2
      state = 0;
 776:	4981                	li	s3,0
        i += 2;
 778:	bdf9                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 0);
 77a:	008b8913          	addi	s2,s7,8
 77e:	4681                	li	a3,0
 780:	4629                	li	a2,10
 782:	000ba583          	lw	a1,0(s7)
 786:	855a                	mv	a0,s6
 788:	dddff0ef          	jal	564 <printint>
 78c:	8bca                	mv	s7,s2
      state = 0;
 78e:	4981                	li	s3,0
 790:	b5d9                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 792:	008b8913          	addi	s2,s7,8
 796:	4681                	li	a3,0
 798:	4629                	li	a2,10
 79a:	000ba583          	lw	a1,0(s7)
 79e:	855a                	mv	a0,s6
 7a0:	dc5ff0ef          	jal	564 <printint>
        i += 1;
 7a4:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 7a6:	8bca                	mv	s7,s2
      state = 0;
 7a8:	4981                	li	s3,0
        i += 1;
 7aa:	b575                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7ac:	008b8913          	addi	s2,s7,8
 7b0:	4681                	li	a3,0
 7b2:	4629                	li	a2,10
 7b4:	000ba583          	lw	a1,0(s7)
 7b8:	855a                	mv	a0,s6
 7ba:	dabff0ef          	jal	564 <printint>
        i += 2;
 7be:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 7c0:	8bca                	mv	s7,s2
      state = 0;
 7c2:	4981                	li	s3,0
        i += 2;
 7c4:	bd49                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 16, 0);
 7c6:	008b8913          	addi	s2,s7,8
 7ca:	4681                	li	a3,0
 7cc:	4641                	li	a2,16
 7ce:	000ba583          	lw	a1,0(s7)
 7d2:	855a                	mv	a0,s6
 7d4:	d91ff0ef          	jal	564 <printint>
 7d8:	8bca                	mv	s7,s2
      state = 0;
 7da:	4981                	li	s3,0
 7dc:	bdad                	j	656 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7de:	008b8913          	addi	s2,s7,8
 7e2:	4681                	li	a3,0
 7e4:	4641                	li	a2,16
 7e6:	000ba583          	lw	a1,0(s7)
 7ea:	855a                	mv	a0,s6
 7ec:	d79ff0ef          	jal	564 <printint>
        i += 1;
 7f0:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 7f2:	8bca                	mv	s7,s2
      state = 0;
 7f4:	4981                	li	s3,0
        i += 1;
 7f6:	b585                	j	656 <vprintf+0x4a>
 7f8:	e06a                	sd	s10,0(sp)
        printptr(fd, va_arg(ap, uint64));
 7fa:	008b8d13          	addi	s10,s7,8
 7fe:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 802:	03000593          	li	a1,48
 806:	855a                	mv	a0,s6
 808:	d3fff0ef          	jal	546 <putc>
  putc(fd, 'x');
 80c:	07800593          	li	a1,120
 810:	855a                	mv	a0,s6
 812:	d35ff0ef          	jal	546 <putc>
 816:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 818:	00000b97          	auipc	s7,0x0
 81c:	2d0b8b93          	addi	s7,s7,720 # ae8 <digits>
 820:	03c9d793          	srli	a5,s3,0x3c
 824:	97de                	add	a5,a5,s7
 826:	0007c583          	lbu	a1,0(a5)
 82a:	855a                	mv	a0,s6
 82c:	d1bff0ef          	jal	546 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 830:	0992                	slli	s3,s3,0x4
 832:	397d                	addiw	s2,s2,-1
 834:	fe0916e3          	bnez	s2,820 <vprintf+0x214>
        printptr(fd, va_arg(ap, uint64));
 838:	8bea                	mv	s7,s10
      state = 0;
 83a:	4981                	li	s3,0
 83c:	6d02                	ld	s10,0(sp)
 83e:	bd21                	j	656 <vprintf+0x4a>
        if((s = va_arg(ap, char*)) == 0)
 840:	008b8993          	addi	s3,s7,8
 844:	000bb903          	ld	s2,0(s7)
 848:	00090f63          	beqz	s2,866 <vprintf+0x25a>
        for(; *s; s++)
 84c:	00094583          	lbu	a1,0(s2)
 850:	c195                	beqz	a1,874 <vprintf+0x268>
          putc(fd, *s);
 852:	855a                	mv	a0,s6
 854:	cf3ff0ef          	jal	546 <putc>
        for(; *s; s++)
 858:	0905                	addi	s2,s2,1
 85a:	00094583          	lbu	a1,0(s2)
 85e:	f9f5                	bnez	a1,852 <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
 860:	8bce                	mv	s7,s3
      state = 0;
 862:	4981                	li	s3,0
 864:	bbcd                	j	656 <vprintf+0x4a>
          s = "(null)";
 866:	00000917          	auipc	s2,0x0
 86a:	27a90913          	addi	s2,s2,634 # ae0 <malloc+0x16e>
        for(; *s; s++)
 86e:	02800593          	li	a1,40
 872:	b7c5                	j	852 <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
 874:	8bce                	mv	s7,s3
      state = 0;
 876:	4981                	li	s3,0
 878:	bbf9                	j	656 <vprintf+0x4a>
 87a:	64a6                	ld	s1,72(sp)
 87c:	79e2                	ld	s3,56(sp)
 87e:	7a42                	ld	s4,48(sp)
 880:	7aa2                	ld	s5,40(sp)
 882:	7b02                	ld	s6,32(sp)
 884:	6be2                	ld	s7,24(sp)
 886:	6c42                	ld	s8,16(sp)
 888:	6ca2                	ld	s9,8(sp)
    }
  }
}
 88a:	60e6                	ld	ra,88(sp)
 88c:	6446                	ld	s0,80(sp)
 88e:	6906                	ld	s2,64(sp)
 890:	6125                	addi	sp,sp,96
 892:	8082                	ret

0000000000000894 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 894:	715d                	addi	sp,sp,-80
 896:	ec06                	sd	ra,24(sp)
 898:	e822                	sd	s0,16(sp)
 89a:	1000                	addi	s0,sp,32
 89c:	e010                	sd	a2,0(s0)
 89e:	e414                	sd	a3,8(s0)
 8a0:	e818                	sd	a4,16(s0)
 8a2:	ec1c                	sd	a5,24(s0)
 8a4:	03043023          	sd	a6,32(s0)
 8a8:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 8ac:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 8b0:	8622                	mv	a2,s0
 8b2:	d5bff0ef          	jal	60c <vprintf>
}
 8b6:	60e2                	ld	ra,24(sp)
 8b8:	6442                	ld	s0,16(sp)
 8ba:	6161                	addi	sp,sp,80
 8bc:	8082                	ret

00000000000008be <printf>:

void
printf(const char *fmt, ...)
{
 8be:	711d                	addi	sp,sp,-96
 8c0:	ec06                	sd	ra,24(sp)
 8c2:	e822                	sd	s0,16(sp)
 8c4:	1000                	addi	s0,sp,32
 8c6:	e40c                	sd	a1,8(s0)
 8c8:	e810                	sd	a2,16(s0)
 8ca:	ec14                	sd	a3,24(s0)
 8cc:	f018                	sd	a4,32(s0)
 8ce:	f41c                	sd	a5,40(s0)
 8d0:	03043823          	sd	a6,48(s0)
 8d4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 8d8:	00840613          	addi	a2,s0,8
 8dc:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 8e0:	85aa                	mv	a1,a0
 8e2:	4505                	li	a0,1
 8e4:	d29ff0ef          	jal	60c <vprintf>
}
 8e8:	60e2                	ld	ra,24(sp)
 8ea:	6442                	ld	s0,16(sp)
 8ec:	6125                	addi	sp,sp,96
 8ee:	8082                	ret

00000000000008f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f0:	1141                	addi	sp,sp,-16
 8f2:	e422                	sd	s0,8(sp)
 8f4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8f6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8fa:	00000797          	auipc	a5,0x0
 8fe:	7067b783          	ld	a5,1798(a5) # 1000 <freep>
 902:	a02d                	j	92c <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 904:	4618                	lw	a4,8(a2)
 906:	9f2d                	addw	a4,a4,a1
 908:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 90c:	6398                	ld	a4,0(a5)
 90e:	6310                	ld	a2,0(a4)
 910:	a83d                	j	94e <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 912:	ff852703          	lw	a4,-8(a0)
 916:	9f31                	addw	a4,a4,a2
 918:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 91a:	ff053683          	ld	a3,-16(a0)
 91e:	a091                	j	962 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 920:	6398                	ld	a4,0(a5)
 922:	00e7e463          	bltu	a5,a4,92a <free+0x3a>
 926:	00e6ea63          	bltu	a3,a4,93a <free+0x4a>
{
 92a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92c:	fed7fae3          	bgeu	a5,a3,920 <free+0x30>
 930:	6398                	ld	a4,0(a5)
 932:	00e6e463          	bltu	a3,a4,93a <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 936:	fee7eae3          	bltu	a5,a4,92a <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 93a:	ff852583          	lw	a1,-8(a0)
 93e:	6390                	ld	a2,0(a5)
 940:	02059813          	slli	a6,a1,0x20
 944:	01c85713          	srli	a4,a6,0x1c
 948:	9736                	add	a4,a4,a3
 94a:	fae60de3          	beq	a2,a4,904 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 94e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 952:	4790                	lw	a2,8(a5)
 954:	02061593          	slli	a1,a2,0x20
 958:	01c5d713          	srli	a4,a1,0x1c
 95c:	973e                	add	a4,a4,a5
 95e:	fae68ae3          	beq	a3,a4,912 <free+0x22>
    p->s.ptr = bp->s.ptr;
 962:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 964:	00000717          	auipc	a4,0x0
 968:	68f73e23          	sd	a5,1692(a4) # 1000 <freep>
}
 96c:	6422                	ld	s0,8(sp)
 96e:	0141                	addi	sp,sp,16
 970:	8082                	ret

0000000000000972 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 972:	7139                	addi	sp,sp,-64
 974:	fc06                	sd	ra,56(sp)
 976:	f822                	sd	s0,48(sp)
 978:	f426                	sd	s1,40(sp)
 97a:	ec4e                	sd	s3,24(sp)
 97c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 97e:	02051493          	slli	s1,a0,0x20
 982:	9081                	srli	s1,s1,0x20
 984:	04bd                	addi	s1,s1,15
 986:	8091                	srli	s1,s1,0x4
 988:	0014899b          	addiw	s3,s1,1
 98c:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 98e:	00000517          	auipc	a0,0x0
 992:	67253503          	ld	a0,1650(a0) # 1000 <freep>
 996:	c915                	beqz	a0,9ca <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 998:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 99a:	4798                	lw	a4,8(a5)
 99c:	08977a63          	bgeu	a4,s1,a30 <malloc+0xbe>
 9a0:	f04a                	sd	s2,32(sp)
 9a2:	e852                	sd	s4,16(sp)
 9a4:	e456                	sd	s5,8(sp)
 9a6:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 9a8:	8a4e                	mv	s4,s3
 9aa:	0009871b          	sext.w	a4,s3
 9ae:	6685                	lui	a3,0x1
 9b0:	00d77363          	bgeu	a4,a3,9b6 <malloc+0x44>
 9b4:	6a05                	lui	s4,0x1
 9b6:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9ba:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9be:	00000917          	auipc	s2,0x0
 9c2:	64290913          	addi	s2,s2,1602 # 1000 <freep>
  if(p == (char*)-1)
 9c6:	5afd                	li	s5,-1
 9c8:	a081                	j	a08 <malloc+0x96>
 9ca:	f04a                	sd	s2,32(sp)
 9cc:	e852                	sd	s4,16(sp)
 9ce:	e456                	sd	s5,8(sp)
 9d0:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 9d2:	00000797          	auipc	a5,0x0
 9d6:	63e78793          	addi	a5,a5,1598 # 1010 <base>
 9da:	00000717          	auipc	a4,0x0
 9de:	62f73323          	sd	a5,1574(a4) # 1000 <freep>
 9e2:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 9e4:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 9e8:	b7c1                	j	9a8 <malloc+0x36>
        prevp->s.ptr = p->s.ptr;
 9ea:	6398                	ld	a4,0(a5)
 9ec:	e118                	sd	a4,0(a0)
 9ee:	a8a9                	j	a48 <malloc+0xd6>
  hp->s.size = nu;
 9f0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9f4:	0541                	addi	a0,a0,16
 9f6:	efbff0ef          	jal	8f0 <free>
  return freep;
 9fa:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9fe:	c12d                	beqz	a0,a60 <malloc+0xee>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a00:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a02:	4798                	lw	a4,8(a5)
 a04:	02977263          	bgeu	a4,s1,a28 <malloc+0xb6>
    if(p == freep)
 a08:	00093703          	ld	a4,0(s2)
 a0c:	853e                	mv	a0,a5
 a0e:	fef719e3          	bne	a4,a5,a00 <malloc+0x8e>
  p = sbrk(nu * sizeof(Header));
 a12:	8552                	mv	a0,s4
 a14:	b1bff0ef          	jal	52e <sbrk>
  if(p == (char*)-1)
 a18:	fd551ce3          	bne	a0,s5,9f0 <malloc+0x7e>
        return 0;
 a1c:	4501                	li	a0,0
 a1e:	7902                	ld	s2,32(sp)
 a20:	6a42                	ld	s4,16(sp)
 a22:	6aa2                	ld	s5,8(sp)
 a24:	6b02                	ld	s6,0(sp)
 a26:	a03d                	j	a54 <malloc+0xe2>
 a28:	7902                	ld	s2,32(sp)
 a2a:	6a42                	ld	s4,16(sp)
 a2c:	6aa2                	ld	s5,8(sp)
 a2e:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 a30:	fae48de3          	beq	s1,a4,9ea <malloc+0x78>
        p->s.size -= nunits;
 a34:	4137073b          	subw	a4,a4,s3
 a38:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a3a:	02071693          	slli	a3,a4,0x20
 a3e:	01c6d713          	srli	a4,a3,0x1c
 a42:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a44:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a48:	00000717          	auipc	a4,0x0
 a4c:	5aa73c23          	sd	a0,1464(a4) # 1000 <freep>
      return (void*)(p + 1);
 a50:	01078513          	addi	a0,a5,16
  }
}
 a54:	70e2                	ld	ra,56(sp)
 a56:	7442                	ld	s0,48(sp)
 a58:	74a2                	ld	s1,40(sp)
 a5a:	69e2                	ld	s3,24(sp)
 a5c:	6121                	addi	sp,sp,64
 a5e:	8082                	ret
 a60:	7902                	ld	s2,32(sp)
 a62:	6a42                	ld	s4,16(sp)
 a64:	6aa2                	ld	s5,8(sp)
 a66:	6b02                	ld	s6,0(sp)
 a68:	b7f5                	j	a54 <malloc+0xe2>
