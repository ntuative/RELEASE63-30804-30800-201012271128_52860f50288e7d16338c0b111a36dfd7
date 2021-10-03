package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_685:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_241:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_685,param2,param3);
         this.var_241 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_241;
      }
   }
}
