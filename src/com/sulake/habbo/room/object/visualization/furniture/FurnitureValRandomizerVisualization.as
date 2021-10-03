package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_842:int = 20;
      
      private static const const_552:int = 10;
      
      private static const const_1173:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_282:Array;
      
      private var var_688:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_282 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_688)
            {
               this.var_688 = true;
               this.var_282 = new Array();
               this.var_282.push(const_1173);
               this.var_282.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_552)
         {
            if(this.var_688)
            {
               this.var_688 = false;
               this.var_282 = new Array();
               if(_direction == 2)
               {
                  this.var_282.push(const_842 + 5 - param1);
                  this.var_282.push(const_552 + 5 - param1);
               }
               else
               {
                  this.var_282.push(const_842 + param1);
                  this.var_282.push(const_552 + param1);
               }
               this.var_282.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_282.length > 0)
            {
               super.setAnimation(this.var_282.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
