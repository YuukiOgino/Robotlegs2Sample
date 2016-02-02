package model 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * ユーザー名のモデルクラス
	 * 
	 * @author ogino
	 */
	public class UserModel extends EventDispatcher
	{
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------		
		
		//---------------
		//name
		//---------------	
		
		/**
		 * @private
		 */
		private var _name:String;
		
		/**
		 * ユーザー名
		 */
		public function get name():String { return _name; }
		
		/**
		 * @private
		 */
		public function set name(value:String):void 
		{
			_name = value;
			// 変更を通知
			dispatchEvent(new Event(Event.CHANGE));
		}
	}

}