package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1948:String;
      
      private var var_2551:Array;
      
      private var var_2550:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_1948 = param1;
         this.var_2551 = param2;
         this.var_2550 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_1948;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2551;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2550;
      }
   }
}
