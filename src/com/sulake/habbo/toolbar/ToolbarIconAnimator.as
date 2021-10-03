package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ToolbarIconAnimator
   {
       
      
      private var _frame:int;
      
      private var var_872:int;
      
      private var var_875:Array;
      
      private var var_874:Array;
      
      private var var_2678:Number;
      
      private var var_2679:Number;
      
      private var _state:String;
      
      private var var_1717:String;
      
      private var var_873:BitmapData;
      
      private var var_1362:Boolean;
      
      public function ToolbarIconAnimator(param1:StateItem, param2:IAssetLibrary, param3:IBitmapWrapperWindow, param4:Number, param5:Number, param6:BitmapData = null)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         super();
         if(param1 == null || param2 == null || param3 == null)
         {
            return;
         }
         this.var_2678 = param4;
         this.var_2679 = param5;
         this._frame = 0;
         this.var_872 = 0;
         this.var_875 = new Array();
         this.var_874 = new Array();
         this._state = param1.id;
         this.var_1717 = param1.nextState;
         this.var_1362 = param1.loop;
         if(param1.background != null)
         {
            this.var_873 = this.getBitmapDataFromAsset(param1.background,param2);
         }
         var _loc9_:XMLList = param1.frames;
         if(_loc9_.length() > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc9_.length())
            {
               _loc11_ = _loc9_[_loc10_];
               _loc7_ = "icon_" + param1.nameBase + "_" + _loc11_.@id;
               _loc11_.@assetName = _loc7_;
               _loc8_ = this.getBitmapDataFromAsset(_loc7_,param2);
               if(_loc8_ != null)
               {
                  this.var_875.push(_loc11_);
                  this.var_874.push(_loc8_);
               }
               _loc10_++;
            }
         }
         else
         {
            _loc7_ = "icon_" + param1.nameBase + "_0";
            _loc8_ = this.getBitmapDataFromAsset(_loc7_,param2);
            if(_loc8_ != null)
            {
               this.var_875.push(new XML());
               this.var_874.push(_loc8_);
            }
         }
         if(param6 != null)
         {
            this.var_874[this._frame] = param6.clone();
         }
         this.updateAssetInWindow(param3);
      }
      
      public function update(param1:IBitmapWrapperWindow) : void
      {
         if(this.var_1362 == true || this.var_872 == 0)
         {
            if(this.var_875.length > 0)
            {
               ++this._frame;
               if(this._frame >= this.var_875.length)
               {
                  this._frame = 0;
                  ++this.var_872;
               }
            }
            if(this.var_1362 == true || this.var_872 == 0)
            {
               this.updateAssetInWindow(param1);
            }
         }
      }
      
      public function get frameCount() : int
      {
         return this.var_875.length;
      }
      
      public function hasNextState() : Boolean
      {
         return this.var_1362 == false && this.var_872 == 1 && this.var_1717 != this._state;
      }
      
      public function get nextState() : String
      {
         return this.var_1717;
      }
      
      private function getBitmapDataFromAsset(param1:String, param2:IAssetLibrary) : BitmapData
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2.hasAsset(param1))
         {
            _loc3_ = param2.getAssetByName(param1) as BitmapDataAsset;
            if(_loc3_ != null)
            {
               return (_loc3_.content as BitmapData).clone();
            }
         }
         return null;
      }
      
      private function updateAssetInWindow(param1:IBitmapWrapperWindow) : void
      {
         var _loc2_:* = null;
         if(this._frame <= this.var_874.length)
         {
            _loc2_ = this.var_874[this._frame];
            if(_loc2_ != null && param1 != null && _loc2_ is BitmapData)
            {
               this.setAsset(param1,_loc2_);
            }
         }
      }
      
      private function setAsset(param1:IBitmapWrapperWindow, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(this.var_873 != null)
         {
            _loc3_ = new BitmapData(Math.max(param2.width,this.var_873.width),Math.max(param2.height,this.var_873.height));
            _loc3_.copyPixels(this.var_873,this.var_873.rect,new Point(0,0));
            _loc3_.copyPixels(param2,param2.rect,new Point((_loc3_.width - param2.width) / 2,(_loc3_.height - param2.height) / 2),null,null,true);
         }
         else
         {
            _loc3_ = param2.clone();
         }
         param1.width = _loc3_.width;
         param1.height = _loc3_.height;
         param1.bitmap = _loc3_;
      }
   }
}
