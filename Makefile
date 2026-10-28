main.dump: main.elf
	riscv64-unknown-elf-objdump -D main.elf > main.dump

main.elf: main.c
	riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 main.c -o main.elf

clean:
	rm -f main.elf main.dump