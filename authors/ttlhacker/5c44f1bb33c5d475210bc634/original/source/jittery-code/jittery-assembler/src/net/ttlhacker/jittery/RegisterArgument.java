/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * A register passed as an argument to an instruction.
 * 
 * @author jonathan
 *
 */
public class RegisterArgument implements InstructionArgument {
	
	private final int register;
	
	public RegisterArgument(int register) {
		this.register = register;
	}

	@Override
	public int getRegister() throws AssemblerException {
		return this.register;
	}
	
	@Override
	public String toString() {
		return "Register[" + this.register + "]";
	}
}
