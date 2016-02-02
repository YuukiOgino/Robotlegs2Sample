package events 
{
	import flash.events.Event;
	
	/**
	 * ユーザーがデーターを変更した時のイベントハンドラー
	 * 
	 * @author ogino
	 */
	public class UserChangeEvent extends Event 
	{
		
		//-----------------------------------------------------
		//イベント定数
		//-----------------------------------------------------			
		
		/** ユーザー変更 */
		public static const USER_CHANGE:String = "userChange";
		
		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 * 
		 * @param	type
		 * @param	bubbles
		 * @param	cancelable
		 */
		public function UserChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		//-----------------------------------------------------
		//オーバーライドしたメソッド
		//-----------------------------------------------------			
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event 
		{
			var e:UserChangeEvent = new UserChangeEvent(type, bubbles, cancelable);
			return e;
		}
		
	}
	
}