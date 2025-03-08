#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/param.h"

// Hàm xargs: đọc dòng từ stdin và thực thi lệnh với mỗi dòng làm đối số
void xargs(char *cmd[], int use_dash_n)
{
    int pid, j, k = 0, nargs = 0;
    char *cmd_full[MAXARG]; // Sử dụng MAXARG để giới hạn số đối số
    char buf[512];
    char line[512];
    char c;
    
    // Đếm số lượng đối số trong cmd, bỏ qua các tham số -n 1 nếu cần
    if (use_dash_n) {
        // cmd[0] là "echo", bỏ qua "-n" và "1"
        cmd_full[0] = cmd[0];
        nargs = 1;
    } else {
        // Đếm tất cả các đối số
        while (cmd[nargs] != 0)
            nargs++;
            
        // Sao chép các đối số
        for (j = 0; j < nargs; j++) {
            cmd_full[j] = cmd[j];
        }
    }
        
    // Đọc từ stdin một ký tự một cho đến khi hết input
    while (read(0, &c, 1) > 0) {
        buf[k++] = c;
        
        // Nếu gặp ký tự xuống dòng hoặc kết thúc, xử lý dòng đó
        if (c == '\n' || c == '\0') {
            buf[k-1] = '\0'; // Thay thế '\n' bằng '\0'
            k = 0; // Reset biến đếm k
            
            // Reset line buffer
            for (j = 0; j < 512; j++)
                line[j] = '\0';
                
            // Copy chuỗi từ buf vào line
            strcpy(line, buf);
            
            // Thêm dòng hiện tại làm đối số cuối cùng
            cmd_full[nargs] = malloc(strlen(line) + 1);
            strcpy(cmd_full[nargs], line);
            
            // Kết thúc danh sách đối số
            cmd_full[nargs + 1] = 0;
            
            // Thực thi lệnh
            if ((pid = fork()) > 0) {
                // Tiến trình cha đợi tiến trình con hoàn thành
                wait(0);
            } 
            else if (pid == 0) {
                // Tiến trình con thực thi lệnh
                exec(cmd_full[0], cmd_full);
                fprintf(2, "exec %s failed\n", cmd_full[0]);
                exit(1);
            }
            else {
                fprintf(2, "fork failed\n");
                exit(1);
            }
            
            // Giải phóng bộ nhớ
            free(cmd_full[nargs]);
        }
    }
}

int main(int argc, char *argv[])
{
    char **cmdarg;
    int i;
    int use_dash_n = 0;
    
    // Kiểm tra số lượng đối số
    if (argc < 2) {
        fprintf(2, "Usage: xargs command [args...]\n");
        exit(1);
    }
    
    // Kiểm tra có tùy chọn -n hay không
    if (argc >= 4 && strcmp(argv[1], "-n") == 0 && strcmp(argv[2], "1") == 0) {
        use_dash_n = 1;
        
        // Cấp phát mảng mới cho cmdarg (chỉ lấy echo)
        cmdarg = malloc(2 * sizeof(char*));
        if (cmdarg == 0) {
            fprintf(2, "xargs: malloc failed\n");
            exit(1);
        }
        
        cmdarg[0] = argv[3];  // "echo"
        cmdarg[1] = 0;        // NULL terminate
    } else {
        // Cấp phát mảng mới cho cmdarg
        cmdarg = malloc(argc * sizeof(char*));
        if (cmdarg == 0) {
            fprintf(2, "xargs: malloc failed\n");
            exit(1);
        }
        
        // Sao chép các đối số từ argv[1] trở đi
        for (i = 1; i < argc; i++)
            cmdarg[i - 1] = argv[i];
        
        // Đảm bảo null-terminate
        cmdarg[argc - 1] = 0;
    }
    
    // Gọi hàm xargs
    xargs(cmdarg, use_dash_n);
    
    // Giải phóng bộ nhớ
    free(cmdarg);
    exit(0);
}
