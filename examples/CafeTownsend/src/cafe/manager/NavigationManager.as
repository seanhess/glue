package cafe.manager
{
	import cafe.vo.Authentication;
	import cafe.vo.Navigation;

	[Bindable]
	public class NavigationManager
	{
		public var currentPage:int = Navigation.LOGIN;
		
		public function loginChanged(state:String):void
		{
			currentPage = (state == Authentication.AUTHENTICATED) ? Navigation.LIST : Navigation.LOGIN;
		}
	}
}