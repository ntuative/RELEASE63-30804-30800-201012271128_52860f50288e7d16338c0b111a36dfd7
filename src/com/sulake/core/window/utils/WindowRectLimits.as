package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_504:int = -2.147483648E9;
      
      private var var_503:int = 2.147483647E9;
      
      private var var_502:int = -2.147483648E9;
      
      private var var_501:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_504;
      }
      
      public function get maxWidth() : int
      {
         return this.var_503;
      }
      
      public function get minHeight() : int
      {
         return this.var_502;
      }
      
      public function get maxHeight() : int
      {
         return this.var_501;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_504 = param1;
         if(this.var_504 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_504)
         {
            this._target.width = this.var_504;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_503 = param1;
         if(this.var_503 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_503)
         {
            this._target.width = this.var_503;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_502 = param1;
         if(this.var_502 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_502)
         {
            this._target.height = this.var_502;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_501 = param1;
         if(this.var_501 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_501)
         {
            this._target.height = this.var_501;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_504 == int.MIN_VALUE && this.var_503 == int.MAX_VALUE && this.var_502 == int.MIN_VALUE && this.var_501 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_504 = int.MIN_VALUE;
         this.var_503 = int.MAX_VALUE;
         this.var_502 = int.MIN_VALUE;
         this.var_501 = int.MAX_VALUE;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_504 = this.var_504;
         _loc2_.var_503 = this.var_503;
         _loc2_.var_502 = this.var_502;
         _loc2_.var_501 = this.var_501;
         return _loc2_;
      }
   }
}
