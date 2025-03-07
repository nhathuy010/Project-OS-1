#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void sieve(int fd) __attribute__((noreturn));

void sieve(int fd)
{
  int prime, r, num;
  r = read(fd, &prime, sizeof(prime));
  if(r == 0){
    close(fd);
    exit(0);
  }
  if(r != sizeof(prime)){
    fprintf(2, "PID %d: read error: expected %lu bytes, got %lu\n", getpid(), (unsigned long)sizeof(prime), (unsigned long)r);
    close(fd);
    exit(1);
  }
  printf("prime %d\n", prime);

  int p[2];
  if(pipe(p) < 0){
    fprintf(2, "PID %d: pipe() error\n", getpid());
    close(fd);
    exit(1);
  }

  int pid = fork();
  if(pid < 0){
    fprintf(2, "PID %d: fork() error\n", getpid());
    close(fd);
    close(p[0]);
    close(p[1]);
    exit(1);
  }
  if(pid == 0){
    close(p[1]);
    close(fd);
    sieve(p[0]);
    close(p[0]);
    exit(0);
  } else {
    close(p[0]);
    while((r = read(fd, &num, sizeof(num))) == sizeof(num)){
      if(num % prime != 0){
        if(write(p[1], &num, sizeof(num)) != sizeof(num)){
          fprintf(2, "PID %d: write error\n", getpid());
          close(fd);
          close(p[1]);
          exit(1);
        }
      }
    }
    if(r < 0){
      fprintf(2, "PID %d: read error in loop\n", getpid());
      close(fd);
      close(p[1]);
      exit(1);
    }
    close(fd);
    close(p[1]);
    wait(0);
    exit(0);
  }
}

int main()
{
  int p[2];
  if(pipe(p) < 0){
    fprintf(2, "PID %d: pipe() error\n", getpid());
    exit(1);
  }
  int pid = fork();
  if(pid < 0){
    fprintf(2, "PID %d: fork() error\n", getpid());
    exit(1);
  }
  if(pid == 0){
    close(p[1]);
    sieve(p[0]);
    close(p[0]);
    exit(0);
  } else {
    close(p[0]);
    for(int i = 2; i <= 280; i++){
      if(write(p[1], &i, sizeof(i)) != sizeof(i)){
        fprintf(2, "PID %d: write error in main\n", getpid());
        close(p[1]);
        exit(1);
      }
    }
    close(p[1]);
    wait(0);
    exit(0);
  }
}
