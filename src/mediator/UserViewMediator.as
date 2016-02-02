package mediator 
{
	import events.UserChangeEvent;
	import flash.events.Event;
	import model.UserModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import views.UserView;
	
	/**
	 * ユーザー画面のメディエータクラス
	 * UserModelとUserViewの仲介を行う
	 * 「ユーザの名前が変更された」というきっかけで「ビューにその名前を反映する」タスクを実行するだけのクラス
	 * 
	 * @author ogino
	 */
	public class UserViewMediator extends Mediator
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		[Inject]
		/** ユーザ画面 */
		public var view:UserView;
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
		[Inject(name="modelName")]
		/** ユーザモデル */
		public var user:UserModel;
		
		//-----------------------------------------------------
		//オーバーライドしたメソッド
		//-----------------------------------------------------			
		
		/**
		 * @inheritDoc
		 */
		public override function initialize():void
		{
			// 名前が変更されたときに呼び出すメソッドをセット
			user.addEventListener(Event.CHANGE, changeView);
			view.addEventListener(UserChangeEvent.USER_CHANGE, view_userChange);
		}
		
		/**
		 * @inheritDoc
		 */
		public override function destroy():void
		{
			// 登録したメソッドを削除
			user.removeEventListener(Event.CHANGE, changeView);
		}

		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 画面更新
		 * 
		 * @param e Event
		 */
		public function changeView(e:Event):void
		{
			view.nameChange(user.name);
		}
		
		/**
		 * 画面変更通知イベントハンドラー
		 * 
		 * @param	e
		 */
		private function view_userChange(e:UserChangeEvent):void 
		{
			// イベントをクローンする
			var newEvent:UserChangeEvent = UserChangeEvent(e.clone());
			// フレームワークに通知　このイベントに紐付けられたCommandクラスが呼ばれる
			eventDispatcher.dispatchEvent(newEvent);
		}		
	}

}