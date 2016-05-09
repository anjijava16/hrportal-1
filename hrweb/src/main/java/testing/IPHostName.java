package testing;

import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

import javax.management.AttributeNotFoundException;
import javax.management.InstanceNotFoundException;
import javax.management.MBeanException;
import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;
import javax.management.Query;
import javax.management.ReflectionException;

public class IPHostName {

	public static void main(String[] args) {
    MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
    Set<ObjectName> objs;
	try {
		objs = mbs.queryNames(new ObjectName("*:type=Connector,*"), Query.match(Query.attr("protocol"), Query.value("HTTP/1.1")));
		 String hostname = null;
		try {
			hostname = InetAddress.getLocalHost().getHostName();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		    InetAddress[] addresses = null;
			try {
				addresses = InetAddress.getAllByName(hostname);
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    ArrayList<String> endPoints = new ArrayList<String>();
		    for (Iterator<ObjectName> i = objs.iterator(); i.hasNext();) {
		        ObjectName obj = i.next();
		        String scheme;
				try {
					scheme = mbs.getAttribute(obj, "scheme").toString();
					 String port = obj.getKeyProperty("port");
				        for (InetAddress addr : addresses) {
				            String host = addr.getHostAddress();
				            String ep = scheme + "://" + host + ":" + port;
				            endPoints.add(ep);
				        }
				} catch (AttributeNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InstanceNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MBeanException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ReflectionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		       
		    }
		
	} catch (MalformedObjectNameException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   
    
	}

}
