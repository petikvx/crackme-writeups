/**
 * 
 */
package net.ttlhacker.jittery;

/**
 * @author jonathan
 *
 */
public class AssemblerException extends Exception {
	private static final long serialVersionUID = 1L;

	public AssemblerException() {}

	/**
	 * @param message
	 */
	public AssemblerException(String message) {
		super(message);
	}

	/**
	 * @param cause
	 */
	public AssemblerException(Throwable cause) {
		super(cause);
	}

	/**
	 * @param message
	 * @param cause
	 */
	public AssemblerException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * @param message
	 * @param cause
	 * @param enableSuppression
	 * @param writableStackTrace
	 */
	public AssemblerException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
