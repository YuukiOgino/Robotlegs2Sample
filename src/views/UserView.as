package views 
{
	import events.UserChangeEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ユーザー情報表示画面
	 * 
	 * @author ogino
	 */
	public class UserView extends Sprite 
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		/** ユーザー名表示領域 */
		private var nameTextField:TextField;
		
		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 */
		public function UserView() 
		{
			super();
			
			nameTextField = new TextField();
			nameTextField.addEventListener(MouseEvent.CLICK, nameTextFieldClickHandler);
			addChild(nameTextField);
		}
		
		//-----------------------------------------------------
		//メソッド
		//-----------------------------------------------------			
		
		/**
		 * 名前変更
		 * 
		 * @param	name
		 */
		public function nameChange(name:String):void 
		{
			nameTextField.text = name;
		}
		
		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 名前テキストをクリックしたときのイベントハンドラー
		 * 
		 * @param	e
		 */
		private function nameTextFieldClickHandler(e:MouseEvent):void 
		{
			var e:MouseEvent = new MouseEvent(MouseEvent.CLICK);
			dispatchEvent(e);
			
			// メディエーターに更新イベントを通知
			dispatchEvent(new UserChangeEvent(UserChangeEvent.USER_CHANGE));
		}
	}
}