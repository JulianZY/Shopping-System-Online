package Action;

import Model.Comment;
import Service.ManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CommentDeleteAction extends ActionSupport{
		private int commentid;
		
		public String delete()
		{
			System.out.println("commentid:"+this.getCommentid());
			ManagerServiceImpl msi=new ManagerServiceImpl();
			Comment c=msi.getCommentDAO().queryById(this.getCommentid());
			if(c!=null)
			{
				msi.deleteComment(c);
				return "success";
			}
			return "failed";
		}
		public int getCommentid() {
			return commentid;
		}

		public void setCommentid(int commentid) {
			this.commentid = commentid;
		}
}
