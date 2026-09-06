/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * Represents a vm_insn struct
 * 
 * @author jonathan
 *
 */
public class MachineInstructionWord {
	
	private final int opcode, dst, src1, src2, imm;
	
	public MachineInstructionWord(int opcode, int dst, int src1, int src2, int imm) {
		this.opcode = opcode;
		this.dst = dst;
		this.src1 = src1;
		this.src2 = src2;
		this.imm = imm;
	}
	
	@Override
	public String toString() {
		return "{" + opcode + ", " + dst + ", " + src1 + ", " + src2 + ", " + imm + "}";
	}
}
