package configuration 
{
	import commands.UserCommand;
	import events.UserChangeEvent;
	import mediator.UserViewMediator;
	import model.UserModel;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	import views.UserView;
	
	/**
	 * メイン画面のコンフィギュレーションを行うクラス
	 * 
	 * このクラスで以下の設定を実行しています。
	 * 	・UserModel はシングルトンである
	 * 	・UserView の対になるメディエータは UserViewMediator である
	 * 　・メディエーターでUserChangeEvent.USER_CHANGEが呼ばれた場合、UserCommondを実行する
	 * 
	 * @author ogino
	 */
	public class MainConfig implements IConfig 
	{
	
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		/** 画面 */
		private var userView:UserView = new UserView();		
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
		[Inject]
		/** インジェクター */
		public var injector:IInjector;
		
		[Inject]
		/** メディエーターマップ */
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		/** イベントコマンドマップ */
		public var commandMap:IEventCommandMap;				
		
		[Inject]
		/** コンテキストビュー */
		public var contextView:ContextView;
		
		//-----------------------------------------------------
		//メソッド
		//-----------------------------------------------------			
		
		/**
		 * コンフィギュレーション実行
		 */
		public function configure():void 
		{
			// おまじない
			
			// UserModel はシングルトンである
			injector.map(UserModel, "modelName").asSingleton();
			injector.map(UserModel).asSingleton();
			
			// UserView の対になるメディエータは UserViewMediator である
			mediatorMap.map(UserView).toMediator(UserViewMediator);
			
			// メディエーターでUserChangeEvent.USER_CHANGEが呼ばれた場合、UserCommondを実行する
			commandMap.map(UserChangeEvent.USER_CHANGE).toCommand(UserCommand);
			
			// このような形で値を注入することも可能
			//var user:UserModel = new UserModel();
			//injector.map(UserModel, "modelName").toValue(user);			
			
			// おまじないを設定すると、下記の処理が出来る
			
			// 画面を切り替える　このプロジェクトは一つしか画面がないので、このメソッドで初期化処理を実行
			contextView.view.addChild(userView);
			
			// DIコンテナからモデルを取得
			var m:UserModel = injector.getInstance(UserModel, "modelName");
			m.name = "テスト表示";
		}
		
	}

}