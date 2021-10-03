package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2570:Number;
      
      private var var_1580:Number;
      
      private var var_918:Number;
      
      private var var_919:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2570 = param1;
         this.var_1580 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_918 = param1;
         this.var_919 = 0;
      }
      
      public function update() : void
      {
         this.var_918 += this.var_1580;
         this.var_919 += this.var_918;
         if(this.var_919 > 0)
         {
            this.var_919 = 0;
            this.var_918 = this.var_2570 * -1 * this.var_918;
         }
      }
      
      public function get location() : Number
      {
         return this.var_919;
      }
   }
}
