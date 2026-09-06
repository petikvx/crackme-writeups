/**
 * 
 */
package net.ttlhacker.jittery;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Assembler for the jittery CPU architecture
 * 
 * @author jonathan
 *
 */
public class JitteryAssembler {
	
	/**
	 * @param programCounterExponents LFSR exponents for the program counter. First element determines its width.
	 */
	public JitteryAssembler(int[] programCounterExponents) {
		this.pc = new ProgramCounter(programCounterExponents);
		this.assembledInstructions = new Instruction[this.pc.getMaxValue() + 1];
	}
	
	/**
	 * Program counter to store the next instruction at
	 */
	private final ProgramCounter pc;
	
	/**
	 * Maps labels to their corresponding addresses.
	 */
	private final Map<String, Integer> labels = new HashMap<>();
	
	/**
	 * The assembled instructions (at the correct addresses).
	 */
	private final Instruction[] assembledInstructions;
	
	/**
	 * @param reg
	 * @return    The register number of the argument, or 0 if it's null
	 * @throws AssemblerException
	 */
	private static int optReg(InstructionArgument reg) throws AssemblerException {
		if (reg == null) {
			return 0;
		}
		return reg.getRegister();
	}
	
	/**
	 * @param imm
	 * @return    The immediate value of the argument, or 0 if it's null
	 * @throws AssemblerInstruction
	 */
	private static int optImm(InstructionArgument imm) throws AssemblerException {
		if (imm == null) {
			return 0;
		}
		return imm.getImmediate();
	}
	
	/**
	 * Creates an instruction at the current PC with the given arguments,
	 * then advances the PC.
	 * 
	 * @param opcode
	 * @param dst
	 * @param src1
	 * @param src2
	 * @param imm
	 */
	public void createInstruction(
			int opcode,
			InstructionArgument dst,
			InstructionArgument src1,
			InstructionArgument src2,
			InstructionArgument imm) throws AssemblerException
	{
		int dstReg = optReg(dst);
		int src1Reg = optReg(src1);
		int src2Reg = optReg(src2);
		
		Instruction insn;
		
		if (imm instanceof LabelArgument) {
			insn = new Instruction(opcode, dstReg, src1Reg, src2Reg, imm.getLabel());
		} else {
			insn = new Instruction(opcode, dstReg, src1Reg, src2Reg, optImm(imm));
		}
		
		int pcVal = this.pc.get();
		if (this.assembledInstructions[pcVal] != null) {
			throw new AssemblerException("Bug: Address written twice");
		}
		this.assembledInstructions[pcVal] = insn;
		this.pc.advance();
	}
	
	/**
	 * Creates a label at the current program counter position.
	 * 
	 * @param labelName
	 * @throws AssemblerException
	 */
	private void createLabel(String labelName) throws AssemblerException {
		if (this.labels.put(labelName, this.pc.get()) != null) {
			throw new AssemblerException("Label is already defined: " + labelName);
		}
	}
	
	/**
	 * @param labelName The label to look up.
	 * @return          The label's value.
	 * @throws AssemblerException
	 */
	public int resolveLabel(String labelName) throws AssemblerException {
		Integer labelValue = this.labels.get(labelName);
		if (labelValue == null) {
			throw new AssemblerException("Label does not exist: " + labelName);
		}
		return labelValue;
	}
	
	/**
	 * Pattern used to split arguments.
	 */
	private static final Pattern ARG_SPLIT_PATTERN = Pattern.compile("[,<>:=!]");
	
	/**
	 * Generates a string constant at the current PC.
	 * One invalid instruction will be generated for each
	 * byte of the string, containing the bytes in their
	 * immediate fields.
	 * 
	 * @param str
	 */
	private void generateStringConstant(String str) throws AssemblerException {
		str = str.replaceAll("\\\\n", "\n");
		
		for (byte b: str.getBytes()) {
			this.createInstruction(InstructionTemplate.INVALID_OP.ordinal(), null, null, null, new ImmediateArgument(((int)b) & 0xFF));
		}
		//Null terminator
		this.createInstruction(InstructionTemplate.INVALID_OP.ordinal(), null, null, null, new ImmediateArgument(0));
	}
	
	/**
	 * Generates a data constant at the current PC.
	 * One invalid instruction will be generated for
	 * each data word, containing the word in its
	 * immediate field.
	 * 
	 * @param data
	 * @throws AssemblerException
	 */
	private void generateData(InstructionArgument[] data) throws AssemblerException {
		for (var word: data) {
			this.createInstruction(InstructionTemplate.INVALID_OP.ordinal(), null, null, null, word);
		}
	}
	
	/**
	 * Parses another line and creates an instruction or label from it.
	 * 
	 * @param line
	 * @throws AssemblerException
	 */
	public void consumeLine(String line) throws AssemblerException {
		//System.err.println(line);
		
		line = line.trim();
		
		//Remove empty lines
		if (line.isEmpty()) {
			return;
		}
		
		//Split into instruction and arguments
		String[] splitInsnAndArgs = line.split(" ", 2);
		
		if (splitInsnAndArgs.length == 0) {
			return;
		}
		
		String insnName = splitInsnAndArgs[0].trim().toUpperCase();
		
		//Special handling for string constants
		if ((splitInsnAndArgs.length == 2) && insnName.equalsIgnoreCase("string")) {
			this.generateStringConstant(splitInsnAndArgs[1]);
			return;
		}
		
		//Split arguments
		String[] splitArgs;
		
		switch (splitInsnAndArgs.length) {
		case 1:
			splitArgs = new String[0];
			break;
		case 2:
			splitArgs = ARG_SPLIT_PATTERN.split(splitInsnAndArgs[1]);
			break;
		default:
			throw new AssemblerException("Confusing line: " + line);
		}
		
		for (int i = 0; i < splitArgs.length; i++) {
			splitArgs[i] = splitArgs[i].trim().toUpperCase();
		}
		
		//Parse arguments
		InstructionArgument[] args = new InstructionArgument[splitArgs.length];
		for (int i = 0; i < args.length; i++) {
			args[i] = InstructionArgument.parse(splitArgs[i]);
		}
		
		//Is it a label?
		if (insnName.equalsIgnoreCase("label")) {
			if (args.length != 1) {
				throw new AssemblerException("Illegal number of arguments for label definition");
			}
			this.createLabel(args[0].getLabel());
			return;
		}
		
		//Is it data?
		if (insnName.equalsIgnoreCase("data")) {
			this.generateData(args);
			return;
		}
		
		//Create instruction
		InstructionTemplate template;
		try {
			template = InstructionTemplate.valueOf(insnName);
		} catch (IllegalArgumentException ex) {
			throw new AssemblerException("Unknown instruction: " + insnName);
		}
		
		template.create(this, args);
	}
	
	/**
	 * @return The defined labels.
	 */
	public Map<String, Integer> getLabels() {
		return this.labels;
	}
	
	/**
	 * @return A memory image containing the machine code of the assembled program.
	 * @throws AssemblerException
	 */
	public MachineInstructionWord[] getMemoryImage() throws AssemblerException {
		MachineInstructionWord[] mem = new MachineInstructionWord[this.assembledInstructions.length];
		for (int i = 0; i < mem.length; i++) {
			Instruction insn = this.assembledInstructions[i];
			if (insn != null) {
				mem[i] = insn.toMachineWord(this);
			} else {
				mem[i] = new MachineInstructionWord(0, 0, 0, 0, 0);
			}
		}
		return mem;
	}
}
