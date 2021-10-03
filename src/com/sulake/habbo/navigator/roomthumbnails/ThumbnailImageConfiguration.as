package com.sulake.habbo.navigator.roomthumbnails
{
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ThumbnailImageConfiguration
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _id:int;
      
      private var _type:int;
      
      private var var_1750:String;
      
      private var var_1751:BitmapData;
      
      private var var_174:Boolean;
      
      private var var_1752:BitmapData;
      
      private var var_600:IBitmapWrapperWindow;
      
      private var var_1753:Rectangle;
      
      private var var_1379:int = 1;
      
      public function ThumbnailImageConfiguration(param1:HabboNavigator, param2:int, param3:int, param4:String, param5:BitmapData)
      {
         super();
         this._navigator = param1;
         this._id = param2;
         this._type = param3;
         this.var_1750 = param4;
         this.var_1752 = param5;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get picName() : String
      {
         return this.var_1750;
      }
      
      public function getImg() : BitmapData
      {
         if(this.var_1751 == null)
         {
            this.var_1751 = this._navigator.getButtonImage(this.var_1750);
         }
         return this.var_1751;
      }
      
      public function registerListImg(param1:IBitmapWrapperWindow) : void
      {
         this.var_600 = param1;
         this.refreshListImg();
      }
      
      public function copyTo(param1:BitmapData) : void
      {
         var _loc2_:BitmapData = this.getImg();
         param1.copyPixels(_loc2_,_loc2_.rect,new Point((param1.width - _loc2_.width) / 2,param1.height - _loc2_.height),null,null,true);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(this.var_174 == param1)
         {
            return;
         }
         this.var_174 = param1;
         this.refreshListImg();
      }
      
      private function refreshListImg() : void
      {
         var _loc1_:* = null;
         if(this.var_1753 == null)
         {
            _loc1_ = this.var_600.bitmap.rect;
            this.var_1753 = new Rectangle(this.var_1379,this.var_1379,_loc1_.width - 2 * this.var_1379,_loc1_.height - 2 * this.var_1379);
         }
         this.var_600.bitmap.fillRect(this.var_600.bitmap.rect,4281545523);
         this.var_600.bitmap.fillRect(this.var_1753,4284900966);
         this.copyTo(this.var_600.bitmap);
         if(this.var_174)
         {
            this.var_600.bitmap.copyPixels(this.var_1752,this.var_1752.rect,new Point(0,0),null,null,true);
         }
         this.var_600.invalidate();
      }
   }
}
