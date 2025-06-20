#include <hw_types.h>               
#include <hw_syscfg0_C6748.h>      
#include <soc_C6748.h>            

int main(void) {
    while(1) {
        volatile unsigned int *chipsig = (volatile unsigned int *)(SOC_SYSCFG_0_REGS + SYSCFG0_CHIPSIG);
        *chipsig = 1 << 0;

        int i = 0xffffff;
        while(i--);
    }
}
