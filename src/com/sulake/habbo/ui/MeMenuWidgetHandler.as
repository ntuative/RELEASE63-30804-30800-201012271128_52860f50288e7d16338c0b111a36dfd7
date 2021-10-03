package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IHabboAvatarEditorDataSaver;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetAvatarEditorMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetEffectsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetNavigateToRoomMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenInventoryMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSetToolbarIconMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetShowOwnRoomsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStopEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStoreSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetWaveMessage;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class MeMenuWidgetHandler implements IRoomWidgetHandler, IHabboAvatarEditorDataSaver, IAvatarImageListener
   {
       
      
      private var var_677:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _inventory:IHabboInventory;
      
      private var _toolbar:IHabboToolbar;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1401:String;
      
      private var var_1813:BitmapData;
      
      public function MeMenuWidgetHandler()
      {
         super();
         Logger.log("[MeMenuWidgetHandler]");
      }
      
      public function dispose() : void
      {
         this.var_677 = true;
         this._container = null;
         this._inventory = null;
         this._toolbar = null;
         this._catalog = null;
         this.var_1401 = null;
         this.var_1813 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_677;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_454;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(this._container != null)
         {
            if(this._container.sessionDataManager != null)
            {
               this._container.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_639,this.onFigureUpdate);
            }
            if(this._container.avatarEditor)
            {
               this._container.avatarEditor.events.removeEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,this.onAvatarEditorClosed);
            }
            if(this._container.habboHelp)
            {
               this._container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_528,this.onHelpTutorialEvent);
               this._container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_104,this.onHelpTutorialEvent);
            }
            this._container = null;
         }
         this._container = param1;
         if(this._container != null && this._container.sessionDataManager != null)
         {
            this._container.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_639,this.onFigureUpdate);
            this._container.sessionDataManager.events.addEventListener(SessionCreditBalanceEvent.const_169,this.onCreditBalance);
         }
         this._inventory = this._container.inventory;
         if(this._inventory != null)
         {
            (this._inventory as Component).events.addEventListener(HabboInventoryEffectsEvent.const_1084,this.onAvatarEffectsChanged);
            (this._inventory as Component).events.addEventListener(HabboInventoryHabboClubEvent.const_1024,this.onHabboClubSubscriptionChanged);
         }
         this._toolbar = this._container.toolbar;
         if(this._toolbar)
         {
            this._toolbar.events.addEventListener(HabboToolbarEvent.const_67,this.onHabboToolbarEvent);
            this._toolbar.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
            this.setMeMenuToolbarIcon();
         }
         if(this._container.avatarEditor)
         {
            this._container.avatarEditor.events.addEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,this.onAvatarEditorClosed);
         }
         if(this._container.habboHelp)
         {
            this._container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_528,this.onHelpTutorialEvent);
            this._container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_104,this.onHelpTutorialEvent);
         }
         this._catalog = this._container.catalog;
      }
      
      private function setMeMenuToolbarIcon() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this._container.avatarRenderManager != null)
         {
            _loc3_ = this._container.sessionDataManager.figure;
            if(_loc3_ != this.var_1401)
            {
               _loc4_ = this._container.sessionDataManager.gender;
               _loc5_ = this._container.avatarRenderManager.createAvatarImage(_loc3_,AvatarScaleType.const_47,_loc4_,this);
               if(_loc5_ != null)
               {
                  _loc5_.setDirection(AvatarSetType.const_42,3);
                  _loc1_ = _loc5_.getCroppedImage(AvatarSetType.const_42);
                  _loc5_.dispose();
               }
               this.var_1401 = _loc3_;
               this.var_1813 = _loc1_;
            }
            else
            {
               _loc1_ = this.var_1813;
            }
         }
         var _loc2_:Component = this._container.roomWidgetFactory as Component;
         if(_loc2_ != null)
         {
            if(_loc1_ == null)
            {
               _loc7_ = _loc2_.assets.getAssetByName("memenu_toolbar_icon") as BitmapDataAsset;
               _loc6_ = _loc7_.content as BitmapData;
            }
            else
            {
               _loc6_ = _loc1_;
            }
            Logger.log("MeMenuWidgetHandler: set toolbar icon: " + this._toolbar + " " + _loc6_);
            if(this._toolbar != null && _loc6_ != null)
            {
               _loc8_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_1121,HabboToolbarIconEnum.MEMENU);
               _loc8_.bitmapData = _loc6_;
               this._toolbar.events.dispatchEvent(_loc8_);
            }
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_67)
         {
            this.setMeMenuToolbarIcon();
         }
         if(this._container == null)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            switch(param1.iconId)
            {
               case HabboToolbarIconEnum.MEMENU:
                  this._container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU));
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  this._container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO));
            }
         }
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetWaveMessage.const_795);
         _loc1_.push(RoomWidgetDanceMessage.const_664);
         _loc1_.push(RoomWidgetGetEffectsMessage.const_758);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_580);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_662);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_796);
         _loc1_.push(RoomWidgetOpenInventoryMessage.const_817);
         _loc1_.push(RoomWidgetOpenCatalogMessage.const_744);
         _loc1_.push(RoomWidgetStopEffectMessage.const_562);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_1346);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_941);
         _loc1_.push(RoomWidgetToolbarMessage.const_567);
         _loc1_.push(RoomWidgetToolbarMessage.const_597);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_361);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_1393);
         _loc1_.push(RoomWidgetSelectOutfitMessage.const_972);
         _loc1_.push(RoomWidgetShowOwnRoomsMessage.const_571);
         _loc1_.push(RoomWidgetRequestWidgetMessage.const_818);
         _loc1_.push(RoomWidgetGetSettingsMessage.const_634);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_1320);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_566);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_707);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_648);
         _loc1_.push(RoomWidgetClothingChangeMessage.const_375);
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRequestWidgetMessage.const_818:
               if(this._container != null && this._container.toolbar != null && this._container.toolbar.events != null)
               {
                  _loc7_ = new HabboToolbarEvent(HabboToolbarEvent.const_38);
                  _loc7_.iconId = HabboToolbarIconEnum.MEMENU;
                  this._container.toolbar.events.dispatchEvent(_loc7_);
               }
               break;
            case RoomWidgetWaveMessage.const_795:
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendWaveMessage();
               }
               break;
            case RoomWidgetDanceMessage.const_664:
               if(this._container != null && this._container.roomSession != null)
               {
                  _loc8_ = param1 as RoomWidgetDanceMessage;
                  if(_loc8_ != null)
                  {
                     this._container.roomSession.sendDanceMessage(_loc8_.style);
                  }
               }
               break;
            case RoomWidgetGetEffectsMessage.const_758:
               if(this._inventory != null)
               {
                  _loc9_ = this._inventory.getAvatarEffects();
                  this._container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc9_));
               }
               break;
            case RoomWidgetSelectEffectMessage.const_580:
               if(this._inventory != null)
               {
                  _loc10_ = param1 as RoomWidgetSelectEffectMessage;
                  this._inventory.setEffectSelected(_loc10_.effectType);
               }
               break;
            case RoomWidgetSelectEffectMessage.const_662:
               if(this._inventory != null)
               {
                  _loc11_ = param1 as RoomWidgetSelectEffectMessage;
                  this._inventory.setEffectDeselected(_loc11_.effectType);
               }
               break;
            case RoomWidgetOpenCatalogMessage.const_744:
               _loc2_ = param1 as RoomWidgetOpenCatalogMessage;
               if(this._catalog != null && _loc2_.pageKey == RoomWidgetOpenCatalogMessage.const_906)
               {
                  this._catalog.openCatalogPage(CatalogPageName.const_163,true);
               }
               break;
            case RoomWidgetOpenInventoryMessage.const_817:
               _loc3_ = param1 as RoomWidgetOpenInventoryMessage;
               if(this._inventory != null)
               {
                  Logger.log("MeMenuWidgetHandler open inventory: " + _loc3_.inventoryType);
                  switch(_loc3_.inventoryType)
                  {
                     case RoomWidgetOpenInventoryMessage.const_962:
                        this._catalog.openCatalogPage(CatalogPageName.const_1325,true);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_903:
                        this._inventory.toggleInventoryPage(InventoryCategory.const_269);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1315:
                        this._inventory.toggleInventoryPage(InventoryCategory.const_78);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1324:
                        break;
                     default:
                        Logger.log("MeMenuWidgetHandler: unknown inventory type: " + _loc3_.inventoryType);
                  }
               }
               break;
            case RoomWidgetSelectEffectMessage.const_796:
            case RoomWidgetStopEffectMessage.const_562:
               Logger.log("STOP ALL EFFECTS");
               if(this._inventory != null)
               {
                  this._inventory.deselectAllEffects();
               }
               break;
            case RoomWidgetSetToolbarIconMessage.const_963:
               _loc4_ = param1 as RoomWidgetSetToolbarIconMessage;
               switch(_loc4_.widgetType)
               {
                  case RoomWidgetSetToolbarIconMessage.const_1446:
                     break;
                  default:
                     Logger.log("MeMenuWidgetHandler: unknown icon widget type: " + _loc4_.widgetType);
               }
               break;
            case RoomWidgetNavigateToRoomMessage.const_941:
               Logger.log("MeMenuWidgetHandler: GO HOME");
               if(this._container != null)
               {
                  this._container.navigator.goToHomeRoom();
               }
               break;
            case RoomWidgetShowOwnRoomsMessage.const_571:
               if(this._container != null)
               {
                  this._container.navigator.showOwnRooms();
               }
               break;
            case RoomWidgetToolbarMessage.const_567:
               _loc5_ = param1 as RoomWidgetToolbarMessage;
               if(!_loc5_ || !this._container || !this._container.events)
               {
                  return null;
               }
               if(this._toolbar)
               {
                  this._toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.MEMENU,_loc5_.window));
                  if(this._inventory != null)
                  {
                     _loc12_ = false;
                     if(this._container != null && this._container.sessionDataManager != null)
                     {
                        _loc12_ = this._container.sessionDataManager.hasUserRight("fuse_use_club_dance");
                     }
                     this._container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(this._inventory.clubDays,this._inventory.clubPeriods,this._inventory.clubPastPeriods,_loc12_,this._inventory.clubLevel));
                  }
                  if(this._catalog != null && this._catalog.getPurse() != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetCreditBalanceUpdateEvent(this._catalog.getPurse().credits));
                  }
               }
               if(!this._container.roomSession || !this._container.roomSession.userDataManager)
               {
                  return null;
               }
               if(this._container.roomEngine != null)
               {
                  _loc13_ = this._container.sessionDataManager != null ? int(this._container.sessionDataManager.userId) : -1;
                  _loc14_ = this._container.roomSession.userDataManager.getUserData(_loc13_);
                  if(!_loc14_)
                  {
                     return null;
                  }
                  _loc15_ = 0;
                  _loc16_ = 0;
                  this._container.roomEngine.selectAvatar(_loc15_,_loc16_,_loc14_.id,true);
               }
               break;
            case RoomWidgetToolbarMessage.const_597:
               _loc6_ = param1 as RoomWidgetToolbarMessage;
               if(!_loc6_)
               {
                  return null;
               }
               if(this._toolbar && this._toolbar.events)
               {
                  this._toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_457,HabboToolbarIconEnum.MEMENU,_loc6_.window));
               }
               break;
            case RoomWidgetAvatarEditorMessage.const_361:
               Logger.log("MeMenuWidgetHandler: Open avatar editor...");
               if(this._container)
               {
                  _loc17_ = param1 as RoomWidgetAvatarEditorMessage;
                  _loc18_ = _loc17_.context;
                  this._container.avatarEditor.openEditor(_loc18_,this);
                  _loc19_ = this._container.sessionDataManager.figure;
                  _loc20_ = this._container.sessionDataManager.gender;
                  _loc21_ = 0;
                  if(this._container.sessionDataManager.hasUserRight("fuse_use_club_outfits"))
                  {
                     _loc21_ = 0;
                  }
                  if(this._container.sessionDataManager.hasUserRight("fuse_use_vip_outfits"))
                  {
                     _loc21_ = 0;
                  }
                  this._container.avatarEditor.loadAvatarInEditor(_loc19_,_loc20_,_loc21_);
                  if(this._container.habboHelp && this._container.habboHelp.events)
                  {
                     this._container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_443));
                  }
               }
               break;
            case RoomWidgetGetSettingsMessage.const_634:
               this._container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_353,this._container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_566:
               this._container.soundManager.volume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               this._container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_353,this._container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_707:
               this._container.soundManager.previewVolume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               this._container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_353,this._container.soundManager.volume));
               break;
            case RoomWidgetAvatarEditorMessage.const_648:
               if(this._container.habboHelp && this._container.habboHelp.events)
               {
                  this._container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_478));
               }
               break;
            case RoomWidgetClothingChangeMessage.const_375:
               this._container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_564));
               break;
            default:
               Logger.log("Unhandled message in MeMenuWidgetHandler: " + param1.type);
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
         if(this._container)
         {
            this._container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
         }
      }
      
      private function onAvatarEffectsChanged(param1:Event = null) : void
      {
         var _loc2_:* = null;
         if(this._container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Effects Have Changed Event...\t");
         if(this._inventory != null)
         {
            _loc2_ = this._inventory.getAvatarEffects();
            this._container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc2_));
         }
      }
      
      private function onAvatarEditorClosed(param1:Event = null) : void
      {
         if(this._container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Editor Closed Event...");
         this._container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_596));
      }
      
      private function onHabboClubSubscriptionChanged(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         if(this._inventory != null)
         {
            _loc2_ = false;
            if(this._container != null && this._container.sessionDataManager != null)
            {
               _loc2_ = this._container.sessionDataManager.hasUserRight("fuse_use_club_dance");
            }
            this._container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(this._inventory.clubDays,this._inventory.clubPeriods,this._inventory.clubPastPeriods,_loc2_,this._inventory.clubLevel));
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         if(this._container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = param1.userId == this._container.sessionDataManager.userId;
         if(_loc2_)
         {
            this.setMeMenuToolbarIcon();
         }
         if(this._container != null && this._container.events != null)
         {
         }
      }
      
      private function onCreditBalance(param1:SessionCreditBalanceEvent) : void
      {
         if(param1 == null || this._container == null || this._container.events == null)
         {
            return;
         }
         this._container.events.dispatchEvent(new RoomWidgetCreditBalanceUpdateEvent(param1.credits));
      }
      
      private function onHelpTutorialEvent(param1:HabboHelpTutorialEvent) : void
      {
         if(this._container == null)
         {
            return;
         }
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_104:
               this._container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_104));
               break;
            case HabboHelpTutorialEvent.const_528:
               this._container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_484));
         }
      }
      
      public function saveFigure(param1:String, param2:String) : void
      {
         if(this._container == null)
         {
            return;
         }
         this._container.roomSession.sendUpdateFigureData(param1,param2);
         this._container.avatarEditor.close();
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.var_1401 = "";
         this.setMeMenuToolbarIcon();
      }
   }
}
