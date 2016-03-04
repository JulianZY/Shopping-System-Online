package Action;

import Model.Goods;
import Model.Picture;
import Model.Shop;
import Service.BossServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
//import org.apache.struts.upload.FormFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

@SuppressWarnings("serial")
public class GoodspictureUpdateAction extends ActionSupport{
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private InputStream inputStream; 
	private int id;
	private int picid;
	
	public String delete() throws IOException
	{
		System.out.println("id:"+this.getId());
		System.out.println("picid:"+this.getPicid());
		BossServiceImpl bsi=new BossServiceImpl();
		Picture p=bsi.getPictureDAO().queryById(this.getPicid());
		//p.setGoods(null);
		//bsi.getPictureDAO().update(p);
		Goods g=bsi.getGoodsDAO().queryById(this.getId());
		//Shop s=g.getShop();
		
		//bsi.getPictureDAO().delete(p);
		
		
		//List<Picture> pics=bsi.getPictureDAO().queryByGoods(g);
		File pc=new File("E:\\Upload"+p.getPath());
		if(pc!=null)
		{
			
			if(pc.delete())
			{
				//bsi.deleteGoodsPicture(g, p);
				bsi.getPictureDAO().delete(p);
				//bsi.getShopDAO().update(s);
				return "success";	
			}
		}
		return "failed";
	}
	
	public String add() throws IOException
	{
		System.out.println("id"+this.getId());
		
		BossServiceImpl bsi=new BossServiceImpl();
		Goods g=bsi.getGoodsDAO().queryById(this.getId());
		
		//String path=ServletActionContext.getServletContext().getRealPath("/WEB-INF/Resource/Images/Goods"+"\\"+g.getId());
		String path="E:\\Upload\\Resource\\Images\\Goods"+"\\"+g.getId();
		String path_temp="\\Resource\\Images\\Goods"+"\\"+g.getId();
		System.out.println("path: "+path);

		String path2=path+"\\"+this.getId()+"_"+this.getUploadFileName();
		String path2_temp=path_temp+"\\"+this.getId()+"_"+this.getUploadFileName();
		System.out.println("path2: "+path2);
		
		File savedir=new File(path);
		if(this.getUpload()==null)
		{
			System.out.print("Failed");
			//return "failed";
		}
		if(!savedir.exists())
			savedir.mkdir();
		File imagefile=new File(savedir,this.getUploadFileName());
		/*FileOutputStream fops = new FileOutputStream(new File(savedir,this.getUpload().getName()));
			  fops.write(this.getUpload().);
			  fops.close();*/
		FileUtils.copyFile(this.getUpload(), imagefile);
		if(imagefile.exists())
		{
			imagefile.renameTo(new File(path2));
		}
		
		List<Picture> pics=bsi.getPictureDAO().queryByGoods(g);
		Picture p=new Picture();
		p.setName(this.getId()+"_"+this.getUploadFileName());
		p.setPath(path2_temp);
		p.setGoods(g);
		//pics.add(p);
		//g.setPictures(pics);
		//bsi.getGoodsDAO().update(g);
		bsi.getPictureDAO().create(p);
		//bsi.getPictureDAO().update(p);
		return "success";
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
	public int getPicid() {
		return picid;
	}
	public void setPicid(int picid) {
		this.picid = picid;
	}
	
}
