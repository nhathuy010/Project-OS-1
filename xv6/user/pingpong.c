#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(){
	int p1[2], p2[2];

	if (pipe(p1) < 0 || pipe(p2) < 0){
		fprintf(2, "Can't create pipe");
		return 1;
	}

	int pid = fork();

	if (pid < 0){
		fprintf(2, "Can't create child process");
		return 2;
	}	
	else if (pid == 0){
		close(p1[1]);
		char received_from_parent[2];
		read(p1[0], received_from_parent, 2);
		close(p1[0]);
		
		
		if (strcmp(received_from_parent, "p") == 0){
			int child_pid = getpid();
			fprintf(1, "%d: receive ping\n", child_pid);
			
			close(p2[0]);
			char send_to_parent[2] = "c";
			write(p2[1], send_to_parent, 1);
			close(p2[1]);
		}

	}
	else {
		close(p1[0]);
		char send_to_child[2] = "p";
		write(p1[1], send_to_child, 1);
		close(p1[1]);

		wait(0);

		
		
		close(p2[1]);
		char received_from_child[2];
		read(p2[0], received_from_child, 1);
		close(p2[0]);

		if (strcmp(received_from_child, "c") == 0){
                	int parent_pid = getpid();
                	fprintf(1, "%d: receive pong\n", parent_pid);
		}
		
	}
	return 0;
}
