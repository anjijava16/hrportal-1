/**
 * 
 */
package com.sapta.hr.exception;

/**
 * @author murugmu
 *
 */
public class AppException extends Exception {
	
	private static final long serialVersionUID = 1L;

	private String errorCode;
	
	private String errorMessage;
	
	private String errorSource;
	
	private Throwable sourceException;

	public AppException(String aErrorCode, String aErrorMessage, Throwable aSourceException) {
		this.sourceException = aSourceException;
		this.errorCode = aErrorCode;
		this.errorMessage = aErrorMessage;
	}
	
	public AppException(String aErrorCode, String aErrorMessage) {
		this.errorCode = aErrorCode;
		this.errorMessage = aErrorMessage;
	}

	/**
	 * @return the errorCode
	 */
	public String getErrorCode() {
		return errorCode;
	}

	/**
	 * @param errorCode the errorCode to set
	 */
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	/**
	 * @return the errorMessage
	 */
	public String getErrorMessage() {
		return errorMessage;
	}

	/**
	 * @param errorMessage the errorMessage to set
	 */
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	/**
	 * @return the errorSource
	 */
	public String getErrorSource() {
		return errorSource;
	}

	/**
	 * @param errorSource the errorSource to set
	 */
	public void setErrorSource(String errorSource) {
		this.errorSource = errorSource;
	}

	/**
	 * @return the exception
	 */
	public Throwable getException() {
		return sourceException;
	}

	/**
	 * @param exception the exception to set
	 */
	public void setException(Throwable aSourceException) {
		this.sourceException = aSourceException;
	}

}
