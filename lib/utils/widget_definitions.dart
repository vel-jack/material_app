const nodeInkwell = {
  'w_ink_well': {
    'child': null,
    'on_tap': null,
    'on_long_press': null,
  }
};

const nodeScaffold = {
  'scaffold': {
    'appBar': null, // custom app bar with inkwell
    'body': null, // custom body with inkwell
  },
};

const nodeLayouts = {
  'l_container': {
    'width': null,
    'height': null,
    'decoration': null,
    'child': null,
  },
  'l_center': {
    'child': null,
  },
  'l_row': {
    'children': [],
  },
  'l_column': {},
  'l_expanded': {},
  'l_sized_box': {},
  'l_stack': {},
  'l_flexible': {},
  // 'l_wrap':{},
  'l_list_tile': {},
  'l_list_view': {},
  'l_list_view_builder': {},
};

const nodeAppBar = {
  'a_app_bar': {},
  // 'a_bottom_bar': {},
  // sliver app bar, tabs, bottom tabs
};

const nodeDialogs = {
  'sd_alert_dialog': {},
  'sd_simple_dialog': {},
  'sd_snackbar': {},
  // time picker, date picker, date range
};

const nodeWidgets = {
  'w_icon': {
    'icon': 'add',
    'size': 24.0,
    'color': 'black',
  },
  'w_text': {
    'text': 'Hola',
    'style': null,
    'text_align': null,
    'overflow': null
  },
  // 'w_image': {},
  // 'w_text_form_field':{},
};
const nodeButtons = {
  'b_elevated_button': {},
  'b_text_button': {},
  'b_outlined_button': {},
  'b_icon_button': {},
  // need to add material button and some buttons
};

const nodeStyles = {
  'text_style': {
    'color': 'black',
    'font_size': null,
    'font_weight': null,
  },
  // button style and others
};

final nodeDecorations = {
  'decoration': {},
};
