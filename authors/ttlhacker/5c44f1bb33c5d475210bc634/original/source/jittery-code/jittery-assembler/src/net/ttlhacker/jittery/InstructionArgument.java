/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * An argument to an instruction.
 * 
 * @author jonathan
 *
 */
public interface InstructionArgument {
	
	/**
	 * @return This argument as an immediate value.
	 * @throws AssemblerException
	 */
	public default int getImmediate() throws AssemblerException {
		throw new AssemblerException("Immediate expected, got: " + this.toString());
	}
	
	/**
	 * @return This argument as a register number.
	 * @throws AssemblerException
	 */
	public default int getRegister() throws AssemblerException {
		throw new AssemblerException("Register expected, got: " + this.toString());
	}
	
	/**
	 * @return This argument as a label.
	 * @throws AssemblerException
	 */
	public default String getLabel() throws AssemblerException {
		throw new AssemblerException("Label expected, got: " + this.toString());
	}
	
	private static InstructionArgument parseChar(String argString) throws AssemblerException {
		if (argString.length() != 2) {
			throw new AssemblerException("Invalid character argument: " + argString);
		}
		return new ImmediateArgument(argString.charAt(1));
	}
	
	private static InstructionArgument parseNumber(String argString) throws AssemblerException {
		try {
			int radix = 10;
			boolean unsigned = false;
			boolean ignoreFirstTwo = false;
			if (argString.startsWith("0X")) {
				ignoreFirstTwo = true;
				unsigned = true;
				radix = 16;
			}
			if (argString.startsWith("0O")) {
				ignoreFirstTwo = true;
				unsigned = true;
				radix = 8;
			}
			if (argString.startsWith("0B")) {
				ignoreFirstTwo = true;
				unsigned = true;
				radix = 2;
			}
			if (argString.startsWith("0U")) {
				ignoreFirstTwo = true;
				unsigned = false;
				radix = 10;
			}
			
			if (ignoreFirstTwo) {
				argString = argString.substring(2);
			}
			
			int imm;
			if (unsigned) {
				imm = Integer.parseUnsignedInt(argString, radix);
			} else {
				imm = Integer.parseInt(argString, radix);
			}
			
			return new ImmediateArgument(imm);
			
		} catch (NumberFormatException ex) {
			throw new AssemblerException("Malformed number: " + argString);
		}
	}
	
	private static InstructionArgument parseRegister(String argString) throws AssemblerException {
		try {
			if (argString.length() < 2) {
				throw new NumberFormatException();
			}
			int regNum = Integer.parseInt(argString.substring(1));
			return new RegisterArgument(regNum);
		} catch (NumberFormatException ex) {
			throw new AssemblerException("Malformed register name: " + argString);
		}
	}
	
	/**
	 * @param argString The string to parse.
	 * @return          An InstructionArgument representing the given string.
	 * @throws AssemblerException
	 */
	public static InstructionArgument parse(String argString) throws AssemblerException {
		if (argString.length() == 0) {
			throw new AssemblerException("Empty instruction argument");
		}
		
		char firstChar = argString.charAt(0);
		
		if (firstChar == '\'') {
			return parseChar(argString);
		}
		if (Character.isDigit(firstChar) || (firstChar == '-')) {
			return parseNumber(argString);
		}
		if (firstChar == '$') {
			return parseRegister(argString);
		}
		return new LabelArgument(argString);
	}
}
