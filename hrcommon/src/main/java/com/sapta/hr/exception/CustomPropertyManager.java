/**
 * 
 */
package com.sapta.hr.exception;

import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

/**
 * @author murugmu
 *
 */
public class CustomPropertyManager {
	
	private static CustomPropertyManager sInstance = new CustomPropertyManager();

	private Properties customProperties;

	private CustomPropertyManager() {
		loadProperties();
	}

	public static CustomPropertyManager getInstance() {
		if (sInstance == null) {
			sInstance = new CustomPropertyManager();
		}
		return sInstance;
	}

	private void loadProperties() {

		Properties properties = new Properties();
        InputStream inputStream = CustomPropertyManager.class.getResourceAsStream(ExceptionConstant.CONFIG_PROPERTIES_FILE);
        if (inputStream == null) {
            inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(ExceptionConstant.CONFIG_PROPERTIES_FILE);
        }
        try {
            properties.load(inputStream);
        } catch (IOException e) {
        	//Logger.logError(e.getMessage(), new CustomPropertyManager().getClass().getCanonicalName());
        } catch (Exception e) {
        	//Logger.logError(e.getMessage(), new CustomPropertyManager().getClass().getCanonicalName());
        }
        customProperties = properties;
	}

	public static String getProperty(String aKey) {
		String result = getInstance().customProperties.getProperty(aKey);
		return result;
	}
	
	public static String getProperty(String aKey, Object paramVal[]) {
		String result = getInstance().customProperties.getProperty(aKey);
		MessageFormat form = new MessageFormat(result);
		return form.format(paramVal);
	}

}
