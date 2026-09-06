/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * An immediate instruction argument.
 * 
 * @author jonathan
 *
 */
public class ImmediateArgument implements InstructionArgument {
	
	private final int imm;
	
	public ImmediateArgument(int imm) {
		this.imm = imm;
	}
	
	@Override
	public int getImmediate() throws AssemblerException {
		return this.imm;
	}
	
	@Override
	public String toString() {
		return "Immediate[" + this.imm + "]";
	}
}
