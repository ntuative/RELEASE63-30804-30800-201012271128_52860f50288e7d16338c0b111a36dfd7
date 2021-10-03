package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_794;
         param1["bitmap"] = const_820;
         param1["border"] = const_791;
         param1["border_notify"] = const_1350;
         param1["button"] = const_406;
         param1["button_thick"] = const_699;
         param1["button_icon"] = const_1362;
         param1["button_group_left"] = const_587;
         param1["button_group_center"] = const_603;
         param1["button_group_right"] = const_682;
         param1["canvas"] = const_805;
         param1["checkbox"] = const_643;
         param1["closebutton"] = const_1116;
         param1["container"] = const_377;
         param1["container_button"] = const_737;
         param1["display_object_wrapper"] = const_619;
         param1["dropmenu"] = const_497;
         param1["dropmenu_item"] = const_499;
         param1["frame"] = const_320;
         param1["frame_notify"] = const_1415;
         param1["header"] = const_743;
         param1["html"] = const_1034;
         param1["icon"] = const_987;
         param1["itemgrid"] = const_1079;
         param1["itemgrid_horizontal"] = const_486;
         param1["itemgrid_vertical"] = const_578;
         param1["itemlist"] = const_897;
         param1["itemlist_horizontal"] = const_355;
         param1["itemlist_vertical"] = const_365;
         param1["maximizebox"] = const_1262;
         param1["menu"] = const_1330;
         param1["menu_item"] = const_1337;
         param1["submenu"] = const_1086;
         param1["minimizebox"] = const_1282;
         param1["notify"] = const_1447;
         param1["null"] = const_722;
         param1["password"] = const_790;
         param1["radiobutton"] = const_768;
         param1["region"] = const_573;
         param1["restorebox"] = const_1450;
         param1["scaler"] = const_706;
         param1["scaler_horizontal"] = const_1305;
         param1["scaler_vertical"] = const_1351;
         param1["scrollbar_horizontal"] = const_473;
         param1["scrollbar_vertical"] = const_725;
         param1["scrollbar_slider_button_up"] = const_1063;
         param1["scrollbar_slider_button_down"] = const_893;
         param1["scrollbar_slider_button_left"] = const_1030;
         param1["scrollbar_slider_button_right"] = const_1057;
         param1["scrollbar_slider_bar_horizontal"] = const_982;
         param1["scrollbar_slider_bar_vertical"] = const_923;
         param1["scrollbar_slider_track_horizontal"] = const_1114;
         param1["scrollbar_slider_track_vertical"] = const_1098;
         param1["scrollable_itemlist"] = const_1317;
         param1["scrollable_itemlist_vertical"] = const_477;
         param1["scrollable_itemlist_horizontal"] = const_977;
         param1["selector"] = const_752;
         param1["selector_list"] = const_686;
         param1["submenu"] = const_1086;
         param1["tab_button"] = const_577;
         param1["tab_container_button"] = const_944;
         param1["tab_context"] = const_313;
         param1["tab_content"] = const_1115;
         param1["tab_selector"] = const_753;
         param1["text"] = const_816;
         param1["input"] = const_714;
         param1["toolbar"] = const_1473;
         param1["tooltip"] = const_330;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
