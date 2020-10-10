ARCH = armv7-armv7
MCPU = cortex-a8

CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = arm-none-eabi-objcopy

LINKER_SCRIPT = ./navilos.ld

ASM_SRCS = $(wildcard ../boot/*.S)
ASM_OBJS = $(parsubst ../boot/%.S, ./%.o, $(ASM_SRCS))

navilos = ./navilos.axf
navilos_bin = ./navilos.bin

.PHONY: all clean run debug gdb

all: $(navilos)

clean:
    @rm -fr build

run: $(navilos)
    qemu-system-arm -M realview-pb-a8 -kernel $(navilos)

debug: $(navilos)
    qemu-system-arm -M realview-pb-a8 -kernel $(navilos) -S -gdb tcp::1234,ipv4

gdb:
    gdb

$(navilos): $(ASM_OBJS) $(LINKER_SCRIPT)
    $(LD) -n -T $(LINKER_SCRIPT) -o $(navilos) $(ASM_OBJS)
    $(OC) -O binary $(navilos) $(navilos_bin)

./%.o: ../boot/%.S
    mkdir -p $(shell dirname $@)
    $(AS) -march=$(ARCH) -mcpu=$(MCPU) -g -o $@ $<