/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * A label passed as an argument to an instruction.
 * 
 * @author jonathan
 *
 */
public class LabelArgument implements InstructionArgument {
	
	private final String label;
	
	public LabelArgument(String label) {
		this.label = label;
	}

	@Override
	public String getLabel() throws AssemblerException {
		return this.label;
	}

	@Override
	public String toString() {
		return "Label[" + this.label + "]";
	}
}
