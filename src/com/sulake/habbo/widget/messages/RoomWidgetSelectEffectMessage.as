package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_580:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_662:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_796:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_681:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_681 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_681;
      }
   }
}
