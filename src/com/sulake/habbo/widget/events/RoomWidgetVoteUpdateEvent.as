package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_140:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_117:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1119:String;
      
      private var var_1222:Array;
      
      private var var_992:Array;
      
      private var var_1693:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1119 = param2;
         this.var_1222 = param3;
         this.var_992 = param4;
         if(this.var_992 == null)
         {
            this.var_992 = [];
         }
         this.var_1693 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1119;
      }
      
      public function get choices() : Array
      {
         return this.var_1222.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_992.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1693;
      }
   }
}
