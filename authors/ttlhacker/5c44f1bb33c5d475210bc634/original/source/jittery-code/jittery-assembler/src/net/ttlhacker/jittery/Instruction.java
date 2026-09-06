/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * An instruction in jittery's machine language.
 * 
 * @author jonathan
 *
 */
public class Instruction {
	
	private final int opcode, sourceReg1, sourceReg2, destReg, immediate;
	
	private final String label;
	
	/**
	 * @param opcode     Opcode of the instruction
	 * @param destReg    Destination register number
	 * @param sourceReg1 First source register number
	 * @param sourceReg2 Second source register number
	 * @param immediate  Immediate operand
	 */
	public Instruction(int opcode, int destReg, int sourceReg1, int sourceReg2, int immediate) {
		this.opcode = opcode;
		this.sourceReg1 = sourceReg1;
		this.sourceReg2 = sourceReg2;
		this.destReg = destReg;
		this.immediate = immediate;
		this.label = null;
	}
	
	/**
	 * @param opcode     Opcode of the instruction
	 * @param destReg    Destination register number
	 * @param sourceReg1 First source register number
	 * @param sourceReg2 Second source register number
	 * @param label      The label to put into the immediate field
	 */
	public Instruction(int opcode, int destReg, int sourceReg1, int sourceReg2, String label) {
		this.opcode = opcode;
		this.sourceReg1 = sourceReg1;
		this.sourceReg2 = sourceReg2;
		this.destReg = destReg;
		this.immediate = 0;
		this.label = label;
	}
	
	/**
	 * @param asm The active assembler instance.
	 * @return This instruction as a native machine instruction word.
	 */
	public MachineInstructionWord toMachineWord(JitteryAssembler asm) throws AssemblerException {
		int imm = this.immediate;
		if (this.label != null) {
			imm = asm.resolveLabel(this.label);
		}
		
		return new MachineInstructionWord(opcode, destReg, sourceReg1, sourceReg2, imm);
	}
	
}
