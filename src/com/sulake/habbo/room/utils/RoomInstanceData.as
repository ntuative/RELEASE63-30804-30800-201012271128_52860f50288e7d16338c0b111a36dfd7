package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_730:TileHeightMap = null;
      
      private var var_1118:LegacyWallGeometry = null;
      
      private var var_1117:RoomCamera = null;
      
      private var var_729:SelectedRoomObjectData = null;
      
      private var var_728:SelectedRoomObjectData = null;
      
      private var var_2490:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1118 = new LegacyWallGeometry();
         this.var_1117 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_730;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_730 != null)
         {
            this.var_730.dispose();
         }
         this.var_730 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1118;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1117;
      }
      
      public function get worldType() : String
      {
         return this.var_2490;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2490 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_729;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_729 != null)
         {
            this.var_729.dispose();
         }
         this.var_729 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_728;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_728 != null)
         {
            this.var_728.dispose();
         }
         this.var_728 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_730 != null)
         {
            this.var_730.dispose();
            this.var_730 = null;
         }
         if(this.var_1118 != null)
         {
            this.var_1118.dispose();
            this.var_1118 = null;
         }
         if(this.var_1117 != null)
         {
            this.var_1117.dispose();
            this.var_1117 = null;
         }
         if(this.var_729 != null)
         {
            this.var_729.dispose();
            this.var_729 = null;
         }
         if(this.var_728 != null)
         {
            this.var_728.dispose();
            this.var_728 = null;
         }
      }
   }
}
