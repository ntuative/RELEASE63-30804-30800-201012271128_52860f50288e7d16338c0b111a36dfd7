package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_744:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_906:String = "RWOCM_CLUB_MAIN";
       
      
      private var var_2337:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_744);
         this.var_2337 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2337;
      }
   }
}
