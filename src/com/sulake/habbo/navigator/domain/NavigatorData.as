package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1594:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_185:MsgWithRequestId;
      
      private var var_622:RoomEventData;
      
      private var var_2608:Boolean;
      
      private var var_2616:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2061:int;
      
      private var var_255:GuestRoomData;
      
      private var var_933:PublicRoomShortData;
      
      private var var_2612:int;
      
      private var var_2615:Boolean;
      
      private var var_2618:int;
      
      private var var_2610:Boolean;
      
      private var var_1856:int;
      
      private var var_2617:Boolean;
      
      private var var_1332:Array;
      
      private var var_1420:Array;
      
      private var var_2614:int;
      
      private var var_1421:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1159:Boolean;
      
      private var var_2611:int;
      
      private var var_2613:Boolean;
      
      private var var_2609:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1332 = new Array();
         this.var_1420 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_255 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_255 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_933 = null;
         this.var_255 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_933 = param1.publicSpace;
            this.var_622 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_622 != null)
         {
            this.var_622.dispose();
            this.var_622 = null;
         }
         if(this.var_933 != null)
         {
            this.var_933.dispose();
            this.var_933 = null;
         }
         if(this.var_255 != null)
         {
            this.var_255.dispose();
            this.var_255 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_255 != null)
         {
            this.var_255.dispose();
         }
         this.var_255 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_622 != null)
         {
            this.var_622.dispose();
         }
         this.var_622 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_185 != null && this.var_185 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_185 != null && this.var_185 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_185 != null && this.var_185 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_185 = param1;
         this.var_1159 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_185 = param1;
         this.var_1159 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_185 = param1;
         this.var_1159 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_185 == null)
         {
            return;
         }
         this.var_185.dispose();
         this.var_185 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_185 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_185 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_185 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_622;
      }
      
      public function get avatarId() : int
      {
         return this.var_2061;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2608;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2616;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_255;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_933;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2615;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2618;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1856;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2610;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2611;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2612;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2617;
      }
      
      public function get adIndex() : int
      {
         return this.var_2609;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2613;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2061 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2618 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2615 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2608 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2616 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2610 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1856 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2611 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2612 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2617 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2609 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2613 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1332 = param1;
         this.var_1420 = new Array();
         for each(_loc2_ in this.var_1332)
         {
            if(_loc2_.visible)
            {
               this.var_1420.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1332;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1420;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2614 = param1.limit;
         this.var_1421 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1421 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_255.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_255 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_255.flatId;
         return this.var_1856 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1421 >= this.var_2614;
      }
      
      public function startLoading() : void
      {
         this.var_1159 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1159;
      }
   }
}
