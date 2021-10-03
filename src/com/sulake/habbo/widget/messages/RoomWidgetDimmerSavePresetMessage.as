package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_728:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2125:int;
      
      private var var_2123:int;
      
      private var _color:uint;
      
      private var var_958:int;
      
      private var var_2124:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_728);
         this.var_2125 = param1;
         this.var_2123 = param2;
         this._color = param3;
         this.var_958 = param4;
         this.var_2124 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2125;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2123;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_958;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2124;
      }
   }
}
