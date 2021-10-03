package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_817:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_962:String = "inventory_effects";
      
      public static const const_903:String = "inventory_badges";
      
      public static const const_1324:String = "inventory_clothes";
      
      public static const const_1315:String = "inventory_furniture";
       
      
      private var var_2336:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_817);
         this.var_2336 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2336;
      }
   }
}
