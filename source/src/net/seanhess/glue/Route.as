package net.seanhess.glue
{
	/**
	 * Usage: <Route event="userEvent" call="someController.action()"/>
	 * Usage: <Route child="{me.someButton}" event="click" call="someController.action()"/>
	 * 
	 * Used to route view events to a controller. Although Route uses 
	 * Observe under-the-hood, you should always use the Route tag
	 * to listen to a view. 
	 */
	public class Route extends Observe
	{
		/**
		 * If child is specified, will listen to whatever you set 
		 * the child to for the event instead of your view. You 
		 * should only ever set child to something within your view.
		 * 
		 * Most of the time you should NOT set this property, but 
		 * should have your views dispatch events themselves. For 
		 * example, a login view could dispatch a custom "login" event, 
		 * and it would look like <Route event="login" call="loginController.login()"/>
		 */
		public function set child(value:*):void
		{
			this.controller = value;
		}
	}
}