/**
 * 
 */
package net.ttlhacker.jittery;

import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 * @author jonathan
 *
 */
public class JitteryAssemblerMain {
	
	/**
	 * Exponents for fibonacci LFSR counters indexed by their number of bits
	 */
	private static final int[][] LFSR_EXPONENTS_BY_PC_LENGTH = {
			{},
			{1},
			{2, 1},
			{3, 2},
			{4, 3},
			{5, 3},
			{6, 5},
			{7, 6},
			{8, 6, 5, 4},
			{9, 5},
			{10, 7},
			{11, 9},
			{12, 11, 8, 6},
			{13, 12, 10, 6},
			{14, 13, 11, 9},
			{15, 14},
			{16, 14, 13, 11},
			{17, 14},
			{18, 11},
			{19, 18, 17, 14},
			{20, 17},
			{21, 19},
			{22, 21},
			{23, 18},
			{24, 23, 21, 20}
	};
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		if (args.length != 2) {
			System.err.println("usage: JitteryAssembler input numberOfAddressBits");
			return;
		}
		
		//Get exponents
		int[] exponents;
		try {
			int addrBits = Integer.parseInt(args[1]);
			if (addrBits <= 0 || addrBits >= LFSR_EXPONENTS_BY_PC_LENGTH.length) {
				throw new NumberFormatException();
			}
			exponents = LFSR_EXPONENTS_BY_PC_LENGTH[addrBits];
		} catch (NumberFormatException ex) {
			System.err.println("Invalid number of address bits");
			return;
		}
		
		
		//Assemble
		MachineInstructionWord[] memoryImage;
		
		try {
			Scanner inscan = new Scanner(new FileReader(args[0]));
			JitteryAssembler asm = new JitteryAssembler(exponents);
			while (inscan.hasNext()) {
				asm.consumeLine(inscan.nextLine());
			}
			inscan.close();
			memoryImage = asm.getMemoryImage();
		} catch (AssemblerException | IOException ex) {
			System.err.println("JitteryAssembler error: " + ex.toString());
			return;
		}
		
		//Output
		System.out.print("int pc_exponents[] = {");
		for (int exp: exponents) {
			System.out.print(exp);
			System.out.print(", ");
		}
		System.out.println("};");
		
		System.out.println("struct vm_insn vm_code[] = {");
		for (MachineInstructionWord insn: memoryImage) {
			System.out.print("\t");
			System.out.print(insn.toString());
			System.out.println(",");
		}
		System.out.println("};");
	}

}
