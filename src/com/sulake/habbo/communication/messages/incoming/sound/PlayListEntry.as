package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2494:int;
      
      private var var_2543:int;
      
      private var var_2544:String;
      
      private var var_2542:String;
      
      private var var_2541:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2494 = param1;
         this.var_2543 = param2;
         this.var_2544 = param3;
         this.var_2542 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2494;
      }
      
      public function get length() : int
      {
         return this.var_2543;
      }
      
      public function get name() : String
      {
         return this.var_2544;
      }
      
      public function get creator() : String
      {
         return this.var_2542;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2541;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2541 = param1;
      }
   }
}
