/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * Contains information on how to construct a given instruction.
 * 
 * @author jonathan
 *
 */
public enum InstructionTemplate {
	NOP(-1, -1, -1, -1),	//No operation					NOP
	
	VMCALL(1, 2, 3, 0),		//dst = fn[imm](src1, src2)		VMCALL imm: dst, src1, src2
	VMQUIT(-1, -1, -1, 0),	//Stop VM (return imm)			VMQUIT imm
	
	ADD(0, 1, 2, -1),		//dst = src1 + src2				ADD dst, src1, src2
	SUB(0, 1, 2, -1),		//dst = src1 - src2				SUB dst, src1, src2
	MUL(0, 1, 2, -1),		//dst = src1 * src2				MUL dst, src1, src2
	
	NEG(0, 1, -1, -1),		//dst = -src1					NEG dst, src1
	AND(0, 1, 2, -1),		//dst = src1 & src2				AND dst, src1, src2
	OR(0, 1, 2, -1),		//dst = src1 | src2				OR dst, src1, src2
	XOR(0, 1, 2, -1),		//dst = src1 ^ src2				XOR dst, src1, src2
	
	/*
	SHL(0, 1, 2, -1),		//dst = src1 << src2			SHL dst, src1, src2
	SHR(0, 1, 2, -1),		//dst = src1 >>> src2			SHR dst, src1, src2
	SHRA(0, 1, 2, -1),		//dst = src1 >> src2			SHRA dst, src1, src2
	*/
	
	SEQ(0, 1, 2, -1),		//dst = src1 == src2			SEQ dst, src1, src2
	SNEQ(0, 1, 2, -1),		//dst = src1 != src2			SNEQ dst, src1, src2
	SLT(0, 1, 2, -1),		//dst = src1 < src2				SLT dst, src1, src2
	SLET(0, 1, 2, -1),		//dst = src1 <= src2			SLET dst, src1, src2
	SLTU(0, 1, 2, -1),		//dst = src1 < src2	(unsigned)	SLTU dst, src1, src2
	SLETU(0, 1, 2, -1),		//dst = src1 <= src2 (unsigned)	SLETU dst, src1, src2
	
	SEQI(0, 1, -1, 2),		//dst = src1 == imm				SEQI dst, src1, imm
	SNEQI(0, 1, -1, 2),		//dst = src1 != imm				SNEQI dst, src1, imm
	SLTI(0, 1, -1, 2),		//dst = src1 < imm				SLTI dst, src1, imm
	SLETI(0, 1, -1, 2),		//dst = src1 <= imm				SLETI dst, src1, imm
	SGTI(0, 1, -1, 2),		//dst = src1 > imm				SGTI dst, src1, imm
	SGETI(0, 1, -1, 2),		//dst = src1 >= imm				SGETI dst, src1, imm
	
	STORE(-1, 0, 2, 1),		//mem[src1 + imm] = src2		STORE src1, imm < src2
	LOAD(2, 0, -1, 1),		//dst = mem[src1 + imm]			LOAD src1, imm > dst
	
	J(-1, -1, -1, 0),		//PC = imm						J lbl
	JR(-1, 0, -1, -1),		//PC = src1						JR src1
	JZ(-1, 0, -1, 1),		//if (src1 == 0) PC = imm		JZ src1, lbl
	JNZ(-1, 0, -1, 1),		//if (src1 != 0) PC = imm		JNZ src1, lbl
	
	RETADR(0, -1, -1, -1),	//dst = PC(thisInstr) + 2		RETADR dst
	
	LDI(0, -1, -1, 1),		//dst = imm						LDI dst, imm
	LDIU(0, -1, -1, 1),		//dst = (unsigned)imm			LDIU dst, imm
	LUI(0, -1, -1, 1),		//dst = (imm << 32)				LUI dst, imm
	
	ADDI(0, 1, -1, 2),		//dst = src1 + imm				ADDI dst, src1, imm
	MULI(0, 1, -1, 2),		//dst = src1 * imm				MULI dst, src1, imm
	ORI(0, 1, -1, 2),		//dst = src1 | imm				ORI dst, src1, imm
	ANDI(0, 1, -1, 2),		//dst = src1 & imm				ANDI dst, src1, imm
	XORI(0, 1, -1, 2),		//dst = src1 ^ imm				XORI dst, src1, imm
	SHLI(0, 1, -1, 2),		//dst = src1 << imm				SHLI dst, src1, imm
	SHRI(0, 1, -1, 2),		//dst = src1 >> imm				SHRI dst, src1, imm
	SHRIU(0, 1, -1, 2),		//dst = src1 >> imm (unsigned)	SHRUI dst, src1, imm
	
	
	/*
	LFSRINC(0, 1, -1, -1),	//dst = lfsr(src1)				LFSRINC dst, src1
	CSTORE(-1, 0, 1, -1),	//codemem[src1] = src2			CSTORE src1 < src2
	CLOAD(0, 1, -1, -1),	//dst = codemem[src1]			CLOAD dst < src1
	*/
	
	INVALID_OP(-1, -1, -1, -1),
	;
	
	private final int dstArgIdx, src1ArgIdx, src2ArgIdx, immIdx;
	
	private InstructionTemplate(
			int dstArgIdx,
			int src1ArgIdx,
			int src2ArgIdx,
			int immIdx)
	{
		this.dstArgIdx = dstArgIdx;
		this.src1ArgIdx = src1ArgIdx;
		this.src2ArgIdx = src2ArgIdx;
		this.immIdx = immIdx;
	}
	
	private static int countArgs(int[] arr) {
		int max = -1;
		for (int i: arr) {
			max = Math.max(i, max);
		}
		return max + 1;
	}
	
	private static InstructionArgument optArg(InstructionArgument[] args, int index) {
		if (index < 0) {
			return null;
		}
		return args[index];
	}
	
	/**
	 * Creates an instance of this instruction with the given arguments.
	 * 
	 * @param asm
	 * @param args
	 * @throws AssemblerException
	 */
	public void create(JitteryAssembler asm, InstructionArgument[] args) throws AssemblerException {
		int argCount = countArgs(new int[] {dstArgIdx, src1ArgIdx, src2ArgIdx, immIdx});
		if (args.length != argCount) {
			throw new AssemblerException("Invalid number of arguments for instruction " + this.toString());
		}
		
		asm.createInstruction(
				this.ordinal(),
				optArg(args, dstArgIdx),
				optArg(args, src1ArgIdx),
				optArg(args, src2ArgIdx),
				optArg(args, immIdx));
	}
}
