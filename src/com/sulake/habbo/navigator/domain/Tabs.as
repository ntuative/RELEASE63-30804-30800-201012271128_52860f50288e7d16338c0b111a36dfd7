package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_368:int = 1;
      
      public static const const_230:int = 2;
      
      public static const const_295:int = 3;
      
      public static const const_326:int = 4;
      
      public static const const_253:int = 5;
      
      public static const const_325:int = 1;
      
      public static const const_687:int = 2;
      
      public static const const_698:int = 3;
      
      public static const const_590:int = 4;
      
      public static const const_219:int = 5;
      
      public static const const_800:int = 6;
      
      public static const const_821:int = 7;
      
      public static const const_225:int = 8;
      
      public static const const_362:int = 9;
      
      public static const const_1755:int = 10;
      
      public static const const_637:int = 11;
      
      public static const const_469:int = 12;
       
      
      private var var_409:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_409 = new Array();
         this.var_409.push(new Tab(this._navigator,const_368,const_469,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_468));
         this.var_409.push(new Tab(this._navigator,const_230,const_325,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_468));
         this.var_409.push(new Tab(this._navigator,const_326,const_637,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1048));
         this.var_409.push(new Tab(this._navigator,const_295,const_219,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_468));
         this.var_409.push(new Tab(this._navigator,const_253,const_225,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_615));
         this.setSelectedTab(const_368);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_326;
      }
      
      public function get tabs() : Array
      {
         return this.var_409;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
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
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
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
   }
}
