#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

/* =======================
   MÉMOIRE
   ======================= */
uint8_t memory[65536]; // 64 Ko

/* =======================
   CPU
   ======================= */
typedef struct {
    uint8_t A, B, C, D, E, H, L; // registres
    uint8_t F;                  // flags
    uint16_t PC;                // Program Counter
    uint16_t SP;                // Stack Pointer
    bool halted;
} CPU;

CPU cpu;

/* =======================
   INIT CPU
   ======================= */
void cpu_init() {
    cpu.A = cpu.B = cpu.C = cpu.D = cpu.E = cpu.H = cpu.L = 0;
    cpu.F = 0;
    cpu.PC = 0x0000;
    cpu.SP = 0xFFFE;
    cpu.halted = false;
}

/* =======================
   FETCH
   ======================= */
uint8_t fetch() {
    return memory[cpu.PC];
}

/* =======================
   EXECUTE
   ======================= */
void execute(uint8_t opcode) {
    switch (opcode) {

    case 0x00: // NOP
        cpu.PC++;
        break;

    case 0x3E: // LD A, n
        cpu.A = memory[cpu.PC + 1];
        cpu.PC += 2;
        break;

    case 0x06: // LD B, n
        cpu.B = memory[cpu.PC + 1];
        cpu.PC += 2;
        break;

    case 0x3C: // INC A
        cpu.A++;
        cpu.PC++;
        break;

    case 0x80: { // ADD A, B
        uint16_t result = cpu.A + cpu.B;
        cpu.A = result & 0xFF;

        // Flag Z (Zero)
        if (cpu.A == 0)
            cpu.F |= 0x40;
        else
            cpu.F &= ~0x40;

        cpu.PC++;
        break;
    }

    case 0xC3: { // JP addr
        uint16_t addr = memory[cpu.PC + 1]
            | (memory[cpu.PC + 2] << 8);
        cpu.PC = addr;
        break;
    }

    case 0x76: // HALT
        cpu.halted = true;
        break;

    default:
        printf("Opcode inconnu : 0x%02X\n", opcode);
        cpu.halted = true;
        break;
    }
}

/* =======================
   PROGRAMME DE TEST
   ======================= */
void load_program() {
    memory[0x0000] = 0x3E; // LD A, 5
    memory[0x0001] = 5;

    memory[0x0002] = 0x06; // LD B, 3
    memory[0x0003] = 3;

    memory[0x0004] = 0x80; // ADD A, B
    memory[0x0005] = 0x3C; // INC A
    memory[0x0006] = 0x76; // HALT
}

/* =======================
   MAIN
   ======================= */
int main() {
    cpu_init();
    load_program();

    while (!cpu.halted) {
        uint8_t opcode = fetch();
        execute(opcode);
    }

    printf("A = %d\n", cpu.A);
    printf("B = %d\n", cpu.B);

    return 0;
}
