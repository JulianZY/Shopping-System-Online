package Action;
import Model.Picture;
import Model.User;
import Service.UserServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
//import org.apache.struts.upload.FormFile;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
@SuppressWarnings("serial")
public class HeadphotoUpdateAction extends ActionSupport{
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private InputStream inputStream; 
	private int id;
	
	public String update() throws IOException
	{
		//System.out.println("userid:"+this.getId());
		//String path=ServletActionContext.getServletContext().getRealPath("/WEB-INF/Resource/Images/Headphoto");
		String path="E:\\Upload\\Resource\\Images\\Headphoto";
		String path_temp="\\Resource\\Images\\Headphoto";
		String ext=this.getUploadFileName().substring(this.getUploadFileName().lastIndexOf("."));
		//System.out.println("ext:"+ext);
		//System.out.println("path: "+path);
		String path2=path+"\\"+"Headphoto_"+this.getId()+ext;
		String path2_temp=path_temp+"\\"+"Headphoto_"+this.getId()+ext;
		//String path2=path+"\\"+"Headphoto_"+this.getId()+"."+"jpg";
		//System.out.println("path2: "+path2);
		File savedir=new File(path);
		if(this.getUpload()==null)
		{
			System.out.print("Failed");
			return "failed";
		}
		if(!savedir.exists())
			savedir.mkdir();
		
		UserServiceImpl usi=new UserServiceImpl();
		User u=usi.getUserDAO().queryById(this.getId());
		Picture p=u.getHeadphoto();
		String oldext=p.getName().substring(p.getName().lastIndexOf("."));
		String oldpath=path+"\\"+"Headphoto_"+this.getId()+oldext;
		if(p!=null&&p.getPath().equals(path2_temp))
		{
			File f=new File(oldpath);
			f.delete();
		}
		File imagefile=new File(savedir,this.getUploadFileName());
		FileUtils.copyFile(this.getUpload(), imagefile);
		if(imagefile.exists())
		{
			imagefile.renameTo(new File(path2));
		}
		
		p.setName("Headphoto_"+this.getId()+ext);
		//p.setName("Headphoto_"+this.getId()+"."+"jpg");
		p.setPath(path2_temp);
		u.setHeadphoto(p);
		usi.getUserDAO().update(u);
		return "success";
	}
	
	public String reset() throws IOException
	{
		System.out.println("userid:"+this.getId());
		//String path=ServletActionContext.getServletContext().getRealPath("/WEB-INF/Resource/Images");
		String path="E:\\Upload\\Resource\\Images";
		String path_temp="\\Resource\\Images";
		System.out.println("path: "+path);
		String path2=path+"\\"+"default.png";
		String path2_temp=path_temp+"\\"+"default.png";
		System.out.println("path2: "+path2);
		UserServiceImpl usi=new UserServiceImpl();
		User u=usi.getUserDAO().queryById(this.getId());
		Picture p=u.getHeadphoto();
		if(p.getName()!=null&&p.getName().equals("default.png"))
		{
			return "success";
			
		}
		else
		{	
			String oldext=p.getName().substring(p.getName().lastIndexOf("."));
			String oldpath=path+"\\Headphoto\\"+"Headphoto_"+this.getId()+oldext;
			File temp=new File(oldpath);
			if(temp.delete())
			{
				p.setName("default.png");
				p.setPath(path2_temp);
				u.setHeadphoto(p);
				usi.getUserDAO().update(u);
				return "success";
			}
		}
		return "failed";
		
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}