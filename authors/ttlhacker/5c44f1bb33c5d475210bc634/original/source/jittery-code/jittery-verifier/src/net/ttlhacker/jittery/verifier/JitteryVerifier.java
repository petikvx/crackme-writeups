package net.ttlhacker.jittery.verifier;

public class JitteryVerifier {
	
	public static void main(String[] args) throws Exception {
		if (args.length != 2) {
			System.out.println("Usage: JitteryVerifier solution programName");
			return;
		}
		String solution = args[0];
		String programName = args[1];
		
		boolean allOk = true;
		
		for (int i = 0; i < solution.length(); i++) {
			String firstPart = "";
			if (i > 0) {
				firstPart = solution.substring(0, i - 1);
			}
			String lastPart = "";
			if (i < (solution.length() - 1)) {
				lastPart = solution.substring(i + 1);
			}
			
			char removedChar = solution.charAt(i);
			
			for (char c = 0; c < 256; c++) {
				if (c == removedChar) continue;
				String modifiedSolution = firstPart + c + lastPart;
				
				Process p = Runtime.getRuntime().exec(programName);
				p.getOutputStream().write(modifiedSolution.getBytes());
				p.getOutputStream().write('\n');
				p.getOutputStream().flush();
				byte[] result = p.getInputStream().readAllBytes();
				p.waitFor();
				p.getInputStream().close();
				p.getOutputStream().close();
				
				String resultStr = new String(result);
				if (!resultStr.contains("WRONG!") || resultStr.contains("Correct!")) {
					System.out.println(modifiedSolution);
					System.out.println(resultStr);
					allOk = false;
				}
			}
		}
		
		if (allOk) {
			System.out.println("Verified OK!");
		}
	}
	
}
