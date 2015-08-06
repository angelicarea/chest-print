package
{
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	import flash.printing.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	
	
	public class print extends Sprite
	{
		public var jsonString:String;
		public static var FRONT_HEIGHT:Number = 50;
		
		public function print()
		{
			setTimeout(setupCallBacks, 500);
//			var str:String = '[{"width": "500","height": "500", "frontSize": "14","content": [{"top": "20","left": "80","width": "200","value": "赵四"}, {"top": "70","left": "80","width": "200","value": "哈尔滨市"}]},{"width": "500","height": "500", "frontSize": "14","content": [{"top": "20","left": "80","width": "200","value": "丽丽"}, {"top": "70","left": "80","width": "200","value": "哈尔滨市"}]}]';
//			printAll(str);
		}
		
		public function printAll(printInfo:String):void{
			var json:Object = JSON.parse(printInfo);
			var myPrintJob:PrintJob = new PrintJob();
			if(myPrintJob.start()){
				for each (var tmp:Object in json){
					var sprite:Sprite = new Sprite();
					createSprite(sprite, tmp);
					myPrintJob.addPage(sprite);
				}
				myPrintJob.send();
			}
		}
		private function createSprite(sprite:Sprite,spriteInfo:Object):void{
			sprite.graphics.beginFill(0xeeeeee);  
			sprite.graphics.lineStyle(1,0x000000);  
			sprite.graphics.drawRect(0,0,spriteInfo.width,spriteInfo.height);  
			sprite.graphics.endFill();  
			
			var format:TextFormat = new TextFormat();
			format.size = spriteInfo.frontSize;
			
			for each (var content:Object in spriteInfo.content){
				//加入需要打印的组件
				var text:TextField = new TextField();
				text.text =content.value;
				text.width = content.width;
				text.height = FRONT_HEIGHT;
				text.x = content.left;
				text.y = content.top;
				text.setTextFormat(format);
				sprite.addChild(text);
			}
		}
		private function setupCallBacks():void{
			ExternalInterface.addCallback("printAll",printAll);
		}
	}
}
