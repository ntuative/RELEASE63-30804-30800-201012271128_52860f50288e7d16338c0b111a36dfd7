package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_272:IHabboCommunicationManager;
      
      private var var_917:IHabboLocalizationManager;
      
      private var var_915:IHabboConfigurationManager;
      
      private var var_1141:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_61:HelpUI;
      
      private var var_164:TutorialUI;
      
      private var var_748:HotelMergeUI;
      
      private var var_916:RegistrationUI;
      
      private var var_1410:CallForHelpData;
      
      private var var_2569:UserRegistry;
      
      private var var_1990:String = "";
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1410 = new CallForHelpData();
         this.var_2569 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1141 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_1990 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_1990;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1410;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2569;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_917;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_164;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_748;
      }
      
      override public function dispose() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.dispose();
            this.var_61 = null;
         }
         if(this.var_164 != null)
         {
            this.var_164.dispose();
            this.var_164 = null;
         }
         if(this.var_748)
         {
            this.var_748.dispose();
            this.var_748 = null;
         }
         if(this.var_916 != null)
         {
            this.var_916.dispose();
            this.var_916 = null;
         }
         if(this.var_1141 != null)
         {
            this.var_1141.dispose();
            this.var_1141 = null;
         }
         this._incomingMessages = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_917)
         {
            this.var_917.release(new IIDHabboLocalizationManager());
            this.var_917 = null;
         }
         if(this.var_272)
         {
            this.var_272.release(new IIDHabboCommunicationManager());
            this.var_272 = null;
         }
         if(this.var_915)
         {
            this.var_915.release(new IIDHabboConfigurationManager());
            this.var_915 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1141;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_272 != null && param1 != null)
         {
            this.var_272.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_915 == null)
         {
            return param1;
         }
         return this.var_915.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1410.reportedUserId = param1;
         this.var_1410.reportedUserName = param2;
         this.var_61.showUI(HabboHelpViewEnum.const_371);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_61 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_61.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_61 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_61 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_917,this._toolbar);
         }
         return this.var_61 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         if(this.var_164 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_164 = new TutorialUI(this);
         }
         return this.var_164 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_164 != null)
         {
            this.var_164.dispose();
            this.var_164 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_748)
         {
            this.var_748 = new HotelMergeUI(this);
         }
         this.var_748.startNameChange();
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_916)
         {
            this.var_916 = new RegistrationUI(this);
         }
         this.var_916.showRegistrationView();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_164 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_164.update(param1,param2,param3);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_272 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_272);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_917 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_915 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_86,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_93,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_67,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_86:
               if(this.var_61 != null)
               {
                  this.var_61.setRoomSessionStatus(true);
               }
               if(this.var_164 != null)
               {
                  this.var_164.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_93:
               if(this.var_61 != null)
               {
                  this.var_61.setRoomSessionStatus(false);
               }
               if(this.var_164 != null)
               {
                  this.var_164.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this._toolbar != null)
         {
            this._toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_108,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_67)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
   }
}
