#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/select.h>
#include <linux/input.h>

int main(int argc, char **argv) {
    int fd = open("/dev/input/c674x_irq_events", O_RDONLY);
    if (fd < 0) {
        fprintf(stderr, "fail to open /dev/input/c674x_irq_events\n");
        return -1;
    }
     
    int i = 0;
    for (i = 0; i < 4; i++) {
        fd_set input;
        FD_ZERO(&input);
        FD_SET(fd, &input);
        int ret = select(fd + 1, &input, NULL, NULL, NULL);
        if (ret < 0) {
            fprintf(stderr, "fail to wait event : %s\n", strerror(errno));
            return -1;
        }

        // read event
        struct input_event buf;
        memset(&buf, 0, sizeof(struct input_event));
        if (read(fd, &buf, sizeof(struct input_event)) < 0) {
            fprintf(stderr, "fail to read event : %s\n", strerror(errno));
            return false;
        }

        if (i == 0) {         // only the first events is valid
            switch(buf.code) {
            case KEY_PROG1:
                fprintf(stdout, "helloworld\n");     
                break;
            case KEY_PROG2:
            default:    
                fprintf(stderr, "unexpected key code");
                return false;
            }
        }
    }

    close(fd);

    return 0;
}
