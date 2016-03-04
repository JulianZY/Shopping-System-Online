package Action;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CheckLoginAction extends ActionSupport{
	private String loginsignal;
	
	public String check()
	{
		if(this.getLoginsignal()=="T")
			return "success";
		return "failed";
	}

	public String getLoginsignal() {
		return loginsignal;
	}

	public void setLoginsignal(String loginsignal) {
		this.loginsignal = loginsignal;
	}
}
