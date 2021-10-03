package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_844:String = "avatar";
      
      private static const const_548:Number = -0.01;
      
      private static const const_547:Number = -0.409;
      
      private static const const_845:int = 2;
      
      private static const const_1177:Array = [0,0,0];
      
      private static const const_1176:int = 3;
       
      
      private var var_575:AvatarVisualizationData = null;
      
      private var var_461:Map;
      
      private var var_454:Map;
      
      private var var_1066:int = 0;
      
      private var var_868:Boolean;
      
      private var var_535:String;
      
      private var var_790:String;
      
      private var var_1067:int = 0;
      
      private var var_574:BitmapDataAsset;
      
      private var var_844:BitmapDataAsset;
      
      private var var_1598:int = -1;
      
      private var var_1591:int = -1;
      
      private var var_1593:int = -1;
      
      private const const_843:int = 0;
      
      private const const_1578:int = 1;
      
      private const const_1568:int = 2;
      
      private const const_1567:int = 3;
      
      private const const_1178:int = 4;
      
      private var var_1589:int = -1;
      
      private var var_234:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1592:Boolean = false;
      
      private var var_1596:Boolean = false;
      
      private var var_1594:Boolean = false;
      
      private var var_1295:Boolean = false;
      
      private var var_579:Boolean = false;
      
      private var var_1292:int = 0;
      
      private var var_1293:int = 0;
      
      private var var_2252:int = 0;
      
      private var var_681:int = 0;
      
      private var var_680:int = 0;
      
      private var var_573:int = 0;
      
      private var var_1294:int = 0;
      
      private var var_1043:Boolean = false;
      
      private var var_1595:Boolean = false;
      
      private var var_1045:int = 0;
      
      private var var_679:int = 0;
      
      private var var_1597:Boolean = false;
      
      private var var_1044:int = 0;
      
      private var var_51:IAvatarImage = null;
      
      private var var_677:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_461 = new Map();
         this.var_454 = new Map();
         this.var_868 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_461 != null)
         {
            this.resetImages();
            this.var_461.dispose();
            this.var_454.dispose();
            this.var_461 = null;
         }
         this.var_575 = null;
         this.var_574 = null;
         this.var_844 = null;
         super.dispose();
         this.var_677 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_677;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_575 = param1 as AvatarVisualizationData;
         createSprites(this.const_1178);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_218)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_223) > 0 && param3);
            if(_loc5_ != this.var_1592)
            {
               this.var_1592 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_241) > 0;
            if(_loc5_ != this.var_1596)
            {
               this.var_1596 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_463) > 0;
            if(_loc5_ != this.var_1594)
            {
               this.var_1594 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_736) > 0 && param3);
            if(_loc5_ != this.var_1295)
            {
               this.var_1295 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1054) > 0;
            if(_loc5_ != this.var_579)
            {
               this.var_579 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_301);
            if(_loc6_ != this.var_1292)
            {
               this.var_1292 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_435);
            if(_loc7_ != this.var_234)
            {
               this.var_234 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_745);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1104);
            if(_loc6_ != this.var_1293)
            {
               this.var_1293 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_488);
            if(_loc6_ != this.var_681)
            {
               this.var_681 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_527);
            if(_loc6_ != this.var_680)
            {
               this.var_680 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_376);
            if(_loc6_ != this.var_573)
            {
               this.var_573 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_372);
            if(_loc6_ != this.var_1598)
            {
               this.var_1598 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_680 > 0 && param1.getNumber(RoomObjectVariableEnum.const_376) > 0)
            {
               if(this.var_573 != this.var_680)
               {
                  this.var_573 = this.var_680;
                  _loc4_ = true;
               }
            }
            else if(this.var_573 != 0)
            {
               this.var_573 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_819);
            if(_loc6_ != this.var_1045)
            {
               this.var_1045 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_927);
            if(_loc7_ != this.var_790)
            {
               this.var_790 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_180);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_218 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_535 != param1)
         {
            this.var_535 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_461)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_454)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_461.reset();
         this.var_454.reset();
         this.var_51 = null;
         _loc2_ = getSprite(this.const_843);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1295 = false;
         }
         if(this.var_234 == "sit" || this.var_234 == "lay")
         {
            this.var_1294 = param1 / 2;
         }
         else
         {
            this.var_1294 = 0;
         }
         this.var_1595 = false;
         this.var_1043 = false;
         if(this.var_234 == "lay")
         {
            this.var_1043 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1595 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_461.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_454.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_575.getAvatar(this.var_535,param1,this.var_790,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_461.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_454.length >= const_1176)
                  {
                     this.var_454.remove(this.var_454.getKeys().shift());
                  }
                  this.var_454.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_422 != param1.getUpdateID() || this.var_1589 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1598;
            if(this.var_234 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1591 || param4)
            {
               _loc5_ = true;
               this.var_1591 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_51.setDirectionAngle(AvatarSetType.const_32,_loc6_);
            }
            if(_loc7_ != this.var_1593 || param4)
            {
               _loc5_ = true;
               this.var_1593 = _loc7_;
               if(this.var_1593 != this.var_1591)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_51.setDirectionAngle(AvatarSetType.const_42,_loc7_);
               }
            }
            var_422 = param1.getUpdateID();
            this.var_1589 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1578);
         this.var_574 = null;
         if(this.var_234 == "mv" || this.var_234 == "std")
         {
            _loc2_.visible = true;
            if(this.var_574 == null || param1 != var_217)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_574 = this.var_51.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_574 = this.var_51.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_574 != null)
               {
                  _loc2_.asset = this.var_574.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_574 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_844 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1568);
         if(this.var_579)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_844 = this.var_575.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_844 = this.var_575.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_234 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_234 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_844 != null)
            {
               _loc2_.asset = this.var_844.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1567);
         if(this.var_1045 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_575.getAvatarRendererAsset("number_" + this.var_1045 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_575.getAvatarRendererAsset("number_" + this.var_1045 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_234 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_234 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_679 = 1;
               this.var_1597 = true;
               this.var_1044 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_679 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1567);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1597)
         {
            ++this.var_1044;
            if(this.var_1044 < 10)
            {
               return false;
            }
            if(this.var_679 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1044 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_679 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_679 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_679 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_679 = 0;
               this.var_1597 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_575 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = this.var_681;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc12_ || _loc6_ != var_217 || this.var_51 == null)
         {
            if(_loc6_ != var_217)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc10_ != this.var_681)
            {
               _loc11_ = true;
            }
            if(_loc8_ || this.var_51 == null || _loc11_)
            {
               this.var_51 = this.getAvatarImage(_loc6_,this.var_681);
               if(this.var_51 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc15_ = getSprite(this.const_843);
               if(_loc15_ && this.var_51 && this.var_51.isPlaceholder())
               {
                  _loc15_.alpha = 150;
               }
               else if(_loc15_)
               {
                  _loc15_.alpha = 255;
               }
            }
            if(this.var_51 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_51);
            var_217 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc13_:Boolean = _loc9_ || _loc12_ || _loc8_;
         var _loc14_:Boolean = (this.var_868 || this.var_1067 > 0) && param3;
         if(_loc13_)
         {
            this.var_1067 = const_845;
         }
         if(_loc13_ || _loc14_)
         {
            increaseUpdateId();
            --this.var_1067;
            --this.var_1066;
            if(!(this.var_1066 <= 0 || _loc8_ || _loc12_ || _loc7_))
            {
               return;
            }
            this.var_51.updateAnimationByFrames(1);
            this.var_1066 = const_845;
            _loc17_ = this.var_51.getCanvasOffsets();
            if(_loc17_ == null || _loc17_.length < 3)
            {
               _loc17_ = const_1177;
            }
            _loc16_ = getSprite(this.const_843);
            if(_loc16_ != null)
            {
               _loc20_ = this.var_51.getImage(AvatarSetType.const_32,false);
               if(_loc20_ != null)
               {
                  _loc16_.asset = _loc20_;
               }
               if(_loc16_.asset)
               {
                  _loc16_.offsetX = -1 * _loc6_ / 2 + _loc17_[0];
                  _loc16_.offsetY = -_loc16_.asset.height + _loc6_ / 4 + _loc17_[1] + this.var_1294;
               }
               if(this.var_1043)
               {
                  if(this.var_1595)
                  {
                     _loc16_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc16_.relativeDepth = const_547 + _loc17_[2];
                  }
               }
               else
               {
                  _loc16_.relativeDepth = const_548 + _loc17_[2];
               }
            }
            _loc16_ = getSprite(this.const_1568);
            if(_loc16_ != null && _loc16_.visible)
            {
               if(!this.var_1043)
               {
                  _loc16_.relativeDepth = const_548 - 0.01 + _loc17_[2];
               }
               else
               {
                  _loc16_.relativeDepth = const_547 - 0.01 + _loc17_[2];
               }
            }
            this.var_868 = this.var_51.isAnimating();
            _loc18_ = this.const_1178;
            for each(_loc19_ in this.var_51.getSprites())
            {
               if(_loc19_.id == const_844)
               {
                  _loc16_ = getSprite(this.const_843);
                  _loc21_ = this.var_51.getLayerData(_loc19_);
                  _loc22_ = _loc19_.getDirectionOffsetX(this.var_51.getDirection());
                  _loc23_ = _loc19_.getDirectionOffsetY(this.var_51.getDirection());
                  if(_loc21_ != null)
                  {
                     _loc22_ += _loc21_.dx;
                     _loc23_ += _loc21_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  _loc16_.offsetX += _loc22_;
                  _loc16_.offsetY += _loc23_;
               }
               else
               {
                  _loc16_ = getSprite(_loc18_);
                  if(_loc16_ != null)
                  {
                     _loc16_.capturesMouse = false;
                     _loc16_.visible = true;
                     _loc24_ = this.var_51.getLayerData(_loc19_);
                     _loc25_ = 0;
                     _loc26_ = _loc19_.getDirectionOffsetX(this.var_51.getDirection());
                     _loc27_ = _loc19_.getDirectionOffsetY(this.var_51.getDirection());
                     _loc28_ = _loc19_.getDirectionOffsetZ(this.var_51.getDirection());
                     _loc29_ = 0;
                     if(_loc19_.hasDirections)
                     {
                        _loc29_ = this.var_51.getDirection();
                     }
                     if(_loc24_ != null)
                     {
                        _loc25_ = _loc24_.animationFrame;
                        _loc26_ += _loc24_.dx;
                        _loc27_ += _loc24_.dy;
                        _loc29_ += _loc24_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc26_ /= 2;
                        _loc27_ /= 2;
                     }
                     if(_loc29_ < 0)
                     {
                        _loc29_ += 8;
                     }
                     else if(_loc29_ > 7)
                     {
                        _loc29_ -= 8;
                     }
                     _loc30_ = this.var_51.getScale() + "_" + _loc19_.member + "_" + _loc29_ + "_" + _loc25_;
                     _loc31_ = this.var_51.getAsset(_loc30_);
                     if(_loc31_ == null)
                     {
                        continue;
                     }
                     _loc16_.asset = _loc31_.content as BitmapData;
                     _loc16_.offsetX = -_loc31_.offset.x - _loc6_ / 2 + _loc26_;
                     _loc16_.offsetY = -_loc31_.offset.y + _loc27_ + this.var_1294;
                     if(this.var_1043)
                     {
                        _loc16_.relativeDepth = const_547 - 0.001 * spriteCount * _loc28_;
                     }
                     else
                     {
                        _loc16_.relativeDepth = const_548 - 0.001 * spriteCount * _loc28_;
                     }
                     if(_loc19_.ink == 33)
                     {
                        _loc16_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc16_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc18_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_350,this.var_234,this._postureParameter);
         if(this.var_1292 > 0)
         {
            param1.appendAction(AvatarAction.const_276,AvatarAction.const_1263[this.var_1292]);
         }
         if(this.var_1293 > 0)
         {
            param1.appendAction(AvatarAction.const_679,this.var_1293);
         }
         if(this.var_2252 > 0)
         {
            param1.appendAction(AvatarAction.const_705,this.var_2252);
         }
         if(this.var_680 > 0)
         {
            param1.appendAction(AvatarAction.const_620,this.var_680);
         }
         if(this.var_573 > 0)
         {
            param1.appendAction(AvatarAction.const_785,this.var_573);
         }
         if(this.var_1592)
         {
            param1.appendAction(AvatarAction.const_264);
         }
         if(this.var_1594 || this.var_1295)
         {
            param1.appendAction(AvatarAction.const_493);
         }
         if(this.var_1596)
         {
            param1.appendAction(AvatarAction.const_248);
         }
         if(this.var_681 > 0)
         {
            param1.appendAction(AvatarAction.const_285,this.var_681);
         }
         param1.endActionAppends();
         this.var_868 = param1.isAnimating();
         var _loc2_:int = this.const_1178;
         for each(_loc3_ in this.var_51.getSprites())
         {
            if(_loc3_.id != const_844)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
