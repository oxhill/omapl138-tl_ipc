################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"D:/Program Files (x86)/ccs/ccsv5.5/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6740 --abi=eabi -g --include_path="D:/Program Files (x86)/ccs/ccsv5.5/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="c:/ti/OMAPL138_StarterWare_1_10_04_01/include" --include_path="c:/ti/OMAPL138_StarterWare_1_10_04_01/include/hw" --include_path="c:/ti/OMAPL138_StarterWare_1_10_04_01/include/c674x" --include_path="c:/ti/OMAPL138_StarterWare_1_10_04_01/include/c674x/omapl138" --define=c6748 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="main.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


