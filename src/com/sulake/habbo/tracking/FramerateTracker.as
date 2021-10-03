package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1721:int;
      
      private var var_2561:int;
      
      private var var_1137:int;
      
      private var var_476:Number;
      
      private var var_2560:Boolean;
      
      private var var_2559:int;
      
      private var var_1818:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2561 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2559 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2560 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1137;
         if(this.var_1137 == 1)
         {
            this.var_476 = param1;
            this.var_1721 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1137);
            this.var_476 = this.var_476 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2560 && param3 - this.var_1721 >= this.var_2561 && this.var_1818 < this.var_2559)
         {
            _loc5_ = 1000 / this.var_476;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1818;
            this.var_1721 = param3;
            this.var_1137 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
