package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2625:int;
      
      private var var_2626:int;
      
      private var var_2624:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2625 = param1;
         this.var_2626 = param2;
         this.var_2624 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2625,this.var_2626,this.var_2624];
      }
      
      public function dispose() : void
      {
      }
   }
}
