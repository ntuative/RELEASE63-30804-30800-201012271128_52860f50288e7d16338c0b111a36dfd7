package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1921:int = 0;
      
      private var var_1366:String = "";
      
      private var var_1722:String = "";
      
      private var var_2178:String = "";
      
      private var var_2177:String = "";
      
      private var var_1568:int = 0;
      
      private var var_2180:int = 0;
      
      private var var_2181:int = 0;
      
      private var var_1368:int = 0;
      
      private var var_2179:int = 0;
      
      private var var_1369:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_1921 = param1;
         this.var_1366 = param2;
         this.var_1722 = param3;
         this.var_2178 = param4;
         this.var_2177 = param5;
         if(param6)
         {
            this.var_1568 = 1;
         }
         else
         {
            this.var_1568 = 0;
         }
         this.var_2180 = param7;
         this.var_2181 = param8;
         this.var_1368 = param9;
         this.var_2179 = param10;
         this.var_1369 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1921,this.var_1366,this.var_1722,this.var_2178,this.var_2177,this.var_1568,this.var_2180,this.var_2181,this.var_1368,this.var_2179,this.var_1369];
      }
   }
}
