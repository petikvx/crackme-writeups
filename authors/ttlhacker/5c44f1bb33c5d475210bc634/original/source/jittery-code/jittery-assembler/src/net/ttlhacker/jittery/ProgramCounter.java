/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * LFSR program "counter" (Fibonacci)
 * 
 * @author jonathan
 *
 */
public class ProgramCounter {
	
	/**
	 * LSFR exponents
	 */
	private final int[] exponents;
	
	/**
	 * Maximum PC value
	 */
	private final int maxPc;
	
	/**
	 * @param exponents LSFR exponents. Largest one has to come first.
	 */
	public ProgramCounter(int[] exponents) {
		this.exponents = exponents;
		int nBits = exponents[0];
		this.maxPc = (1 << nBits) - 1;
	}
	
	/**
	 * @return The maximum PC value.
	 */
	public int getMaxValue() {
		return this.maxPc;
	}
	
	/**
	 * Current PC
	 */
	private int pc = 1;
	
	/**
	 * @param newPc New program counter value
	 */
	public void set(int newPc) {
		this.pc = newPc;
	}
	
	/**
	 * @return Current program counter
	 */
	public int get() {
		return this.pc;
	}
	
	/**
	 * Advances the PC by one LFSR iteration
	 */
	public void advance() throws AssemblerException {
		int newLowestBit = 0;
		for (int exp: exponents) {
			int bit = (this.pc >>> (exp - 1)) & 1;
			newLowestBit ^= bit;
		}
		this.pc = ((this.pc << 1) | newLowestBit) & this.maxPc;
		
		if (this.pc == 1) {
			throw new AssemblerException("Program counter overflow!");
		}
	}
	
}
