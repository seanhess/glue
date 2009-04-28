package login.service
{
	import login.model.User;
	
	public class ParseAuthResponses
	{
		public function parseLoginResponse(value:Object):User
		{
			var user:User = new User();
				user.email = value.response.email;
				user.valid = value.response.authenticated;
				
			return user;
		}
		
		public function parseLogoutResponse(value:Object):Boolean
		{
			return true;
		}
	}
}