package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_663:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_579:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_663);
         this.var_579 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_579;
      }
   }
}
