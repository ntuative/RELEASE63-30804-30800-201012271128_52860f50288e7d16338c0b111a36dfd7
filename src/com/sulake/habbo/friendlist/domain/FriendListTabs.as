package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_371:IFriendListTabsDeps;
      
      private var var_409:Array;
      
      private var var_1684:FriendListTab;
      
      private var var_1078:int = 200;
      
      private var var_2361:int = 200;
      
      private var var_1685:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         this.var_409 = new Array();
         super();
         this.var_371 = param1;
         this.var_409.push(new FriendListTab(this.var_371.getFriendList(),FriendListTab.const_88,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         this.var_409.push(new FriendListTab(this.var_371.getFriendList(),FriendListTab.const_94,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         this.var_409.push(new FriendListTab(this.var_371.getFriendList(),FriendListTab.const_331,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         this.toggleSelected(null);
      }
      
      public function getTabs() : Array
      {
         return this.var_409;
      }
      
      public function findTab(param1:int) : FriendListTab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_409)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function findSelectedTab() : FriendListTab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function toggleSelected(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = this.findSelectedTab();
         if(_loc2_ == null)
         {
            this.var_1078 = this.var_2361;
            this.setSelected(this.determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            this.var_2361 = this.var_1078;
            this.var_1078 = 0;
            this.clearSelections();
         }
         else
         {
            this.setSelected(this.determineDisplayedTab(param1),true);
         }
      }
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = this.findSelectedTab();
         this.clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            this.var_1684 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(this.var_1684 != null)
         {
            return this.var_1684;
         }
         return this.var_409[0];
      }
      
      public function get tabContentHeight() : int
      {
         return this.var_1078;
      }
      
      public function get windowWidth() : int
      {
         return this.var_1685;
      }
      
      public function get tabContentWidth() : int
      {
         return this.var_1685 - 2;
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         this.var_1078 = param1;
      }
      
      public function set windowWidth(param1:int) : void
      {
         this.var_1685 = param1;
      }
   }
}
