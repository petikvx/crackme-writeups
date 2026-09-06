################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/algo.cpp \
../src/ctf-test.cpp \
../src/vm.cpp 

OBJS += \
./src/algo.o \
./src/ctf-test.o \
./src/vm.o 

CPP_DEPS += \
./src/algo.d \
./src/ctf-test.d \
./src/vm.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -Os -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


