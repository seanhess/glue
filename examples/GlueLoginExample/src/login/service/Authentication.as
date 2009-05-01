package login.service
{
	import flash.events.Event;
	
	import login.model.Application;
	import login.model.Login;
	import login.model.Navigation;
	import login.model.User;
	import login.service.ParseAuthResponses;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import net.seanhess.glue.Respond;
	
	public class Authentication
	{
		public var auth:Authentication;
		public var nav:Navigation;
		public var app:Application;
		
		public var parse:ParseAuthResponses;
		
		public var loginService:HTTPService;
		public var logoutService:HTTPService;
		
		public function login(attempt:Login):void
		{
			var respond:Respond = new Respond(loginService, attempt);
				respond.result(onLogin);
				respond.fault(onFault);

			attempt.waiting = true;
			
			loginService.send({username:attempt.username, password:attempt.password});
		}
		
		public function logout():void
		{
			var respond:Respond = new Respond(logoutService);
				respond.result(onLogout);
			
			logoutService.send(); 
		}
		
		private function onLogin(event:ResultEvent, respond:Respond):void
		{
			var attempt:Login = respond.data as Login;
				attempt.waiting = false;
				
			var user:User = parse.parseLoginResponse(event.result);
			
			if (user.valid)
			{
				app.currentUser = user;
				nav.loggedIn();
				attempt.reset();
			}
			else
			{
				attempt.failed = true;
			}
		}
		
		private function onLogout(event:Event):void
		{
			app.currentUser = null;
			nav.loggedOut();
		}
		
		private function onFault(event:Event):void
		{
			throw new Error("FAULT " + event);
		}
		
	}
}