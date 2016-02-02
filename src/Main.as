package 
{
	import configuration.MainConfig;
	import flash.display.Sprite;
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.impl.Context;
	
	/**
	 * フレームワーク　Robotlegs2　サンプルプロジェクト
	 * as3であればGraphics,Stage3D、Flexで使用可能
	 * このプロジェクトはgraphicsで記載
	 * 
	 * @author ogino
	 */
	public class Main extends Sprite 
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 */
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 初期化
		 * 
		 * @param	e Event
		 */
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Robotlegs2を起動するための設定
			// MVCSBundleをセット
			// コンフィグクラスをセット
			// 最後にコンテキストビューをセットし、初期化処理を実行
			
			var context:Context = new Context();
			// おまじない
			context.install(MVCSBundle);
			// コンフィグクラスをセット
			context.configure(MainConfig);
			// コンテキストビューとしてこの画面をセット
			context.configure(new ContextView(this));
			// Robotlegs2初期化
			context.initialize();
		}
		
	}
	
}