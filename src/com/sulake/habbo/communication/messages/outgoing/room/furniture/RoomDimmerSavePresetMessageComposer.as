package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2125:int;
      
      private var var_2123:int;
      
      private var var_2164:String;
      
      private var var_2166:int;
      
      private var var_2165:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2125 = param1;
         this.var_2123 = param2;
         this.var_2164 = param3;
         this.var_2166 = param4;
         this.var_2165 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2125,this.var_2123,this.var_2164,this.var_2166,int(this.var_2165)];
      }
      
      public function dispose() : void
      {
      }
   }
}
