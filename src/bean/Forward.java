package bean;
//bean 데이터 클래스
public class Forward{
	//redirec일 경우:true, dispatcher일 경우:false
	private boolean isRedirect=false;
	private String path=null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
